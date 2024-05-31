<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regisztráció</title>
    <link rel="stylesheet" href="/static/styles.css"> 
</head>
<body>
    <!-- Navigációs sáv -->
    <div class="navbar">
        <a href="/" class="right">Főoldal</a>
        <a href="/cars" class="right">Autók</a>
        
        <a href="/login" class="right">Bejelentkezés</a>
        <a href="/register" class="right">Regisztráció</a>
    </div>
    <div class="container">
        <h2>Regisztráció</h2>
        <form action="/register" method="post">
            Vezetéknév: <input type="text" name="LastName"><br>
            Keresztnév: <input type="text" name="FirstName"><br>
            Jelszó: <input type="password" name="password"><br>
            Email: <input type="text" name="email"><br>
            Telefonszám: <input type="text" name="PhoneNumber"><br>
            Ország: <input type="text" name="Country"><br>
            Város: <input type="text" name="City"><br>
            Irányítószám: <input type="text" name="Postcode"><br>
            Cím: <input type="text" name="Address"><br>
            Születési dátum: <input type="date" name="BirthDate"><br>
            <input type="submit" value="Regisztráció">
        </form>
    </div>
</body>
</html>