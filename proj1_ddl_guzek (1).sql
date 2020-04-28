DROP DATABASE IF EXISTS zoo;
CREATE DATABASE zoo;
USE zoo;

SET NAMES utf8;
SET character_set_client = utf8mb4;


-- Autor: Damian Guzek s167911

-- Instrukcje tworzące bazę danych 
CREATE TABLE karma (
  id_karma INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nazwa VARCHAR(32)  NOT NULL  ,
  stan INT  NOT NULL DEFAULT 0   ,
PRIMARY KEY(id_karma));
ALTER TABLE karma AUTO_INCREMENT=60001;


CREATE TABLE pracownicy (
  id_pracownik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  stanowisko VARCHAR(32)  NULL ,
  sekcja  VARCHAR(32)  NULL    ,
PRIMARY KEY(id_pracownik));
ALTER TABLE pracownicy AUTO_INCREMENT=10001;


CREATE TABLE klatki (
  id_klatka INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  id_pracownik INTEGER UNSIGNED  NOT NULL  ,
  kontrola DATE  NOT NULL  ,
  darowizna FLOAT  NULL DEFAULT 0   ,
PRIMARY KEY(id_klatka),
FOREIGN KEY (id_pracownik) REFERENCES pracownicy(id_pracownik)); 
ALTER TABLE klatki AUTO_INCREMENT=30001;


CREATE TABLE karma_klatki (
  id_karma INTEGER UNSIGNED  NOT NULL  ,
  id_klatka INTEGER UNSIGNED  NOT NULL ,
  FOREIGN KEY (id_karma) REFERENCES karma(id_karma),
  FOREIGN KEY (id_klatka) REFERENCES klatki(id_klatka)
);


CREATE TABLE rodo (
  id_pracownik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  imie VARCHAR(32)  NOT NULL  ,
  nazwisko VARCHAR(32)  NOT NULL  ,
  telefon INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_pracownik),
FOREIGN KEY (id_pracownik) REFERENCES pracownicy(id_pracownik)
);


CREATE TABLE zwierzeta (
  id_zwierze INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  id_klatka INTEGER UNSIGNED  NOT NULL  ,
  gatunek VARCHAR(32)  NOT NULL  ,
  rok_urodzenia INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_zwierze),
FOREIGN KEY (id_klatka) REFERENCES klatki(id_klatka)
);
ALTER TABLE zwierzeta AUTO_INCREMENT=20001;


CREATE TABLE wycieczki (
  id_wycieczka INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  id_pracownik INTEGER UNSIGNED  NOT NULL  ,
  data_wycieczka DATE  NOT NULL    ,
PRIMARY KEY(id_wycieczka),
FOREIGN KEY(id_pracownik) REFERENCES pracownicy(id_pracownik));
ALTER TABLE wycieczki AUTO_INCREMENT=50001;


CREATE TABLE szczepienia (
  id_szczepienie INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  id_pracownik INTEGER UNSIGNED  NOT NULL  ,
  id_zwierze INTEGER UNSIGNED  NOT NULL  ,
  data_szczepienie DATE  NOT NULL    ,
PRIMARY KEY(id_szczepienie),
FOREIGN KEY (id_zwierze) REFERENCES zwierzeta(id_zwierze),
FOREIGN KEY(id_pracownik) REFERENCES pracownicy(id_pracownik)
);
ALTER TABLE szczepienia AUTO_INCREMENT=40001;

-- Instrukcje dodajace przykladowe dane
INSERT INTO karma VALUES (NULL,'allium',150);
INSERT INTO karma VALUES (NULL,'canna',117);
INSERT INTO karma VALUES (NULL,'dolichos',186);
INSERT INTO karma VALUES (NULL,'hedera',84);
INSERT INTO karma VALUES (NULL,'lobelia',58);
INSERT INTO karma VALUES (NULL,'pinus',268);
INSERT INTO karma VALUES (NULL,'vinica',22);
INSERT INTO karma VALUES (NULL,'phormium',280);
INSERT INTO karma VALUES (NULL,'lupinus',523);
INSERT INTO karma VALUES (NULL,'wolowina',500);

