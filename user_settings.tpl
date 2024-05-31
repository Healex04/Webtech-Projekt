<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Felhasználói beállítások</title>
    <link rel="stylesheet" href="/static/styles.css">
</head>
<body>
    <!-- Navigációs sáv -->
    <div class="navbar">
        <a href="/" class="right">Főoldal</a>
        <a href="/cars" class="right">Autók</a>
        % if user:
            <div class="dropdown right">
                <button class="dropbtn">{{user[1]}} {{user[2]}}
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="/user_settings" id="dropdownContent">Felhasználói beállítások</a>
                    <a href="/my_bookings" id="dropdownContent">Lefoglalt autóim</a>
                    <a href="/logout" id="dropdownContent">Kijelentkezés</a>
                </div>
            </div>

        % else:
            <a href="/login" class="right">Bejelentkezés</a>
            <a href="/register" class="right">Regisztráció</a>
        % end
    </div>

    <div class="container">
        <h1>Felhasználói beállítások</h1>
        <form action="/user_settings" method="post">
            <div>
                <label for="LastName">Vezetéknév:</label>
                <input type="text" name="LastName" value="{{user[1]}}">
            </div>
            <div>
                <label for="FirstName">Keresztnév:</label>
                <input type="text" name="FirstName" value="{{user[2]}}">
            </div>
            <div>
                <label for="Password">Jelszó:</label>
                <input type="text" name="Password" value="{{user[3]}}">
            </div>
            <div>
                <label for="Email">Keresztnév:</label>
                <input type="text" name="Email" value="{{user[4]}}">
            </div>
            <div>
                <label for="PhoneNumber">Telefonszám:</label>
                <input type="text" name="PhoneNumber" value="{{user[5]}}">
            </div>
            <div>
                <label for="Country">Ország:</label>
                <input type="text" name="Country" value="{{user[6]}}">
            </div>
            <div>
                <label for="City">Város:</label>
                <input type="text" name="City" value="{{user[7]}}">
            </div>
            <div>
                <label for="Postcode">Irányítószám:</label>
                <input type="text" name="Postcode" value="{{user[8]}}">
            </div>
            <div>
                <label for="Address">Cím:</label>
                <input type="text" name="Address" value="{{user[9]}}">
            </div>
            <div>
                <label for="BirthDate">Születési dátum:</label>
                <input type="date" name="BirthDate" value="{{user[10]}}">
            </div>
            <input type="submit" value="Mentés" class="car-details">
        </form>
    </div>
</body>
</html>
