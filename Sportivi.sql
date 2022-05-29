USE master
GO
IF EXISTS(SELECT'True' FROM SYS.DATABASES WHERE NAME='Sportivi')
BEGIN
DROP DATABASE Sportivi
END

GO
CREATE DATABASE Sportivi
GO
USE Sportivi

GO
CREATE TABLE CercSportiv
(
	idCerc INT IDENTITY(1,1) PRIMARY KEY,
	nume VARCHAR(30)
)

GO
CREATE TABLE Sportivi
(
	idSportiv INT IDENTITY(1,1) PRIMARY KEY,
	nume VARCHAR(30) NOT NULL,
	dataNasterii DATE NOT NULL,
	inaltimea INT,
	gen CHAR(2),
	greutatea INT,
	suntDistinctii BIT,
	idCercSportiv INT FOREIGN KEY (idCercSportiv) REFERENCES CercSportiv(idCerc)
)

--Inserarile in tabele
GO
INSERT INTO [CercSportiv] (nume)
VALUES
	('tenis'),
	('fotbal'),
	('baschet'),
	('gimnastica'),
	('inotul')

GO
INSERT INTO [Sportivi] (nume,dataNasterii,inaltimea,gen,greutatea,suntDistinctii,idCercSportiv)
VALUES
  ('Phillip Reid','09.17.03',177,'M',70,0,2),
  ('Raphael Hickman','01.12.01',157,'M',89,0,4),
  ('Tatum Petersen','06.22.01',185,'M,',67,0,4),
  ('Colorado Hughes','09.28.08',161,'M,',74,1,5),
  ('Brian Morse','08.27.02',190,'M',58,1,4),
  ('Sybill Bernard','04.01.03',181,'M',64,0,3),
  ('Joy Lawrence','01.21.02',197,'M',63,0,3),
  ('Shay Harvey','02.15.10',183,'F',84,1,2),
  ('Kadeem Erickson','02.24.02',167,'F',91,0,3),
  ('Kylee Cabrera','03.05.06',175,'F',60,0,3),
  ('Athena Ray','05.23.10',163,'F',87,0,5),
  ('Elvis Sexton','05.02.08',160,'M',69,1,4),
  ('Keelie Mccullough','11.21.10',198,'F',80,0,3),
  ('Luke Frederick','03.26.08',192,'M',84,0,1),
  ('Shelby Shepherd','09.18.02',168,'M',95,1,3),
  ('Luke Crosby','03.22.02',173,'M',93,1,4),
  ('Gannon Price','07.30.04',172,'M',67,0,4),
  ('Jarrod Ball','12.03.06',168,'M',88,1,4),
  ('Kerry Pearson','10.07.10',166,'F',63,1,5),
  ('Lewis Dawson','06.24.00',191,'M',94,1,2),
  ('Yvette Johnson','06.05.05',168,'M',88,0,3),
  ('Linus Roy','06.20.00',200,'M',94,0,4),
  ('Chastity Waller','10.31.08',177,'M,',75,0,1),
  ('Yoko Strickland','07.22.10',197,'F',84,0,3),
  ('Mark Hendrix','08.12.02',175,'M',71,1,3),
  ('Mohammad Beck','06.08.04',174,'M',95,0,4),
  ('Fiona Riggs','04.20.09',158,'F',65,0,1),
  ('Lars Hendricks','01.01.07',159,'M',87,0,2),
  ('Xenos Golden','04.22.01',158,'M',89,1,4),
  ('Henry Mcdaniel','01.22.01',152,'M',88,0,4),
  ('Dexter Chavez','01.08.04',183,'M',62,0,4),
  ('Marshall Parrish','12.23.03',197,'M',75,1,4),
  ('Odysseus Mejia','05.25.01',179,'M',61,1,2),
  ('Jerry Skinner','07.23.06',196,'M',74,1,4),
  ('Nicholas Goff','06.12.02',194,'M',68,1,3),
  ('Kim Harris','10.01.07',180,'F',66,1,3),
  ('Maryam Sellers','05.27.04',181,'F',71,1,4),
  ('Delilah Mack','07.04.06',179,'F',76,1,3),
  ('Chester Gross','11.17.00',185,'M',83,1,5),
  ('Blake Roberts','11.24.03',196,'M',63,1,1),
  ('Cain Lambert','04.26.04',158,'F',66,1,4),
  ('Uriah Meadows','05.23.04',172,'M',59,1,4),
  ('Isabella Mcfarland','06.25.07',180,'F',90,1,4),
  ('Whitney Stokes','03.29.08',196,'F',95,0,4),
  ('Carolyn Figueroa','07.14.08',177,'F',68,1,2),
  ('Audrey Parker','10.25.08',158,'M',77,1,5),
  ('Ralph Chase','07.22.00',197,'M',58,0,3),
  ('Sharon Jones','03.08.04',177,'F',67,1,1),
  ('Nicholas Harvey','02.15.06',161,'M',76,0,5),
  ('Howard Riggs','05.01.07',190,'M',92,0,4);

  --Sportivi ce practica inotul
  SELECT Sportivi.idSportiv, Sportivi.nume, Sportivi.dataNasterii, Sportivi.inaltimea, Sportivi.gen, Sportivi.greutatea, Sportivi.suntDistinctii, Sportivi.idCercSportiv FROM Sportivi, CercSportiv
  WHERE CercSportiv.nume = 'inotul' AND Sportivi.idCercSportiv = CercSportiv.idCerc

  SELECT * FROM Sportivi
  WHERE Sportivi.suntDistinctii = 1