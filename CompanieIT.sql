set dateformat dmy
go
USE master
GO
IF EXISTS (SELECT 'true' FROM sys.databases WHERE name = 'CompanieIT')
	BEGIN
		ALTER DATABASE CompanieIT SET SINGLE_USER WITH ROLLBACK IMMEDIATE
			 DROP DATABASE CompanieIT
END
GO
CREATE DATABASE CompanieIT
GO
USE CompanieIT
GO
ALTER AUTHORIZATION ON DATABASE :: CompanieIT TO sa
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
  IdDepartament int
)
CREATE TABLE Departamente (
  IdDepartament int NOT NULL PRIMARY KEY,
  nume_dep char(20)
)
CREATE TABLE Proiecte (
  IdProiect int NOT NULL PRIMARY KEY,
  nume_proiect char(30),
  buget int,
  termen_limita date,
  IdDepartament int
)
CREATE TABLE Ang_Proecte (
  IdAng_Proect int  PRIMARY KEY,
  IdProiect int ,
  IdAngajat int,
   data_inceperii date, 
   data_finisării date
)
CREATE TABLE Intretinuti (
  IdIntretinuti int NOT NULL PRIMARY KEY,
  Nume_intretinut char(20),
  prenume_intretinut char(20),
  gen char(1) CHECK (gen = 'm' OR gen = 'f'),
  Data_NS char(20),
  IdAngajat int
)
--Foreign Key
ALTER TABLE Ang_Proecte
ADD FOREIGN KEY (IdAngajat) REFERENCES Angajati
ALTER TABLE Ang_Proecte
ADD FOREIGN KEY (IdProiect) REFERENCES Proiecte

ALTER TABLE Intretinuti
ADD FOREIGN KEY (IdAngajat) REFERENCES Angajati

ALTER TABLE Angajati
ADD FOREIGN KEY (IdDepartament) REFERENCES Departamente

ALTER TABLE Proiecte
ADD FOREIGN KEY (IdDepartament) REFERENCES Departamente




-----inserarea datelor
INSERT INTO Departamente (IdDepartament, nume_dep) VALUES 
    (1, 'Electronica')
  , (2, 'Inginerie')
  , (3, 'Informatica')
  , (4, 'STEM')
  , (5,'Tester1')
  , (6,'Educatie')
  , (7,'Retele')
  ,(8,'Contabilitate')

INSERT INTO Proiecte (IdProiect, nume_proiect, buget, termen_limita, IdDepartament)VALUES
    (1, 'International', 500000, '20.02.2018', 2)
  , (2, 'Programarea Pasiunea Mea', 65300, '12.01.2018', 5)
  , (3, 'Cea mai puna aplicatie', 1442300, '29.09.2018', 1)
  , (4, 'Cercetare-STEM', 25000, '19.11.2018', 6)
  , (5, 'Programarea API', 65300, '12.01.2018', 5)
  , (6, 'Cea mai puna aplicatie', 1442300, '29.09.2018', 4)
  , (7, 'Proiect-EDU', 25000, '19.11.2018', 6)

INSERT INTO Angajati (IdAngajat, nume, prenume, CNP, strada, nr_str, gen, data_nast, salariu, IdDepartament)VALUES 
	(1, 'Crucerescu', 'Sanda', 345, 'str.Sarmisegetusa', '5/2', 'f', '20.09.1999', 123000, 1)
	,(2, 'Cristea', 'Alexandra', 132, 'str.Grenoble', '32/1', 'f', '20.03.2001', 345000, 1)
  , (3, 'Panco', 'Dan', 876, 'str.Zelinski', '2/1', 'm', '18.02.2000', 1040, 2)
  , (4, 'Bobeica', 'Gabriel', 432, 'bd.Dacie', '6/1', 'm', '18.02.2000', 455000, 3)
  , (5, 'Volosciuc', 'Nicolaie', 312, 'str.Vasile Alecsandri', '23/1', 'f', '10.02.1999', 745000, 1)
  , (6, 'Rogoj', 'Tatiana', 138, 'str.Puskin', '32/9', 'f', '19.10.1999', 1500, 4)
  , (7, 'Popovici', 'Daniela', 302, 'str.Albisoara', '13/7', 'f', '28.02.2001', 148000, 1)
  , (8, 'Bivol', 'Cristi', 112, 'str.Hancesti', '3/2', 'm', '20.01.1999', 2000, 1)
  , (9, 'Rata', 'Daniel', 122, 'str.Ceucari', '45/1', 'm', '12.02.1999', 2300, 2)
  , (10, 'Castravet', 'Cornelia', 120, 'str.Independentei', '32/1', 'f', '13.06.1997', 101000, 3)
  ,(11,'Covali','Eugenia',2938,'Tighina','34','f','17.11.2000',18100,6)
  ,(12,'Balaban','Constantin',2847,'Teilor','43','m','17.11.2000',28100,5)
  ,(13,'Nebunelea','Diana',8473,'Studentilor','4','m','17.11.2000',19100,6)
  /*,(14,1,5,'Bolgaru','Marin',02938473,'Moscovei',7,'Chisinau','Rascani','M','17.11.2000',8100)
  ,(15,6,5,'Catana','Alexandra',02938473,'Lazo',8,'Chisinau','Centru','F','17.11.2000',8100)
  ,(16,3,5,'Cazemirenco','Tatiana',02938473,'Alecsandri',32,'Chisinau','Centru','F','17.11.2000',8100)
  ,(17,6,5,'Cerchez','Marius',02938473,'Trandafirilor',75,'Chisinau','Botanica','M','17.11.2000',8100)
  ,(18,6,5,'Ciobanu','Rostislav',02938473,'Ghibu',23,'Chisinau','Buiucani','M','17.11.2000',8100)
  ,(19,6,6,'Esanu','Razvan',02938473,'Tighina',34,'Chisinau','Rascani','M','17.11.2000',8100)
  ,(20,7,5,'Gheorghita','Eugen',02938473,'Teilor',43,'Chisinau','Botanica','M','17.11.2000',8100)
  ,(21,6,5,'Gheorghita','Diana',02938473,'Studentilor',4,'Chisinau','Rascani','F','17.11.2000',8100)
  ,(22,7,5,'Grosu','Dan',02938473,'Moscovei',7,'Chisinau','Rascani','M','17.11.2000',8100
  ,(23,6,5,'Isecov','Iulian',02938473,'Lazo',8,'Chisinau','Centru','F','17.11.2000',8100)
  ,(24,8,5,'Iurii','Mihaela',02938473,'Alecsandri',32,'Chisinau','Centru','F','17.11.2000',8100)
  ,(25,8,5,'Negara','Nicolae',02938473,'Trandafirilor',75,'Chisinau','Botanica','M','17.11.2000',8100)
  ,(26,7,5,'Railean','Valentin',02938473,'Ghibu',23,'Chisinau','Buiucani','M','17.11.2000',8100)
  */

