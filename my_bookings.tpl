<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lefoglalt autóim</title>
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
        <h1>Lefoglalt autóim</h1>
        <table>
            <tr>
                <th>Márka</th>
                <th>Modell</th>
                <th>Kezdő dátum</th>
                <th>Záró dátum</th>
                <th>Művelet</th>
            </tr>
            % for booking in bookings:
                <tr>
                    <td>{{booking[1]}}</td>
                    <td>{{booking[2]}}</td>
                    <td>{{booking[3]}}</td>
                    <td>{{booking[4]}}</td>
                    <td><a href="/cancel_booking/{{booking[0]}}">Törlés</a></td>
                </tr>
            % end
            <a href="/refresh">Frissítés</a>
        </table>
    </div>
</body>
</html>
