<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autóbérlés</title>
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

    <!-- Hero szekció -->
    <div class="container">
        <section class="hero">
            <div class="hero-content">
                <h1>Üdvözöljük az Autóbérlés Oldalán</h1>
                <p>Keressen és béreljen autót egyszerűen és gyorsan!</p>
                <a href="/cars" class="btn"><b>Autók megtekintése</b></a>
            </div>
        </section>
    </div>

    <!-- Szolgáltatások szekció -->
    <section class="services">
        <div class="container">
            <h2>Szolgáltatásaink</h2>
            <div class="service">
                <h3>Széles választék</h3>
                <p>Különböző típusú és méretű autók közül válogathat.</p>
            </div>
            <div class="service">
                <h3>Kedvező árak</h3>
                <p>Versenyképes árakat és rugalmas bérlési feltételeket kínálunk.</p>
            </div>
            <div class="service">
                <h3>Kiváló ügyfélszolgálat</h3>
                <p>Ügyfélszolgálatunk készséggel áll rendelkezésére minden kérdésben.</p>
            </div>
        </div>
    </section>

    <!-- Lábléc -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Autóbérlés. Minden jog fenntartva.</p>
            <p>Elérhetőség: <a href="mailto:info@autoberles.hu">info@autoberles.hu</a> | Telefon: +36 1 234 5678</p>
        </div>
    </footer>
</body>
</html>