INSERT INTO pracownicy VALUES (NULL,'kierownik','ssaki');
INSERT INTO pracownicy VALUES (NULL,'kierownik','ptaki');
INSERT INTO pracownicy VALUES (NULL,'kierownik','gady');
INSERT INTO pracownicy VALUES (NULL,'opiekun','ssaki');
INSERT INTO pracownicy VALUES (NULL,'opiekun','ssaki');
INSERT INTO pracownicy VALUES (NULL,'opiekun','ptaki');
INSERT INTO pracownicy VALUES (NULL,'opiekun','ptaki');
INSERT INTO pracownicy VALUES (NULL,'opiekun','gady');
INSERT INTO pracownicy VALUES (NULL,'opiekun','gady');
INSERT INTO pracownicy VALUES (NULL,'doradca','ssaki');


INSERT INTO klatki VALUES (NULL,10004,'2019-05-31',1109);
INSERT INTO klatki VALUES (NULL,10005,'2019-06-05',23347);
INSERT INTO klatki VALUES (NULL,10005,'2019-06-21',16955);
INSERT INTO klatki VALUES (NULL,10004,'2019-07-04',6707);
INSERT INTO klatki VALUES (NULL,10004,'2019-09-17',4926);
INSERT INTO klatki VALUES (NULL,10005,'2019-10-18',2377);
INSERT INTO klatki VALUES (NULL,10005,'2019-10-30',3852);
INSERT INTO klatki VALUES (NULL,10004,'2019-11-04',2671);
INSERT INTO klatki VALUES (NULL,10006,'2019-11-28',543);
INSERT INTO klatki VALUES (NULL,10007,'2020-01-06',1903);
INSERT INTO klatki VALUES (NULL,10006,'2020-01-24',1293);
INSERT INTO klatki VALUES (NULL,10008,'2020-01-27',1449);
INSERT INTO klatki VALUES (NULL,10008,'2020-02-03',1093);
INSERT INTO klatki VALUES (NULL,10009,'2020-02-19',1616);
INSERT INTO klatki VALUES (NULL,10001,'2020-02-26',5);

INSERT INTO karma_klatki VALUES (60001,30006);
INSERT INTO karma_klatki VALUES (60001,30003);
INSERT INTO karma_klatki VALUES (60001,30004);
INSERT INTO karma_klatki VALUES (60002,30010);
INSERT INTO karma_klatki VALUES (60002,30004);
INSERT INTO karma_klatki VALUES (60003,30005);
INSERT INTO karma_klatki VALUES (60003,30006);
INSERT INTO karma_klatki VALUES (60003,30012);
INSERT INTO karma_klatki VALUES (60004,30011);
INSERT INTO karma_klatki VALUES (60005,30001);
INSERT INTO karma_klatki VALUES (60005,30008);
INSERT INTO karma_klatki VALUES (60006,30014);
INSERT INTO karma_klatki VALUES (60007,30001);
INSERT INTO karma_klatki VALUES (60007,30009);
INSERT INTO karma_klatki VALUES (60007,30013);
INSERT INTO karma_klatki VALUES (60008,30002);
INSERT INTO karma_klatki VALUES (60009,30014);
INSERT INTO karma_klatki VALUES (60009,30002);
INSERT INTO karma_klatki VALUES (60010,30007);


INSERT INTO rodo VALUES (10001,'Cezary','Centkowski',198008968);
INSERT INTO rodo VALUES (10002,'Karol','Piasecki',116997913);
INSERT INTO rodo VALUES (10003,'Jakub','Szczepaniak',874954844);
INSERT INTO rodo VALUES (10004,'Karolina','Kleina',229333986);
INSERT INTO rodo VALUES (10005,'Martyna','Waras',466637069);
INSERT INTO rodo VALUES (10006,'Alan','Tomaszewski',236946054);
INSERT INTO rodo VALUES (10007,'Mateusz','Korda',601405284);
INSERT INTO rodo VALUES (10008,'Aleksandra','Warmbier',316374202);
INSERT INTO rodo VALUES (10009,'Luiza','Piekarska',863448028);
INSERT INTO rodo VALUES (10010,'Dominik','Chmielewski',239653596);

