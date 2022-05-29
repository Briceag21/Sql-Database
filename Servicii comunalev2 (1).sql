USE MASTER
GO
IF EXISTS(SELECT'True' FROM SYS.DATABASES WHERE NAME='Serviciicomunale')
BEGIN
DROP DATABASE Serviciicomunale
END
GO
CREATE DATABASE Serviciicomunale
GO
USE Serviciicomunale
GO

CREATE TABLE Servicii(
Id_Servicii 	Int Primary key,
Serviciul Varchar(20),
Plata_pentru_serviciu	Money
)
GO


CREATE TABLE Apartament (
Id_Apartament 	Int Primary key,
Numar	    String,
Nume_Proprietar	Varchar(20),
NrCamere	Int,
Consumul	Int ,
Achitarea	Money
 )
GO
CREATE TABLE Achitari (
Id_Achitari Int Primary key,
Id_Apartament 	Int Foreign key,
Serviciul Varchar(20),
Data_Achitarii DATA
 )

GO
INSERT INTO Servicii(Id_Servicii ,Serviciul,Plata_pentru_serviciu)
values (1,'Electricitate',1.00),
(2,'Gaz',3.00),
(3,'Apa',2.00),
(4,'Internet',200.00),
(5,'Telefon',0.30)
GO

INSERT INTO Apartament(Id_Apartament,Numar,Nume_Proprietar,NrCamere,Serviciul,Consumul, Achitarea)
values (1,"078766421",'Anatol',4,6000,1200),
(2,"078766421",'Anatol',1,2000,600),
(3,"078766421",'Anatol',4,6000,1200),
(4,"078766421",'Anatol',2,3000,700),
(5,"078766421",'Anatol',5,7000,1400),
(6,"078766421",'Anatol',3,5000,1000),
(7,"078766421",'Anatol',4,6000,1200),
(8,"078766421",'Anatol',4,6000,1200),
(9,"078766421",'Anatol',4,6000,1200),
(10,"078766421",'Anatol',8,10000,1750),
(11,"078766421",'Anatol',2,6000,1200),
(12,"078766421",'Anatol',3,5000,1000),
(13,"078766421",'Anatol',7,9000,1600),
(14,"078766421",'Anatol',5,7000,1400),
(15,"078766421",'Anatol',7,9000,1600),
(16,"078766421",'Anatol',8,10000,1750),
(17,"078766421",'Anatol',4,6000,1200),
(18,"078766421",'Anatol',10,10000,4300),
(19,"078766421",'Anatol',2,3000,700),
(20,"078766421",'Anatol',8,10000,1750)

GO

INSERT INTO Achitari(Id_Achitari,Id_Apartament 	,Serviciul ,Data_Achitarii )
values (1,1,'Electricitate',2021-03-01),
(2,2,'Electricitate',2021-03-01),
(3,3,'Electricitate',2021-03-01),
(4,4,'Electricitate',2021-03-01),
(5,5,'Electricitate',2021-03-01),
(6,6,'Electricitate',2021-03-01),
(7,7,'Electricitate',2021-03-01),
(8,8,'Electricitate',2021-03-01),
(9,9,'Electricitate',2021-03-01),
(10,10,'Electricitate',2021-03-01),
(11,1,'Gaz',2021-03-01),
(12,2,'Gaz',2021-03-01),
(13,3,'Gaz',2021-03-01),
(14,4,'Gaz',2021-03-01),
(15,5,'Gaz',2021-03-01),
(16,6,'Gaz',2021-03-01),
(17,7,'Gaz',2021-03-01),
(18,8,'Gaz',2021-03-01),
(19,9,'Gaz',2021-03-01),
(20,10,'Gaz',2021-03-01),
(21,1,'Internet',2021-03-01),
(22,2,'Apa',2021-03-01),
(23,3,'Apa',2021-03-01),
(24,4,'Internet',2021-03-01),
(25,5,'Gaz',2021-03-01),
(26,6,'Telefon',2021-03-01),
(27,7,'Internet',2021-03-01),
(28,8,'Apa',2021-03-01),
(29,9,'Internet',2021-03-01),
(30,10,'Apa',2021-03-01)
Go 
CREATE VIEW CamApartament 
AS SELECT Id_Apartament ,NrCamere
FROM Apartament
Where NrCamere>4
GO 
SELECT * FROM CamApartament 
  GO 

BEGIN Tran AP

SAVEPOINT n1 

Delete From Apartament where Achitarea=1200
Commit 
Select  Achitarea FROM Apartament 

ROLLBACK n1 

SAVEPOINT n2 
alter table  Apartament
add PM  int
GO
UPDATE Apartament 
SET PM= 20
Commit tran 
SELECT  PM FROM Apartament 
ROLLBACK n2

GO 

SELECT *FROM Achitari;
SELECT *FROM Servicii;
SELECT *FROM Apartament;

SELECT * FROM Achitari
Where Id_Achitari between 10 and 24

SELECT * FROM Servicii 
Where Serviciul IN('Gaz')

SELECT NrCamere FROM Apartament 
Group by NrCamere


