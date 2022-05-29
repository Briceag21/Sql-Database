
USE master
GO
IF EXISTS(SELECT'True' FROM SYS.DATABASES WHERE NAME='Garaferoviar')
BEGIN
DROP DATABASE  Garaferoviar
END
GO
CREATE DATABASE  Garaferoviar
GO
USE Garaferoviar
Go
CREATE TABLE Login
(
	idLogara INT IDENTITY(1,1) PRIMARY KEY,
	userLogin VARCHAR(15) NOT NULL,
	userPassword VARCHAR(35) NOT NULL

)
					Insert into Login values 
											('admin','admin'),
											('a','a')
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
					Datanasterii varchar(20),
					IDNP NVARCHAR(13) UNIQUE,
					IDGara int foreign key references Gara(IDGara)
					)
Create Table Client(
					IDClient int primary key,
					Nume varchar(30),
					DataNasterii varchar(20),
					IDNP NVARCHAR(13) unique
					)


			create table Orar (
				IdOrar int primary key, 
				TimpPornire  Time ,
				TimpSosire    time 
			--	IdTraseu  int foreign key references Traseu(IdTraseu)
	
				
				)
				create table Tren 
				(IdTren int primary key,
				NrLocuri int )
Create Table Cursa(
				IDCursa int IDENTITY(1,1)  primary key ,
				IDGARA1 INT FOREIGN KEY REFERENCES GARA(IDGARA),
				IDGARA2 INT FOREIGN KEY REFERENCES GARA1(IDGARA),
				PRET MONEY,
				IdOrar int foreign key references Orar(IdOrar),
				Comfort int ,
				IdTren int foreign key references Tren(IdTren) , 
				Stare nvarchar(30)
				)					
				--  (1,5,10,100,38,1,'Anulata'),