INSERT INTO zwierzeta VALUES (NULL,30001,'alpaka',1979);
INSERT INTO zwierzeta VALUES (NULL,30001,'alpaka',2017);
INSERT INTO zwierzeta VALUES (NULL,30002,'fenek',2007);
INSERT INTO zwierzeta VALUES (NULL,30002,'fenek',1987);
INSERT INTO zwierzeta VALUES (NULL,30002,'fenek',2019);
INSERT INTO zwierzeta VALUES (NULL,30003,'gepard',1979);
INSERT INTO zwierzeta VALUES (NULL,30004,'gibon',2014);
INSERT INTO zwierzeta VALUES (NULL,30004,'gibon',2008);
INSERT INTO zwierzeta VALUES (NULL,30005,'lama',1998);
INSERT INTO zwierzeta VALUES (NULL,30006,'pantera',1988);
INSERT INTO zwierzeta VALUES (NULL,30007,'lew',2018);
INSERT INTO zwierzeta VALUES (NULL,30008,'wilk',1982);
INSERT INTO zwierzeta VALUES (NULL,30009,'ara',1990);
INSERT INTO zwierzeta VALUES (NULL,30010,'nikobarczyk',1984);
INSERT INTO zwierzeta VALUES (NULL,30010,'nikobarczyk',1998);
INSERT INTO zwierzeta VALUES (NULL,30011,'pelikan',2010);
INSERT INTO zwierzeta VALUES (NULL,30011,'pelikan',1999);
INSERT INTO zwierzeta VALUES (NULL,30012,'anakonda',2015);
INSERT INTO zwierzeta VALUES (NULL,30013,'krokodyl',2009);
INSERT INTO zwierzeta VALUES (NULL,30014,'pyton',2010);

INSERT INTO wycieczki VALUES (NULL,10002,'2019-07-09');
INSERT INTO wycieczki VALUES (NULL,10001,'2019-07-29');
INSERT INTO wycieczki VALUES (NULL,10001,'2019-10-21');
INSERT INTO wycieczki VALUES (NULL,10002,'2019-10-21');
INSERT INTO wycieczki VALUES (NULL,10003,'2019-11-28');
INSERT INTO wycieczki VALUES (NULL,10001,'2019-12-10');
INSERT INTO wycieczki VALUES (NULL,10003,'2019-12-19');
INSERT INTO wycieczki VALUES (NULL,10001,'2019-12-24');
INSERT INTO wycieczki VALUES (NULL,10002,'2019-12-24');
INSERT INTO wycieczki VALUES (NULL,10003,'2019-12-24');
INSERT INTO wycieczki VALUES (NULL,10001,'2020-01-14');


INSERT INTO szczepienia VALUES (NULL,10001, 20004,'2019-04-09');
INSERT INTO szczepienia VALUES (NULL,10003, 20019,'2019-04-09');
INSERT INTO szczepienia VALUES (NULL,10002, 20013,'2019-05-02');
INSERT INTO szczepienia VALUES (NULL,10001, 20008,'2019-05-02');
INSERT INTO szczepienia VALUES (NULL,10002, 20016,'2019-05-20');
INSERT INTO szczepienia VALUES (NULL,10001, 20006,'2019-05-23');
INSERT INTO szczepienia VALUES (NULL,10001, 20003,'2019-05-30');
INSERT INTO szczepienia VALUES (NULL,10003, 20018,'2019-06-05');
INSERT INTO szczepienia VALUES (NULL,10001, 20005,'2019-06-25');
INSERT INTO szczepienia VALUES (NULL,10001, 20011,'2019-07-16');
INSERT INTO szczepienia VALUES (NULL,10003, 20018,'2019-09-13');
INSERT INTO szczepienia VALUES (NULL,10002, 20013,'2019-09-24');
INSERT INTO szczepienia VALUES (NULL,10001, 20007,'2019-10-30');
INSERT INTO szczepienia VALUES (NULL,10001, 20001,'2019-12-16');
INSERT INTO szczepienia VALUES (NULL,10001, 20010,'2020-01-08');
INSERT INTO szczepienia VALUES (NULL,10002, 20014,'2020-01-13');
INSERT INTO szczepienia VALUES (NULL,10001, 20009,'2020-01-24');
INSERT INTO szczepienia VALUES (NULL,10002, 20015,'2020-01-28');
INSERT INTO szczepienia VALUES (NULL,10002, 20016,'2020-01-31');
INSERT INTO szczepienia VALUES (NULL,10001, 20002,'2020-02-10');
INSERT INTO szczepienia VALUES (NULL,10001, 20012,'2020-02-11');
INSERT INTO szczepienia VALUES (NULL,10003, 20019,'2020-02-14');
INSERT INTO szczepienia VALUES (NULL,10002, 20017,'2020-02-20');
INSERT INTO szczepienia VALUES (NULL,10002, 20017,'2020-03-02');
INSERT INTO szczepienia VALUES (NULL,10001, 20003,'2020-03-04');
INSERT INTO szczepienia VALUES (NULL,10001, 20004,'2020-03-06');
INSERT INTO szczepienia VALUES (NULL,10003, 20020,'2020-03-18');