INSERT INTO Intretinuti (IdIntretinuti, Nume_intretinut, prenume_intretinut, gen, Data_NS, IdAngajat)VALUES 
    (1, 'Daphine', 'Burkhard', 'f', '19.10.2007', 6)
  , (2, 'Colton', 'Hake', 'm', '28.02.2009', 7)
  , (3, 'Mel', 'Kersh', 'm', '20.01.2009', 8)
  , (4, 'Augustina', 'Sibert', 'f', '12.02.2010', 9)
  , (5, 'Reda', 'Bunker', 'f', '13.06.2011', 4)
  , (6, 'Castravet', 'Cristian', 'm', '13.06.2011', 4)
  , (7, 'Bivol', 'Catalin', 'm', '13.06.2011', 6)

INSERT INTO Ang_Proecte(IdAng_Proect, IdAngajat, idproiect, data_inceperii, data_finisării) VALUES 
	      (1, 1, 1,'20.12.2017','20.01.2018')
		 ,(2, 2, 1,'20.01.2018','10.02.2018')
		 ,(3, 3, 1,'20.12.2017','20.02.2018')
		 ,(4, 2, 1,'30.12.2017','20.02.2018')
		 ,(5, 10, 2,'12.11.2017','12.01.2018')
		 ,(6, 9, 2,'12.11.2017','12.01.2018')
		 ,(7, 8, 3,'13.01.2018','29.09.2018')
		 ,(8, 4, 3,'13.01.2018','29.09.2018')
		 ,(9, 5, 4,'20.09.2018','19.11.2018')
		 ,(10, 6, 4,'15.01.2018','19.11.2018')
		 ,(11, 7, 3,'13.01.2018','29.09.2018')
		  ,(12, 11, 7,'29.04.2018','29.09.2018')
		 ,(13, 6, 1,'12.11.2017','20.02.2018')
		 ,(14, 7, 2,'20.12.2017','12.01.2018')
		 --,(15, 6, 1,'12.11.2017','20.02.2018')
		 --,(16, 7, 2,'20.12.2017','12.01.2018')

		

		go 

/*		• Creați schema E-R pentru baza de date;
• Creați vederea ce va afișa toți angajații care dețin un salariu mai mic de 15000;
• Creați o procedură/tranzacție, care afișează informații despre numărul de
agenți din fiecare departament;
• Creați un declanșator ce va afișa mesajul “S-a modificat în numele proiectului“
cu Id-ul 205 
• Creați o funcție care va calcula salariul maximal al angajaților dintr-un
departament anumit.
• Acordați și retrageți dreptul de inserare și creare a obiectelor pentru un
utilizator creat de voi.*/
	
	Create view ex1 
	as  
	Select * from Angajati 
	where  salariu <= 15000 
	
	go 

--BEGIN TRAN T1 
--IF EXISTS (SELECT *FROM Angajati)

Create trigger Trig 
on Proiecte 
for insert 
AS
   	DECLARE  @Id  int =2 
   	IF EXISTS (SELECT * from Proiecte  where IdProiect = @Id )

		begin 
		Alter table Proiecte 
--		Alter  column   nume_proiect as    'ex 3' 
 Print('S-a modificat în numele proiectului')
	

rollback 

end 

--create login Briceag password = 'with '