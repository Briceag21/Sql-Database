
--Briceag Ion B-1921
--Nr de ordine 4 Biletul 14
USE MASTER
GO
IF EXISTS(SELECT'True' FROM SYS.DATABASES WHERE NAME='AgentieDeTurism')
BEGIN
DROP DATABASE AgentieDeTurism
END
GO
CREATE DATABASE AgentieDeTurism
GO
USE AgentieDeTurism
GO

CREATE TABLE Turisti (
Id_Turist  	Int Primary key,
NumeTurist  char(20),
DataNasterii	DATE,
CNP Varchar(40)
)
GO


CREATE TABLE Destinatie  (
Id_Destinatie 	Int Primary key,
DenumireDestinatie    varchar(20),
Id_Turist 	int Foreign key references Turisti(Id_Turist ),
DataPlecare	DATE,
Suma	Int 
 )
GO

GO
INSERT INTO Turisti(Id_Turist ,NumeTurist,DataNasterii,CNP)
values (1,'ALexandreanu','2002-03-01','210003204502'),
(2,'Andoni','2003-03-01','210003204502'),
(3,'Boico','2003-03-01','210003204502'),
(4,'Briceag','2004-03-01','210003204502'),
(5,'Buju','2003-03-01','210003204502')
GO
INSERT INTO Destinatie(Id_Destinatie,DenumireDestinatie,Id_Turist,DataPlecare,Suma)
values (1,'Antalia',1,'2021-03-01',3000),
(2,'Polonia',2,'2021-03-01',2000),
(3,'Antalia',3,'2018-06-01',3000),
(4,'Germania',4,'2021-03-01',4000),
(5,'Antalia',5,'2018-07-01',3000)
Go 
--Select Id_Turist From Turisti 
--Inner join Destinatie on Id_Destinatie=CNP
--where DenumireDestinatie= 'Antalia'

Select NumeTurist
 FROM Turisti  cr INNER JOIN  Destinatie  ct
ON ct.Id_Turist=cr.Id_Turist and  DataPlecare between '2018-05-24' and '2018-10-25'

go 

Select NumeTurist
 FROM Turisti  cr , Destinatie  ct
 where ct.Id_Turist=cr.Id_Turist and  DenumireDestinatie =  'Antalia'

go 
Select DenumireDestinatie ,NumeTurist FROM  Destinatie cr ,Turisti   ct
where  ct.Id_Turist=cr.Id_Turist
Order by Suma DESC 

--Select DenumireDestinatie ,Count(NumeTurist) ,Suma FROM  Destinatie cr , Turisti   ct
--where ct.Id_Turist=cr.Id_Turist
--Order by Suma DESC 
go 

Select NumeTurist,DataNasterii,CNP,DenumireDestinatie,Suma 
 FROM Turisti  cr , Destinatie  ct
where ct.Id_Turist=cr.Id_Turist 



--a) lista turi?tilor, care au ales destina?iile turistice, ce con?in în
--denumire cuvântul ”Antalia”;
--b) lista turi?tilor, care au plecat spre destina?iile turistice în perioada
---24.05.2018 – 25.10.2018;
--c) lista destina?iilor ?i num?rul de turi?ti, ordonat? descresc?tor dup?
--num?rul de turi?ti;
--d) lista turi?tilor ?i suma total? achitat? de fiecare turist agen?iei de
--turism pentru excursii.