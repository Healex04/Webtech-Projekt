from bottle import Bottle, run, template, request, redirect, static_file, response, json_dumps
import sqlite3
from datetime import date
import re
from beaker.middleware import SessionMiddleware

app = Bottle()

session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 300,
    'session.data_dir': './data',
    'session.auto': True
}
wrapped_app = SessionMiddleware(app, session_opts)

def get_db_connection():
    return sqlite3.connect('autoberles.db', timeout=10)

def is_valid_email(email):
    return re.match(r"[^@]+@[^@]+\.[^@]+", email)

@app.route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='./static')

@app.route('/')
def index():
    session = request.environ.get('beaker.session')
    user = session.get('user')
    return template('indexuj', user=user)

@app.route('/register', method=['GET', 'POST'])
def register():
    if request.method == 'POST':
        LastName = request.forms.get('LastName')
        FirstName = request.forms.get('FirstName')
        password = request.forms.get('password')
        email = request.forms.get('email')
        PhoneNumber = request.forms.get('PhoneNumber')
        Country = request.forms.get('Country')
        City = request.forms.get('City')
        Postcode = request.forms.get('Postcode')
        Address = request.forms.get('Address')
        BirthDate = request.forms.get('BirthDate')

        if not (LastName and FirstName and password and email and PhoneNumber and Country and City and Postcode and Address and BirthDate):
            return "All fields are required"
        
        if not is_valid_email(email):
            return "Invalid email format"

        conn = get_db_connection()
        c = conn.cursor()
        c.execute('SELECT * FROM Users WHERE email = ?', (email,))
        if c.fetchone():
            conn.close()
            return "Email already exists"

        try:
            today = date.today()
            c.execute('''
                INSERT INTO Users (LastName, FirstName, password, email, PhoneNumber, Country, City, Postcode, Address, BirthDate, RegistrationDate)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ''', (LastName, FirstName, password, email, PhoneNumber, Country, City, Postcode, Address, BirthDate, today))
            conn.commit()
            return template('registersuccessful')
        except sqlite3.OperationalError as e:
            return f"An error occurred: {e}"
        finally:
            conn.close()
        
    else:
        return template('register')

