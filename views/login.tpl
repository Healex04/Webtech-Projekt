<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bejelentkezés</title>
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
        <h2>Bejelentkezés</h2>
        <form action="/login" method="post">
            Email: <input type="text" name="email"><br>
            Jelszó: <input type="password" name="password"><br>
            <input type="submit" value="Bejelentkezés">
        </form>
    </div>
</body>
</html>