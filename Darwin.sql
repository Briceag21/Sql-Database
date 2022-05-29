SET DATEFORMAT dmy
GO
USE master
GO
IF EXISTS (SELECT 'true' FROM sys.databases WHERE name = 'Darwin')
	BEGIN
		ALTER DATABASE Darwin SET SINGLE_USER WITH ROLLBACK IMMEDIATE
			 DROP DATABASE Darwin
END
GO
CREATE DATABASE Darwin
GO
USE Darwin
GO
ALTER AUTHORIZATION ON DATABASE :: Darwin TO sa
GO
GO
CREATE TABLE Angajati (
  IdAngajat int NOT NULL PRIMARY KEY,
  nume char(50),
  prenume char(50),
  CNP int UNIQUE CHECK (CNP > 99 AND CNP < 100000),
  strada char(50),
  nr_str char(50),
  gen char(1) CHECK (gen = 'm' OR gen = 'f'),
  data_nast char(50),
  salariu int,
Specialitate varchar(40)
)


CREATE TABLE Categorii   (
  IdCategorii  int NOT NULL PRIMARY KEY,
  nume_Categorie  char(20)

)
--
CREATE TABLE Produse    (
  IdProdus int NOT NULL PRIMARY KEY,
  nume_produs  char(60),
    pret_produs  Money,
	IdCategorii int Foreign key references Categorii
)

CREATE TABLE Clienti (
  IdClienti int NOT NULL PRIMARY KEY,
  Nume_Client char(20),
  prenume_Client char(20),
  gen char(1) CHECK (gen = 'm' OR gen = 'f'),
  Data_NS char(20)

)


CREATE TABLE Cumparaturi  (
  IdCumparaturi int NOT NULL PRIMARY KEY ,
 IdClienti int Foreign key references Clienti ,
IdProdus int Foreign key references Produse ,
pret_produs Money ,
IdAngajat int  Foreign key references Angajati

)



-----inserarea datelor

	



INSERT INTO Categorii (IdCategorii , nume_categorie ) VALUES 
    (1, 'Telefoane ')
  , (2, 'Laptopuri')
  , (3, 'Gadget ')
  , (4, 'Apple')
  , (5,'Audio')
  , (6,'Sport')
  , (7,'TV')
    , (8,'Accesorii')
	 , (9,'ELectrocasnice')

	 

	 INSERT INTO  Produse    (IdProdus ,nume_produs  ,pret_produs ,IdCategorii)Values
  (1,'Samsung Galaxy Z',20000.00,1),
  (2,'Apple iPhone 11',15000.00,1),
  (3,'Apple iPhone 12 Pro ',24000.00,1),
  (4,'Samsung Galaxy A32',5500.00,1),
  (5,'Laptop Apple Macbook Air 13',22000.00,2),
  (6,'Laptop Lenovo Ideapad 5',9400.00,2),
  (7,'Laptop Lenovo ThinkBook G2 ',11000.00,2),
  (8,'Laptop Apple MacBook Pro 13 ',30000,2),
  (9,'Drone PowerVision PowerEgg X',40000.00,3),
  (10,'Stabilizator Remax P20 Gray',2000.00,3),
  (11,'Statii Radio Motorola XT420',3000.00,3),
  (12,'Sony PlayStation 5',20000.00,3),
  (13,'Apple iPad Air 2020 ',20000.00,4),
  (14,'JBL Boombox 2',9000.00,5),
  (15,'JBL PartyBox 100',8000.00,5),
  (16,'Xiaomi Oclean F1 ',300.00,6),
  (17,'Moser 1400 ',900.00,6),
  (18,'Televizor Hisense 40',5000.00,7),
  (19,'Televizor Samsung 32',4000.00,7),
  (20,'Stilus Apple Pencil',2500.00,8),
  (21,'Xiaomi Mi Home Security Camera 360',1000.00,8),
   (22,'Aqua-Box Compact',5000.00,9),
	(23,'Indesit XIT8 T1E W',7000.00,9)