-- Widok 1
# W zoo obowiazuje zasada skladania regularnych zamowien na karmy, ktorych stan na terenie zoo jest mniejszy niz 100 porcji
# tym zapytaniem sprawdzamy jakie najmniejsze zamowienie powinnismy zlozyc u dostawcy karmy w najblizszym czasie
CREATE VIEW widok1 AS
SELECT nazwa, 100-stan AS 'zamowienie' FROM karma 
WHERE stan<100;

-- Widok 2
#Wyszukujemy szczepiena wykonane w 4 kwartale 2019 roku
CREATE VIEW widok2 AS
SELECT id_zwierze, data_szczepienie FROM szczepienia 
WHERE data_szczepienie 
BETWEEN '2019-09-01' AND '2019-12-31';

-- Widok 3
# stazysta: widzisz, ze jedno ze zwierzat czuje sie zle, sprawdzasz w ksiazeczke przy klatce, ze osoba ktora wykonywala ostatnio szczepienie
# legitymuje sie numerem id 10002, idziesz zatem do biura zoo, aby dowiedziec sie od informatykow pod jaki numer telefonu
# musisz zadzwonic, aby dowiedziec sie co zrobic w tej sytuacji.
CREATE VIEW widok3 AS
SELECT pracownicy.id_pracownik, imie, nazwisko, telefon 
FROM pracownicy JOIN rodo ON pracownicy.id_pracownik=rodo.id_pracownik  
WHERE pracownicy.id_pracownik=10002;

-- Widok 4
# przechodzac kolejny raz kolo klatki 30001 i widzisz ze zwirzeta niechetnie jedza swoja karme,
# idziesz sie dowiedziec jak sie nazywa ta karma oraz jaki jest jej stan, aby moc zaoferowac zmiane diety zwierzat
CREATE VIEW widok4 AS
SELECT klatki.id_klatka, nazwa, stan 
FROM klatki JOIN karma_klatki ON klatki.id_klatka=karma_klatki.id_klatka 
JOIN karma ON karma_klatki.id_karma=karma.id_karma 
WHERE klatki.id_klatka=30001;

-- Widok 5
# podzapytanie ; w zwiazku z nadchodzacym dniem dziecka, zoo postanawia udekorowac wszystkie klatki ze zwierzetami
# ktore urodzily sie po 2013 roku. Pomysl chcesz skonsultowac opiekunami klatek
CREATE VIEW widok5 AS
SELECT imie, nazwisko, telefon FROM rodo WHERE id_pracownik IN 
		(SELECT id_pracownik FROM klatki WHERE id_klatka IN 
				(SELECT id_klatka FROM zwierzeta WHERE rok_urodzenia>2013));

-- Widok 6
#Dyrektor zoo wpadl na pomysl wyposazenia stoiska przed kazda klatka o 
# urzadzenia interaktywne. Koszt jednego urzadzenia to okolo 3000zl
# prosi nas o szybka analize, czy mozemy pokryc zakup tych urzadzen z datkow na klatki
# oraz czy bedzie to fair wzgledem roznych zwierzat 
CREATE VIEW widok6 AS
SELECT 
	sum(darowizna), 
	avg(darowizna), 
    max(darowizna), 
    min(darowizna), 
    (SELECT Count(*) FROM klatki WHERE darowizna<3000) as '<3000',
    (SELECT count(*) FROM klatki WHERE darowizna>3000) as '>3000' 
FROM klatki;

-- Widok 7
# liczba pracownikow w sekcji
CREATE VIEW widok7 AS
SELECT sekcja,count(*) FROM pracownicy 
GROUP BY sekcja;

-- Widok 8
# prezydent Polski przyjzdza do twojego zoo. szukasz osob ktore przeprowadzily
# co najmniej 4 wycieczki aby oprowadzic prezydenta po naszym zoo
CREATE VIEW widok8 AS
SELECT imie, nazwisko FROM rodo WHERE id_pracownik IN 
		(SELECT id_pracownik FROM wycieczki GROUP BY id_pracownik HAVING count(*)>3); 

