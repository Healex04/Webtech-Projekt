<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autók</title>
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

    <!-- Autók listázása -->
    <div class="container">
        <h1>Autók</h1>
        <div class="card-container">
            % for car in cars:
            <div class="card">
                <img src="/img/{{ car[4] }}" alt="{{ car[1] }} {{ car[2] }}">
                <div class="card-body">
                    <h5>{{ car[1] }} {{ car[2] }}</h5>
                    <p>Ár: {{ car[3] }} Ft/nap</p>
                    <a href="/car/{{car[0]}}" class="btn">Részletek</a>
                </div>
            </div>
            % end
        </div>
    </div>

    <!-- Bootstrap JS (ha szükséges) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