Create Table Bilet(
					IDBilet int IDENTITY(1,1)  primary key,
					IDCursa int foreign key references Cursa(IdCursa),
				IDClient int foreign key references Client(IdClient),
					--IDTraseu int foreign key references Traseu(IdTraseu),
				
					Data varchar(30)
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
(15, 'Alnia Postolachi', '10.03.1999', 19827409112),
(16,'Winifred Summers','13.08.12',59626381527),
  (17,'Nicole Simpson','02.11.87',41620375200),
  (18,'Oren Palmer','01.11.93',35028767536),
  (19,'Rajah Ingram','22.11.02',24960421455),
  (20,'Autumn Downs','24.06.09',44421833618),
  (21,'Quamar Hester','23.06.82',46116494330),
  (22,'Elliott Haley','24.06.05',67938157622),
  (23,'Brianna Bolton','20.04.13',36942491662),
  (24,'Slade Cantrell','12.01.03',68334145349),
  (25,'Jonas Kirby','05.07.97',30265651624),
  (26,'Rebekah Kirkland','09.11.10',26944294257),
  (27,'Wyatt Pate','04.02.92',52815183750),
  (28,'Lacota Branch','13.10.95',80678590735),
  (29,'Blossom Perry','14.02.83',50966541665),
  (30,'Shaeleigh Reynolds','15.04.03',43520592807),
  (31,'Timothy Woods','23.08.04',37634514725),
  (32,'Fritz Ayers','25.09.10',57370585241),
  (33,'Vanna Mathews','27.07.86',35569221924),
  (34,'Channing Hall','24.11.90',44235558685),
  (35,'Mufutau O''brien','12.01.92',54933669501),
  (36,'Baker Campos','11.02.05',80649178169),
  (37,'Eliana Tucker','23.07.94',41109832938),
  (38,'Amos Maldonado','27.11.13',42945821449),
  (39,'Tana Stone','25.06.12',13394430454),
  (40,'Quail Carpenter','03.02.01',18955086659),
  (41,'Holly Sweet','19.01.05',79983255485),
  (42,'Kyra Byers','07.05.08',52384386341),
  (43,'Larissa Vang','21.10.93',67280295236),
  (44,'Oliver Jarvis','05.02.98',80971613171),
  (45,'Kaye Terrell','12.09.89',87443082257),
  (46,'Angelica Meyer','28.03.04',64596895083),
  (47,'Cameron Lowery','07.10.89',18510742030),
  (48,'Stewart Carney','28.02.84',50761487974),
  (49,'Galena Zimmerman','09.06.99',82508230296),
  (50,'Edan Brock','17.05.00',67947885435),
  (51,'Rowan Roman','26.02.94',68990569043),
  (52,'Bertha Patrick','12.12.11',78913692607),
  (53,'Hayfa Rosa','12.12.01',74667766132),
  (54,'Timothy Fernandez','07.02.94',16114647959),
  (55,'Serina Montgomery','28.08.83',62295289670),
  (56,'Hector Byrd','16.10.83',48673003712),
  (57,'Wallace Daniels','13.04.92',54078275084),
  (58,'Althea Richmond','11.08.93',58532473672),
  (59,'Quentin Beck','06.05.00',47868974851),
  (60,'Ginger Martinez','06.02.08',26692583688),
  (61,'Gavin Curry','06.02.97',26357375681),
  (62,'David Guerrero','25.07.00',27087697022),
  (63,'Yetta Irwin','02.12.14',41558175212),
  (64,'Thomas Sanford','01.10.81',31547076892),
  (65,'Cassady Sims','02.06.02',20159291699),
  (66,'Demetrius Stark','03.01.94',80234566223),
  (67,'Judith Noble','30.05.10',11220221979),
  (68,'Jaquelyn Anderson','07.05.00',24181436820),
  (69,'Roth Wilder','10.09.11',38573461236),
  (70,'Chelsea Benton','31.10.04',38112045845),
  (71,'Diana Shelton','11.05.13',71826895605),
  (72,'Maggy Kane','21.09.83',60028445318),
  (73,'Germaine Rodgers','02.03.04',83634100660),
  (74,'Nolan Gibson','26.08.06',72832534875),
  (75,'Alec Ortega','16.12.90',28471665627),
  (76,'Meghan Rivers','06.03.09',14345525105),
  (77,'Dawn Bolton','01.07.92',61880450862),
  (78,'Brian Goodwin','30.08.86',55444914300),
  (79,'Aretha Sweet','23.05.07',51829413359),
  (80,'Nissim Moss','06.03.83',73472070118)




  
INSERT INTO Orar
VALUES
  (1,'7:30','10:59'),
  (2,'7:09','10:21'),
  (3,'6:22','10:34'),
  (4,'6:06','10:12'),
  (5,'7:07','10:56'),
  (6,'6:39','11:39'),
  (7,'6:11','11:33'),
  (8,'6:02','11:07'),
  (9,'7:01','11:37'),
  (10,'7:24','10:02'),
  (11,'6:48','10:10'),
  (12,'7:24','11:21'),
  (13,'6:55','11:49'),
  (14,'6:09','10:16'),
  (15,'6:18','11:28'),
  (16,'6:52','10:02'),
  (17,'7:02','11:15'),
  (18,'7:13','11:03'),
  (19,'6:45','10:34'),
  (20,'7:27','10:04'),
    (21,'12:18','16:12'),
  (22,'13:38','16:01'),
  (23,'12:09','16:46'),
  (24,'13:52','15:03'),
  (25,'13:35','16:21'),
  (26,'12:12','16:08'),
  (27,'13:41','16:54'),
  (28,'12:00','16:53'),
  (29,'13:33','15:57'),
  (30,'12:26','15:05'),
  (31,'13:30','16:01'),
  (32,'12:46','16:25'),
  (33,'13:28','15:31'),
  (34,'13:45','16:16'),
  (35,'13:06','16:52'),
  (36,'12:24','16:53'),
  (37,'12:41','15:51'),
  (38,'13:08','15:08'),
  (39,'13:00','16:04'),
  (40,'12:46','16:06')

  Insert into Tren values 
    (1,100),
  (2,100),
  (3,150),
  (4,150),
  (5,200),
  (6,200),
  (7,250),
  (8,250),
  (9,300),
  (10,300)
  INSERT INTO Cursa VALUES

 			--IDCursa int primary key,
				--IDGARA1 INT FOREIGN KEY REFERENCES GARA(IDGARA),
				--IDGARA2 INT FOREIGN KEY REFERENCES GARA1(IDGARA),
				--PRET MONEY,
				--IdOrar int foreign key references Orar(IdOrar),
				--Comfort int ,
				--Stare varchar(30)
  (1,2,100,7,3,6,'Neanulata'),
  (1,2,100,11,2,7,'Neanulata'),
  (3,4,150,14,1,6,'Neanulata'),
  (3,4,150,8,2,4,'Anulata'),
  (5,6,200,10,2,3,'Neanulata'),
  (5,6,200,22,1,3,'Anulata'),
  (7,8,250,37,3,7,'Neanulata'),
  (7,8,250,28,3,8,'Neanulata'),
  (9,10,300,13,1,2,'Neanulata'),
  (9,10,300,2,2,9,'Anulata'),
  (11,12,100,29,1,9,'Anulata'),
  (11,12,100,36,3,2,'Anulata'),
  (13,14,150,1,2,3,'Neanulata'),
  (13,14,150,18,3,10,'Anulata'),
  (15,16,200,27,1,6,'Neanulata'),
  (15,16,200,11,3,3,'Anulata'),
  (17,18,250,38,2,6,'Neanulata'),
  (17,18,250,26,2,6,'Anulata'),
  (1,20,300,15,1,2,'Neanulata'),
  (1,20,300,5,3,2,'Neanulata'),
  (3,2,100,40,2,9,'Neanulata'),
  (3,2,100,21,2,6,'Neanulata'),
  (5,4,150,25,2,5,'Anulata'),
  (5,4,150,5,3,7,'Anulata'),
  (7,6,200,26,2,6,'Neanulata'),
  (7,6,200,33,1,1,'Neanulata'),
  (9,8,250,10,1,3,'Anulata'),
  (9,8,250,16,2,10,'Neanulata'),
  (11,10,300,10,1,4,'Anulata'),
  (11,10,300,20,1,7,'Neanulata')

INSERT INTO BILET VALUES
 (13,1,'21.03.22'),
  (28,2,'15.05.22'),
  (14,3,'12.01.22'),
  (12,4,'01.04.22'),
  (29,5,'14.01.22'),
  (15,6,'23.03.22'),
  (5,7,'28.02.22'),
  (7,8,'18.03.22'),
  (11,9,'01.03.22'),
  (7,10,'22.02.22'),
  (16,11,'21.05.22'),
  (15,12,'30.04.22'),
  (18,13,'15.05.22'),
  (6,14,'30.04.22'),
  (24,15,'04.03.22'),
  (11,16,'10.04.22'),
  (16,17,'14.05.22'),
  (8,18,'30.01.22'),
  (8,19,'25.05.22'),
  (21,20,'08.01.22'),
  (26,21,'27.01.22'),
  (9,22,'15.05.22'),
  (8,23,'19.01.22'),
  (9,24,'20.05.22'),
  (4,25,'11.01.22'),
  (26,26,'04.02.22'),
  (12,27,'06.01.22'),
  (17,28,'19.03.22'),
  (10,29,'03.04.22'),
  (9,30,'17.04.22'),
  (26,31,'08.05.22'),
  (20,32,'01.02.22'),
  (25,33,'29.01.22'),
  (10,34,'28.03.22'),
  (20,35,'09.05.22'),
  (21,36,'07.02.22'),
  (5,37,'15.04.22'),
  (28,38,'12.03.22'),
  (24,39,'17.01.22'),
  (25,40,'05.03.22'),
  (21,41,'08.04.22'),
  (8,42,'04.03.22'),
  (11,43,'26.03.22'),
  (12,44,'16.02.22'),
  (5,45,'04.03.22'),
  (19,46,'03.04.22'),
  (8,47,'04.05.22'),
  (20,48,'14.04.22'),
  (7,49,'10.01.22'),
  (26,50,'04.04.22'),
  (24,51,'24.05.22'),
  (7,52,'22.03.22'),
  (20,53,'27.05.22'),
  (25,54,'29.04.22'),
  (13,55,'19.03.22'),
  (5,56,'28.02.22'),
  (1,57,'03.01.22'),
  (16,58,'02.03.22'),
  (13,59,'15.05.22'),
  (27,60,'23.03.22'),
  (20,61,'07.02.22'),
  (5,62,'21.03.22'),
  (11,63,'07.05.22'),
  (23,64,'14.05.22'),
  (10,65,'25.05.22'),
  (13,66,'27.05.22'),
  (12,67,'11.01.22'),
  (9,68,'16.05.22'),
  (27,69,'27.04.22'),
  (16,70,'27.02.22'),
  (28,71,'29.04.22'),
  (22,72,'11.01.22'),
  (29,73,'05.03.22'),
  (3,74,'06.02.22'),
  (6,75,'25.02.22'),
  (3,76,'25.05.22'),
  (11,77,'07.03.22'),
  (7,78,'17.04.22'),
  (25,79,'15.05.22'),
  (13,80,'15.04.22')

GO
--afisarea persoanei ce a cumparat bilet, tarseul pe care merge, data si pretul biletului
--CREATE VIEW [INFORMATIE_BILET] AS
--SELECT NUME, G.Denumire AS Pornire, G1.Denumire as STATIONARE, DATA, PRET
--FROM Gara G, Gara1 G1, Bilet B, TRASEU T, Client C
--WHERE T.IDGARA1=G.IDGara AND T.IDGARA2=G1.IDGara
--AND B.IDTraseu =T.IDTraseu AND C.IDClient = B.IDClient
--GO
--  --afisarea numarului de calatorii a fiecarui pasager
--  CREATE VIEW [NumarDeCalatorii] as
--	Select c.nume,  count(b.idClient) as [numar de calatorii]
--	from Bilet b, Client c
--	where b.IDClient=c.IDClient
--	group by  nume
  GO


GO
select * from Angajat

select * from orar
select*from Angajat
select *from Gara
select  * from Gara1
select * from Bilet
Select * from Cursa
select * from Tren
Select* from Client
