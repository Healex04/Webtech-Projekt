<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autó Foglalás</title>
    <link rel="stylesheet" href="/static/styles.css">
    <script src="/static/script.js"></script>

    <script src="/fullcalendar/dist/index.global.js"></script>
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
        <h1>Autó foglalása: {{car[1]}} {{car[2]}}</h1>
        <div class="car-details">
            <form action="/book/{{car[0]}}" method="post">
                <input type="hidden" name="UserID" value="1"> <!-- Ezt az értéket a bejelentkezett felhasználó ID-jára kell cserélni -->
                <label for="StartDate">Kezdő dátum:</label>
                <input type="date" name="StartDate" required><br>
                <label for="EndDate">Befejező dátum:</label>
                <input type="date" name="EndDate" required><br>
                <button type="submit">Foglalás</button>
            </form>
        </div>
    </div>
    <div class="container">
        <!-- FullCalendar megjelenítésére szolgáló elem -->
        <div id="calendar"></div>
    </div>

    <script src="/fullcalendar-6.1.13/dist/index.global.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var carId = {{car[0]}};
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialDate: new Date().toISOString().slice(0, 10),
                editable: false,
                selectable: false,
                businessHours: true,
                dayMaxEvents: true,
                firstDay: 1,
                events: '/bookings/' + carId
            });
            calendar.render();
        });
    </script>

</body>
</html>
