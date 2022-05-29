SET DATEFORMAT dmy
USE master
GO
IF EXISTS(SELECT'True' FROM SYS.DATABASES WHERE NAME='CFM1')
BEGIN
DROP DATABASE CFM1
END
GO
CREATE DATABASE CFM1
GO
USE CFM1
GO
--crearea tabelelor
CREATE TABLE Gara(
					IDGara int primary key,
					Denumire varchar(30),
					Localitate varchar(30)
					)
CREATE TABLE Gara1(
					IDGara int primary key,
					Denumire varchar(30),
					Localitate varchar(30)
					)
Create table Angajat(
					IdAngajat int primary key,
					Functie varchar(20),
					Nume varchar(20),
					Datanasterii date,
					IDNP NVARCHAR(13) UNIQUE,
					IDGara int foreign key references Gara(IDGara)
					)
Create Table Client(
					IDClient int primary key,
					Nume varchar(30),
					DataNasterii date,
					IDNP NVARCHAR(13) unique
					)
Create Table Traseu(
				IDTraseu int primary key,
				IDGARA1 INT FOREIGN KEY REFERENCES GARA(IDGARA),
				IDGARA2 INT FOREIGN KEY REFERENCES GARA1(IDGARA),
				PRET MONEY
				)
Create Table Bilet(
					IDBilet int primary key,
					IDClient int foreign key references Client(IdClient),
					IDTraseu int foreign key references Traseu(IdTraseu),
					Data date
					)
Create Table TransportMarfa(
				IDTransportMarfa int primary key,
				IDClient int foreign key references Client(IdClient),
				IDTraseu int foreign key references Traseu(IdTraseu),
				TipMarfa varchar(40),
				Masa int,
				Data date,
				PRET MONEY
				)
--inserea datelor
INSERT INTO Gara Values
(1,'Chisinau-1', 'Chisinau'),
(2,'Chisinau-1', 'Chisinau'),
(3,'Balti-Oras', 'Balti'),
(4,'Bender',	 'Bender'),
(5,'Straseni',   'Straseni'),
(6,'Ungheni',	 'Ungheni'),
(7,'Moscova',	 'Moscova'),
(8,'Kiev',		 'Kiev'),
(9,'Odesa',		 'Odesa'),
(10,'Bucuresti','Bucuresti'),
(11,'Iasi',		'Iasi'),
(12,'Iasi-Socola','Iasi'),
(13,'Sankt-Petersburg', 'Sankt-Petersburg'),
(14,'Caluga-2', 'Caluga'),
(15,'Minsk', 'Minsk'),
(16,'Bacau',  'Bacau'),
(17,'Focsani','Focsani'),
(18,'Falesti', 'Falesti'),
(19,'Dondusani','Dondusani'),
(20,'Briansc','Briansc')
GO
--COPIEREA TABELULUI GARA IN TAVELUL GARA1
INSERT INTO GARA1
SELECT * FROM GARA
GO

insert into Angajat values
(1, 'Sudor', 'Andrei Popescu', '11.11.1971', 21417429219, 1),
(2, 'Mecanic','Alexandru Ionescu','10.10.1972', 32891739127, 1),
(3, 'Consilier','Soltan Corneliu', '09.09.1973', 321361236121,1),
(4, 'Director', 'Oleg Tofilat', '08.08.1974', 3213198739127, 1),
(5, 'Taxatoare', 'Olga Tofilat', '07.07.1975', 412479187492, 1),
(6, 'Regulator', 'Ion Ceban', '06.06.1976', 3213123112, 1),
(7, 'Masinist', 'Stefan Stoica', '05.05.1977', 1274981274, 1),
(8, 'Masinist', 'Stefan Ursu', '05.05.1977', 1274211274, 2),
(9, 'Taxator', 'Sorin Sirbu', '04.04.1978', 42174928179, 3),
(10,'Masinist', 'Gheorghe Balan', '03.03.1980', 27419472917, 4),
(11,'Masinist', 'Ion Cebotari', '02.02.1981', 32173217132, 5),
(12,'Masinist', 'Mihai Grosu', '01.01.1982', 472618746121, 6),
(13,'Masinist', 'Sergiu Chiric','30.12.1983', 1987429187142, 7),
(14,'Regulator', 'Chirill Unureanu', '29.10.1984', 4124814214, 8),
(15,'Regulator,', 'Cristian Miron', '28.11.1985', 421749217712, 9)

Insert into Client Values
(1, 'Ion Malai', '01.01.1999', 41242141242),
(2, 'Andrei Codreanu','02.02.1998', 412412412),
(3, 'Sergiu Istrati', '03.03.1997', 4189274981),
(4, 'Pavel Stratan', '04.04.1996', 49187249281),
(5, 'Cristian Vicol', '05.05.1995', 412142148142),
(6, 'Radu Toma', '06.06.1994', 1246218764214),
(7, 'Victor Vroitoru', '07.07.1993', 4198241981),
(8, 'Veaceslav Stratulat', '08.08.1992', 123141241),
(9, 'Liviu Topal', '09.09.1991', 42164877416),
(10,'Maxim Tataru', '10.10.1990', 4129847129),
(11, 'Alexandru Pascal', '11.11.2000',498217498127),
(12, 'Mihaela Birca', '12.12.2001', 782418712142),
(13, 'Cristina Bors', '03.01.2000', 481274981212),
(14, 'Diana Mardari', '06.02.1989', 4124281790412),
(15, 'Alnia Postolachi', '10.03.1999', 19827409112)