INSERT INTO Clienti (IdClienti, Nume_Client, prenume_Client, gen, Data_NS)VALUES 
    (1, 'Daphine', 'Burkhard', 'f', '19.10.2007' )
  , (2, 'Colton', 'Hake', 'm', '28.02.2009')
  , (3, 'Mel', 'Kersh', 'm', '20.01.2009')
  , (4, 'Augustina', 'Sibert', 'f', '12.02.2010')
  , (5, 'Reda', 'Bunker', 'f', '13.06.2011')
  , (6, 'Castravet', 'Cristian', 'm', '13.06.2011')
  , (7, 'Bivol', 'Catalin', 'm', '13.06.2011')
  ,(8,'Bolgaru','Marin','M','17.11.2000')
  ,(9,'Catana','Alexandra','F','17.11.2000')
  ,(10,'Cazemirenco','Tatiana','F','17.11.2000')
  ,(11,'Cerchez','Marius','M','17.11.2000')
  ,(12,'Ciobanu','Rostislav','M','17.11.2000')
  ,(13,'Esanu','Razvan','M','17.11.2000')
  ,(14,'Gheorghita','Eugen','M','17.11.2000')
  ,(15,'Gheorghita','Diana','F','17.11.2000')
  ,(16,'Grosu','Dan','M','17.11.2000')
  ,(17,'Isecov','Iulian','F','17.11.2000')
  ,(18,'Iurii','Mihaela','F','17.11.2000')
  ,(19,'Negara','Nicolae','M','17.11.2000')
  ,(20,'Railean','Valentin','M','17.11.2000')

  
INSERT INTO Angajati (IdAngajat, nume, prenume, CNP, strada, nr_str, gen, data_nast, salariu,Specialitate )VALUES 
	(1, 'Crucerescu', 'Sanda', 345, 'str.Sarmisegetusa', '5/2', 'f', '20.09.1999', 8000, 'Servitor')
	,(2, 'Cristea', 'Alexandra', 132, 'str.Grenoble', '32/1', 'f', '20.03.2001', 34000, 'Manager')
  , (3, 'Panco', 'Dan', 876, 'str.Zelinski', '2/1', 'm', '18.02.2000', 8000, 'Servitor')
  , (4, 'Bobeica', 'Gabriel', 432, 'bd.Dacie', '6/1', 'm', '18.02.2000', 10000, 'Vanzator')
  , (5, 'Volosciuc', 'Nicolaie', 312, 'str.Vasile Alecsandri', '23/1', 'f', '10.02.1999', 10000, 'Vanzator')
  , (6, 'Rogoj', 'Tatiana', 138, 'str.Puskin', '32/9', 'f', '19.10.1999', 9000, 'Consultant')
  , (7, 'Popovici', 'Daniela', 302, 'str.Albisoara', '13/7', 'f', '28.02.2001', 150000, 'Director')
  , (8, 'Bivol', 'Cristi', 112, 'str.Hancesti', '3/2', 'm', '20.01.1999', 9000, 'Consultant')
  , (9, 'Rata', 'Daniel', 122, 'str.Ceucari', '45/1', 'm', '12.02.1999', 10000, 'Vanzator')
  , (10, 'Castravet', 'Cornelia', 120, 'str.Independentei', '32/1', 'f', '13.06.1997', 100000, 'Administrator')

  
  --5,6,9
	Insert  into  Cumparaturi  (IdCumparaturi ,IdClienti ,IdProdus ,pret_produs,IdAngajat)VALUES 
(1,1,1,20000.00,5),
(2,2,2,15000.00,6),
(3,2,13,20000.00,6),
(4,3,16,300.00,5),
(5,3,17,900.00,5),
(6,4,22,5000.00,6),
(7,4,18,5000.00,6),
(8,5,4,5500.00,5),
(9,5,11,3000.00,5),
(10,6,23,7000.00,6),
(11,7,6,9400.00,9),
(12,7,14,9000.00,9),
(13,8,17,900.00,5),
(14,8,12,20000.00,5),
(15,9,6,9400.00,5),
(16,10,3,24000.00,9),
(17,11,3,24000.00,9),
(18,12,6,9400.00,6),
(19,13,4,5500.00,5),
(20,14,6 ,9400.00,9),
(21,15,4,5500.00,9),
(22,16,10,2000.00,6),
(23,17,12,20000.00,5),
(24,18,15,8000.00,9),
(25,18,1,20000.00,9),
(26,19,2,15000.00,9),
(27,19,5,22000.00,9),
(28,19,7,11000.00,6),
(29,20,12,20000.00,6),
(30,20,1,20000.00,6)