@app.route('/login', method=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.forms.get('email')
        password = request.forms.get('password')

        conn = get_db_connection()
        c = conn.cursor()
        c.execute('SELECT * FROM Users WHERE email = ? AND password = ?', (email, password))
        user = c.fetchone()
        conn.close()

        if user:
            session = request.environ.get('beaker.session')
            session['user'] = user
            session.save()
            return redirect('/')
        else:
            return template('failedlogin', user = user)
    else:
        return template('login')

@app.route('/logout')
def logout():
    session = request.environ.get('beaker.session')
    session.delete()
    return redirect('/')

@app.route('/cars')
def list_cars():
    session = request.environ.get('beaker.session')
    user = session.get('user')
    if not user:
        return redirect('/login')

    conn = get_db_connection()
    c = conn.cursor()
    c.execute('SELECT car_id, brand, model, price_per_day, image_url FROM Cars')
    cars = c.fetchall()
    conn.close()
    return template('cars', cars=cars, user=user)

@app.route('/img/<filename:path>')
def send_image(filename):
    return static_file(filename, root='img')

@app.route('/car/<id>')
def car_details(id):
    session = request.environ.get('beaker.session')
    user = session.get('user')
    if not user:
        return redirect('/login')

    conn = get_db_connection()
    c = conn.cursor()
    c.execute('SELECT * FROM Cars WHERE car_id = ?', (id,))
    car = c.fetchone()
    conn.close()
    if not car:
        return template('carnotfound', user = user)
    return template('car_details', car=car, user=user)

@app.route('/book/<car_id>', method=['GET', 'POST'])
def book_car(car_id):
    session = request.environ.get('beaker.session')
    user = session.get('user')
    if not user:
        return redirect('/login')

    if request.method == 'POST':
        UserID = user[0]
        StartDate = request.forms.get('StartDate')
        EndDate = request.forms.get('EndDate')

        conn = get_db_connection()
        c = conn.cursor()
        
        c.execute('''
            SELECT * FROM Bookings
            WHERE car_id = ? AND (
                (start_date <= ? AND end_date >= ?) OR
                (start_date <= ? AND end_date >= ?) OR
                (start_date >= ? AND end_date <= ?)
            )
        ''', (car_id, StartDate, StartDate, EndDate, EndDate, StartDate, EndDate))
        
        if c.fetchone():
            conn.close()
            return template('isbooked', user = user)
        

        try:
            c.execute('''
                INSERT INTO Bookings (car_id, user_id, start_date, end_date)
                VALUES (?, ?, ?, ?)
            ''', (car_id, UserID, StartDate, EndDate))
            conn.commit()
            return template('bookingsuccessful', user = user)
        except sqlite3.OperationalError as e:
            return f"An error occurred: {e}"
        finally:
            conn.close()
        
    else:
        conn = get_db_connection()
        c = conn.cursor()
        c.execute('SELECT * FROM Cars WHERE car_id = ?', (car_id,))
        car = c.fetchone()
        if not car:
            return template('carnotfound', user = user)
        
        # Foglalások lekérdezése
        c.execute('SELECT * FROM bookings WHERE car_id = ?', (car_id,))
        bookings = c.fetchall()
        conn.close()

        return template('book_car', car=car, user=user, bookings=bookings)


@app.route('/bookings/<car_id:int>')
def get_bookings(car_id):
    conn = get_db_connection()
    bookings = conn.execute('SELECT * FROM bookings WHERE car_id = ?', (car_id,)).fetchall()
    conn.close()
    events = [{
        'title': 'Foglalás',
        'start': booking[3],
        'end': booking[4]
    } for booking in bookings]
    return json_dumps(events)

@app.route('/user_settings', method=['GET', 'POST'])
def user_settings():
    response.content_type = 'text/html; charset=UTF-8'
    session = request.environ.get('beaker.session')
    user = session.get('user')
    if not user:
        return redirect('/login')
    
    if request.method == 'POST':
        LastName = request.forms.get('LastName')
        FirstName = request.forms.get('FirstName')
        Password = request.forms.get('Password')
        Email = request.forms.get('Email')
        PhoneNumber = request.forms.get('PhoneNumber')
        Country = request.forms.get('Country')
        City = request.forms.get('City')
        Postcode = request.forms.get('Postcode')
        Address = request.forms.get('Address')
        BirthDate = request.forms.get('BirthDate')

        if not (LastName and FirstName and PhoneNumber and Country and City and Postcode and Address and BirthDate):
            return template('allfieldreq', user=user)
        
        conn = get_db_connection()
        c = conn.cursor()

        try:
            c.execute('''
                UPDATE Users SET LastName=?, FirstName=?, password=?, email=?, PhoneNumber=?, Country=?, City=?, Postcode=?, Address=?, BirthDate=?
                WHERE id=?
            ''', (LastName, FirstName,Password, Email, PhoneNumber, Country, City, Postcode, Address, BirthDate, user[0]))
            conn.commit()
            return template('updsucces', user=user)
        except sqlite3.OperationalError as e:
            return f"An error occurred: {e}"
        finally:
            conn.close()
        
    else:
        return template('user_settings', user=user)

@app.route('/my_bookings')
def my_bookings():
    session = request.environ.get('beaker.session')
    user = session.get('user')
    if not user:
        return redirect('/login')

    conn = get_db_connection()
    c = conn.cursor()
    c.execute('''
        SELECT b.booking_id, c.brand, c.model, b.start_date, b.end_date 
        FROM Bookings b
        JOIN Cars c ON b.car_id = c.car_id
        WHERE b.user_id = ?
    ''', (user[0],))
    bookings = c.fetchall()
    conn.close()
    return template('my_bookings', bookings=bookings, user=user)

@app.route('/refresh')
def refresh():
    session = request.environ.get('beaker.session')
    user = session.get('user')
    if not user:
        return redirect('/login')

    conn = get_db_connection()
    c = conn.cursor()
    c.execute('''
        SELECT b.booking_id, c.brand, c.model, b.start_date, b.end_date 
        FROM Bookings b
        JOIN Cars c ON b.car_id = c.car_id
        WHERE b.user_id = ?
    ''', (user[0],))
    bookings = c.fetchall()
    conn.close()
    return template('my_bookings', bookings=bookings, user=user)

@app.route('/cancel_booking/<booking_id>')
def cancel_booking(booking_id):
    session = request.environ.get('beaker.session')
    user = session.get('user')
    if not user:
        return redirect('/login')

    conn = get_db_connection()
    c = conn.cursor()
    try:
        c.execute('DELETE FROM Bookings WHERE booking_id = ? AND user_id = ?', (booking_id, user[0]))
        conn.commit()
        return redirect('/my_bookings')
    except sqlite3.OperationalError as e:
        return f"An error occurred: {e}"
    finally:
        conn.close()

# Route for serving FullCalendar files from the views/fullcalendar-6.1.13 directory
@app.route('/fullcalendar/<filepath:path>')
def server_fullcalendar(filepath):
    return static_file(filepath, root='./views/fullcalendar-6.1.13')

@app.route('/fullcalendar/<filepath:path>')
def server_fullcalendar(filepath):
    return static_file(filepath, root='./views/fullcalendar-6.1.13')

if __name__ == '__main__':
    run(app=wrapped_app, host='localhost', port=8080, debug=True, reloader=True)
