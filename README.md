Autó bérlési rendszer dokumentáció
Készítette: Hegyi Alex
Dátum: 2024.05.30

Tartalomjegyzék:
1.	Bevezetés
2.	Telepítési útmutató
3.	Használati útmutató
4.	Részletes technikai leírás
5.	Jövőbeli fejlesztések
6.	Mellékletek

Bevezetés
Áttekintés
Az Autó Bérlési Rendszer egy webalapú alkalmazás, amely lehetővé teszi a felhasználók számára, hogy online foglaljanak autót egy autókölcsönző cégnél. Az alkalmazás segítségével a felhasználók regisztrálhatnak, bejelentkezhetnek, megtekinthetik az elérhető autókat, és foglalásokat készíthetnek.
Cél
A rendszer célja, hogy egyszerű és hatékony megoldást nyújtson az autók online foglalására, csökkentve ezzel az autókölcsönző cégek adminisztrációs terheit és javítva a felhasználói élményt.
Célközönség
Az alkalmazás célközönsége elsősorban autókölcsönző cégek és ügyfeleik, akik gyakran bérelnek autót és igénylik az online foglalási lehetőséget.

Telepítési útmutató
Rendszerkövetelmények
- Python 3.12.3
-	Bottle framework
-	SQLite adatbázis-kezelő rendszer

Használati útmutató
Felhasználói felület bemutatása
Navigációs sáv
A navigációs sáv lehetővé teszi az oldalak közötti navigációt. A felhasználók bejelentkezhetnek vagy regisztrálhatnak, és hozzáférhetnek a különböző funkciókhoz, például az autók listázásához és a foglalások megtekintéséhez.
Autó foglalása
A felhasználók a foglalási űrlap segítségével foglalhatnak autót. Az űrlap kitöltése után a rendszer ellenőrzi, hogy az autó elérhető-e a megadott időpontban, majd rögzíti a foglalást.
 
Foglalási naptár
A naptárban a felhasználók megtekinthetik az autók foglalásait. Ez segít a felhasználóknak abban, hogy megtalálják a számukra legmegfelelőbb időpontot az autó foglalására.
Funkciók leírása
Bejelentkezés és regisztráció
A felhasználók bejelentkezhetnek a meglévő fiókjukkal vagy új fiókot regisztrálhatnak. A bejelentkezett felhasználók hozzáférhetnek a személyes adataikhoz és foglalásaikhoz.
Autók listázása
Az autók listája megtekinthető a főoldalról. A felhasználók böngészhetik a rendelkezésre álló autókat és megtekinthetik azok részletes adatait.
Autók foglalása
Az autó foglalási űrlap kitöltésével a felhasználók foglalhatnak autót. Az űrlap tartalmazza a kezdő és befejező dátumokat, valamint a szükséges személyes adatokat.
Foglalások megtekintése és kezelése
A felhasználók megtekinthetik és kezelhetik a saját foglalásaikat. A foglalási oldal tartalmazza a felhasználó összes korábbi és aktuális foglalását, valamint lehetőséget biztosít azok módosítására vagy törlésére.
Részletes technikai leírás
•	Users: Felhasználók adatai
  o	id: 		Egyedi azonosító
  o	LastName:	Vezetéknév
  o	FirstName:	keresztnév
  o	password:	Jelszó
  o	email:		Email
  o	PhoneNumber: Telefonszám
  o	Country:	Ország
  o	City:		Város
  o	Postcode:	Irányítószám
  o	Address:	Cím
  o	BirthDate:	Születési dátum
  o	RegistrationDate: Regisztrációs dátum
  o	IsAdmin:	Admin-e
•	Cars: Autók adatai
  o	car_id:		Egyedi azonosító
  o	brand:		Márka
  o	model:		Modell
  o	fuel_type:	Üzemanyag típus
  o	passenger_capacity: Férőhelyek száma
  o	car_type:	Autó típusa
  o	price_per_day: Napi díj
  o	availability_status: Elérhetőség
  o	year:		Gyártási év
  o	color:		Szín
  o	license_plate:	 Rendszámtábla
  o	milage:	Kilométer számláló
  o	image_url:	Kép neve
  o	description:	Leírás
•	Bookings: foglalások adatai
  o	booking_id:	Foglalás egyedi azonosítója
  o	car_id:		Foglalt autó azonosítója
  o	user_id:	Felhasználó azonosítója
  o	start_date:	Foglalás kezdete
  o	end_date:	Foglalás vége
Táblák közötti kapcsolatok
A Bookings tábla kapcsolódik a Users és Cars táblákhoz. A user_id mező a Bookings táblában a Users tábla user_id mezőjére hivatkozik, míg a car_id mező a Cars tábla car_id mezőjére.
Architektúra
Backend
A Bottle framework szolgál a szerver oldal megvalósítására. Az alkalmazás különböző útvonalakat és funkciókat biztosít, amelyek lehetővé teszik az adatbázis műveletek végrehajtását és a HTML oldalak megjelenítését.
Frontend
HTML, CSS és JavaScript technológiák használatosak az alkalmazás felhasználói felületének megvalósításához. A frontend feladata az adatbeviteli űrlapok és megjelenítési elemek biztosítása.
Fájlstruktúra
my_project/
├── main.py
├── views/
├── static/
├── img/

main: A píthon program
views: ebben a mappában vannak a template-ek
static: ebben a mappában van a CSS és Javascript file
img: ebben a mappában vannak az autók képei

Jövőbeli fejlesztések
Lehetséges bővítések
•	Felhasználói értékelések bevezetése: A felhasználók értékelhetik az autókat és a szolgáltatásokat
•	Mobilalkalmazás fejlesztése: Egy natív mobilalkalmazás kifejlesztése a felhasználói élmény javítása érdekében
•	Bővített jelentések és statisztikák: részletesebb jelentések és statisztikák az adminisztrátorok számára

