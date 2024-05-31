<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autó Részletei</title>
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

    <!-- Autó részletei -->
    <div class="container">
        <h1>{{ car[1] }} {{ car[2] }} Részletei</h1>
        <div class="car-details">
            <img src="/img/{{ car[12] }}" alt="{{ car[1] }} {{ car[2] }}">
            <table class="car-table">
                <tr>
                    <th>Márka</th>
                    <td>{{ car[1] }}</td>
                </tr>
                <tr>
                    <th>Típus</th>
                    <td>{{ car[2] }}</td>
                </tr>
                <tr>
                    <th>Üzemanyag</th>
                    <td>{{ car[3] }}</td>
                </tr>
                <tr>
                    <th>Utasok maximális száma</th>
                    <td>{{ car[4] }}</td>
                </tr>
                <tr>
                    <th>Autó típusa</th>
                    <td>{{ car[5] }}</td>
                </tr>
                <tr>
                    <th>Ár naponta</th>
                    <td>{{ car[6] }} Ft</td>
                </tr>
                <tr>
                    <th>Elérhetőség</th>
                    <td>{{ car[7] }}</td>
                </tr>
                <tr>
                    <th>Gyártási év</th>
                    <td>{{ car[8] }}</td>
                </tr>
                <tr>
                    <th>Az autó színe</th>
                    <td>{{ car[9] }}</td>
                </tr>
                <tr>
                    <th>Rendszámtábla</th>
                    <td>{{ car[10] }}</td>
                </tr>
                <tr>
                    <th>Kilóméteróra</th>
                    <td>{{ car[11] }}</td>
                </tr>
                <tr>
                    <th>Leírás</th>
                    <td>{{ car[13] }}</td>
                </tr>
            </table>
            <a href="/book/{{car[0]}}" class="btn">Foglalás</a>
        </div>
    </div>

    <!-- Bootstrap JS (ha szükséges) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