INSERT INTO Traseu VALUES
 (1,9,16,57),
  (2,17,4,268),
  (3,20,6,149),
  (4,3,12,167),
  (5,18,6,119),
  (6,16,10,305),
  (7,15,8,345),
  (8,5,15,337),
  (9,5,18,154),
  (10,7,11,198),
  (11,9,10,52),
  (12,10,18,181),
  (13,2,6,133),
  (14,18,4,52),
  (15,13,15,75),
  (16,1,4,171),
  (17,1,5,42),
  (18,1,9,184),
  (19,1,7,124),
  (20,2,7,214)

INSERT INTO BILET VALUES
  (1,7,16,'31.01.20'),
  (2,2,4,'22.05.20'),
  (3,12,6,'04.07.22'),
  (4,10,12,'02.07.22'),
  (5,10,6,'06.04.22'),
  (6,8,10,'06.07.21'),
  (7,3,8,'01.06.21'),
  (8,1,18,'26.11.21'),
  (9,10,18,'30.07.22'),
  (10,2,11,'18.12.20'),
  (11,11,10,'10.10.19'),
  (12,7,18,'02.06.19'),
  (13,7,6,'11.08.22'),
  (14,1,4,'17.09.20'),
  (15,11,15,'03.03.19'),
  (16,6,4,'07.12.21'),
  (17,8,5,'13.02.21'),
  (18,2,12,'16.10.18'),
  (19,4,7,'15.08.19'),
  (20,7,11,'28.11.19'),
  (21,2,13,'01.02.19'),
  (22,5,3,'21.12.21'),
  (23,13,19,'21.05.21'),
  (24,11,18,'23.07.20'),
  (25,10,9,'28.10.18'),
  (26,1,5,'09.04.21'),
  (27,7,9,'03.06.21'),
  (28,14,10,'21.07.21'),
  (29,13,16,'11.05.20'),
  (30,14,17,'03.04.19')

INSERT INTO TransportMarfa VALUES
  (1,3,8,'Metal', 5000,'15.09.21',29745),
  (2,8,2,'Combustibil', 7000,'29.04.19',27809),
  (3,6,20,'Masina', 3000,'30.11.18',17675),
  (4,2,17,'Ciment', 6000,'17.10.18',18557),
  (5,7,16,'Metal uzat',8000,'12.11.19',29568),
  (6,4,8,'Fier', 1000,'21.04.21',1430),
  (7,9,20,'Materiale de constructii', 2000,'22.02.21',6133),
  (8,15,13,'Masina', 2000,'26.08.20',13917),
  (9,9,8,'Sticla', 5000,'29.11.20',36486),
  (10,12,5,'Contrabanda', 1000, '31.01.21',15710),
  (11,1,1,'Tigari', 500, '04.02.22',18398),
  (12,10,11,'Ulei', 7500,'27.05.21',21917)

GO
--afisarea persoanei ce a cumparat bilet, tarseul pe care merge, data si pretul biletului
CREATE VIEW [INFORMATIE_BILET] AS
SELECT NUME, G.Denumire AS Pornire, G1.Denumire as STATIONARE, DATA, PRET
FROM Gara G, Gara1 G1, Bilet B, TRASEU T, Client C
WHERE T.IDGARA1=G.IDGara AND T.IDGARA2=G1.IDGara
AND B.IDTraseu =T.IDTraseu AND C.IDClient = B.IDClient
GO
  --afisarea numarului de calatorii a fiecarui pasager
  CREATE VIEW [NumarDeCalatorii] as
	Select c.nume,  count(b.idClient) as [numar de calatorii]
	from Bilet b, Client c
	where b.IDClient=c.IDClient
	group by  nume
  GO
  --afisarea marfei transportata cu cea mai mare masa
  Create view [MaxMasa] as
  SELECT C.NUME, T.TipMarfa, Masa
  from Client c, TransportMarfa t
  where c.IDClient=t.IDClient and Masa =(select max(masa) from TransportMarfa)
  --
--adaugarea salariului pentru angajati
go
BEGIN TRAN T1
ALTER TABLE Angajat
ADD Salariu money default 3500
GO
UPDATE Angajat
SET SALARIU = 5700
WHERE Functie LIKE 'Masinist'
GO
UPDATE Angajat
SET SALARIU = 3700
WHERE Functie LIKE 'TAX%'
GO
UPDATE Angajat
SET SALARIU = 4700
WHERE Functie LIKE 'REGULATOR'
COMMIT TRAN T1
GO


select * from Angajat


