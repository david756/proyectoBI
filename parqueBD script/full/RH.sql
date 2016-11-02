USE [Fuente_RH]
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 31/10/2016 12:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[Legajo] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Direccion] [varchar](300) NULL,
	[Sueldo] [float] NOT NULL,
	[Horas_Capacitacion] [int] NOT NULL,
	[Fecha_Ingreso] [date] NOT NULL,
	[ID_Local] [int] NOT NULL,
 CONSTRAINT [PK_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[Legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TELEFONO_EMPLEADO]    Script Date: 31/10/2016 12:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TELEFONO_EMPLEADO](
	[Legajo] [int] NOT NULL,
	[Telefono_Empleado] [float] NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[TELEFONO_EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_TELEFONO_EMPLEADO_EMPLEADO] FOREIGN KEY([Legajo])
REFERENCES [dbo].[EMPLEADO] ([Legajo])
GO
ALTER TABLE [dbo].[TELEFONO_EMPLEADO] CHECK CONSTRAINT [FK_TELEFONO_EMPLEADO_EMPLEADO]
GO




INSERT INTO EMPLEADO([Legajo],[Nombre],[Apellido],[Direccion],[Sueldo],[Horas_Capacitacion],[Fecha_Ingreso],[ID_Local]) VALUES(1,'Quynn','Hardy','9037 Lacinia Avenida',3952771,101,'2011-08-31',10),(2,'Odessa','Ramsey','828-5306 Sed ',4905690,93,'2011-06-02',18),(3,'Medge','Salinas','864-9687 Ac C/',113975,155,'2014-10-22',26),(4,'Veronica','Rodgers','Apartado núm.: 193, 9639 Eu ',4979879,37,'2015-11-16',15),(5,'Hall','Mcclain','879-8964 Maecenas C/',4265333,179,'2006-02-25',17),(6,'Acton','Myers','Apartado núm.: 327, 342 Proin C/',4864815,169,'2008-09-30',5),(7,'Sacha','Kirkland','2802 Adipiscing, Av.',2928065,116,'2007-03-16',30),(8,'Yolanda','Bush','263-3871 Tempus ',1808282,78,'2007-01-26',5),(9,'Sheila','Orr','Apdo.:144-6309 Consectetuer, C.',2153820,13,'2005-12-19',3),(10,'Naida','Singleton','815-8315 In Ctra.',2727893,37,'2014-06-05',9);
INSERT INTO EMPLEADO([Legajo],[Nombre],[Apellido],[Direccion],[Sueldo],[Horas_Capacitacion],[Fecha_Ingreso],[ID_Local]) VALUES(11,'Kasper','Floyd','723-5334 Lobortis, C.',1804536,71,'2010-03-21',20),(12,'Cathleen','Larson','Apartado núm.: 181, 8961 Quis, C/',4520586,179,'2015-12-20',9),(13,'Lucas','Cole','2104 Curae; Avda.',192173,185,'2007-04-30',25),(14,'Finn','Kent','Apdo.:491-527 Fringilla. Avda.',4388982,195,'2010-12-10',27),(15,'Madonna','Guy','476-6031 Bibendum Carretera',1828721,131,'2012-12-03',1),(16,'Carol','Dixon','4401 Rhoncus. Av.',3510138,129,'2014-10-23',16),(17,'Kennedy','Wagner','Apartado núm.: 580, 1660 Risus. Av.',3012020,27,'2012-12-24',5),(18,'Stone','Leach','Apartado núm.: 423, 204 Tellus. Avda.',2539101,63,'2010-03-04',3),(19,'Ruby','James','Apartado núm.: 838, 4903 Bibendum C.',1857201,173,'2015-11-24',2),(20,'Vincent','Ayala','6847 Viverra. Av.',887866,72,'2007-09-27',16);
INSERT INTO EMPLEADO([Legajo],[Nombre],[Apellido],[Direccion],[Sueldo],[Horas_Capacitacion],[Fecha_Ingreso],[ID_Local]) VALUES(21,'Caleb','Humphrey','Apdo.:529-6864 Fringilla ',3033133,113,'2006-02-11',29),(22,'Mara','Dudley','Apdo.:391-6220 Proin Avda.',4721807,107,'2005-05-07',23),(23,'Imani','Gonzales','1846 Dui. Calle',2411370,39,'2009-02-25',20),(24,'John','Rhodes','Apdo.:330-8627 Purus Av.',708388,82,'2008-11-17',8),(25,'Howard','Sanford','Apdo.:732-8762 Urna, Carretera',3317075,142,'2012-07-10',25),(26,'Richard','Pate','6223 Nulla Calle',1230121,167,'2010-04-22',20),(27,'Lilah','Skinner','Apartado núm.: 486, 7068 Purus. C.',2285889,59,'2010-07-20',8),(28,'Fatima','Soto','7778 Eu Calle',4423530,87,'2009-01-20',21),(29,'Kamal','Warner','Apdo.:893-6295 Ipsum Avda.',4196496,12,'2012-07-29',27),(30,'Vivien','Haynes','9690 Velit C.',2884808,39,'2010-02-14',16);
INSERT INTO EMPLEADO([Legajo],[Nombre],[Apellido],[Direccion],[Sueldo],[Horas_Capacitacion],[Fecha_Ingreso],[ID_Local]) VALUES(31,'Claire','Alvarez','Apdo.:814-1883 Curabitur Avda.',4784162,198,'2012-11-03',9),(32,'Stella','Elliott','Apartado núm.: 429, 6058 Sed Avenida',3708134,137,'2013-01-05',23),(33,'Kyla','Hopkins','Apdo.:339-703 Cursus Calle',3383924,187,'2008-09-27',3),(34,'Burke','Stevenson','8886 Nec, C/',1815497,195,'2006-12-12',5),(35,'Amelia','Clark','Apdo.:351-3567 Mattis Avda.',1162988,13,'2008-10-05',5),(36,'Dylan','Webster','Apdo.:815-2734 Porttitor Av.',784986,112,'2015-10-30',11),(37,'Wylie','Gamble','Apartado núm.: 894, 9296 Pede, C.',3247644,77,'2007-01-09',22),(38,'Jerry','Douglas','Apdo.:797-9925 Tellus. Avenida',1312249,40,'2008-03-14',7),(39,'Lois','Reeves','Apdo.:952-6405 Nullam Calle',994078,67,'2008-08-16',22),(40,'Dora','Hodge','Apartado núm.: 258, 786 Nibh. C/',2439445,27,'2015-01-22',3);
INSERT INTO EMPLEADO([Legajo],[Nombre],[Apellido],[Direccion],[Sueldo],[Horas_Capacitacion],[Fecha_Ingreso],[ID_Local]) VALUES(41,'Cassandra','Meyers','Apdo.:718-1118 Quisque Calle',2079381,77,'2010-03-13',22),(42,'Sage','Cochran','Apartado núm.: 879, 6641 Torquent C.',1837931,126,'2009-09-10',20),(43,'Darryl','Christian','Apdo.:356-7056 Enim Av.',688703,49,'2011-02-09',23),(44,'Ivana','Greene','Apartado núm.: 543, 8781 Vivamus Avda.',2771735,64,'2007-10-18',23),(45,'Daria','West','Apartado núm.: 956, 123 Dictum C/',4434074,120,'2008-02-09',18),(46,'Nyssa','Cardenas','966-3701 Id, Avenida',4310566,43,'2015-10-30',10),(47,'Daphne','Woodward','Apartado núm.: 915, 1720 Maecenas Ctra.',3394871,133,'2005-11-14',10),(48,'Damian','Orr','Apdo.:301-6394 Augue C.',1589662,189,'2008-06-16',26),(49,'Isabella','Paul','739-7785 Fusce C/',3626096,38,'2010-08-23',20),(50,'Amela','Scott','858-8343 Lacus. C.',4112456,84,'2006-01-27',1);
INSERT INTO EMPLEADO([Legajo],[Nombre],[Apellido],[Direccion],[Sueldo],[Horas_Capacitacion],[Fecha_Ingreso],[ID_Local]) VALUES(51,'Imogene','Carrillo','Apartado núm.: 421, 6172 Nec Ctra.',856412,50,'2006-01-21',17),(52,'Madeline','Dalton','1833 Augue Av.',3599438,105,'2008-06-17',26),(53,'Jasmine','Barrett','4345 Non, Avda.',2924273,46,'2016-04-18',17),(54,'Camden','Sharpe','754-1629 Mollis. Ctra.',4199266,102,'2015-06-08',6),(55,'Kaden','Whitehead','5069 Semper ',2921801,145,'2009-11-02',22),(56,'Shellie','Perkins','Apdo.:640-1802 Duis Av.',4641047,3,'2009-11-16',2),(57,'Wang','Waller','Apdo.:380-4095 Rhoncus. Ctra.',3784433,98,'2010-04-13',2),(58,'Dominic','Compton','Apartado núm.: 660, 7642 Senectus Carretera',116898,51,'2009-01-23',4),(59,'Rowan','Wells','Apdo.:677-3555 Enim. Calle',1148478,41,'2005-09-01',28),(60,'Ariana','Massey','Apdo.:801-3930 Morbi Av.',1440588,86,'2010-03-30',10);
INSERT INTO EMPLEADO([Legajo],[Nombre],[Apellido],[Direccion],[Sueldo],[Horas_Capacitacion],[Fecha_Ingreso],[ID_Local]) VALUES(61,'Bruno','Shannon','9617 Eget Avenida',3295964,107,'2012-01-13',16),(62,'Fleur','England','2731 Ligula Carretera',762407,66,'2015-09-18',14),(63,'Chiquita','Oneal','Apdo.:233-7661 In ',232909,197,'2008-12-06',3),(64,'Brody','Berger','6149 Sed Calle',440024,177,'2016-03-25',20),(65,'Keane','Prince','1409 Et, ',3335915,61,'2006-02-08',19),(66,'Brynn','Cortez','Apartado núm.: 673, 4056 Eu, Carretera',4883672,161,'2011-03-04',21),(67,'Adam','Potts','6698 Nec C.',2981747,138,'2014-03-28',18),(68,'Kylynn','Gordon','Apartado núm.: 617, 967 Ultricies ',4615165,98,'2006-02-12',22),(69,'Rafael','Sargent','Apdo.:554-4608 Blandit Calle',4584356,93,'2009-10-06',10),(70,'Quynn','Park','7529 Nulla. Calle',4697950,181,'2009-09-30',27);
INSERT INTO EMPLEADO([Legajo],[Nombre],[Apellido],[Direccion],[Sueldo],[Horas_Capacitacion],[Fecha_Ingreso],[ID_Local]) VALUES(71,'Christine','Garrett','1252 Cursus Av.',1850410,162,'2007-10-03',14),(72,'Kirestin','Bernard','Apartado núm.: 418, 4631 At ',627666,57,'2009-03-18',27),(73,'Yetta','Becker','Apdo.:645-340 Suspendisse Ctra.',162334,64,'2010-02-18',27),(74,'Zorita','Moon','Apdo.:903-3235 Felis. Avenida',2261957,25,'2005-09-15',22),(75,'Shellie','Bowers','Apdo.:844-6466 Accumsan C.',3700053,168,'2009-06-18',2),(76,'Dana','Thomas','985-1131 Morbi Av.',1531835,117,'2014-12-10',17),(77,'Claudia','Welch','6268 Convallis ',4941597,99,'2006-11-27',21),(78,'Gareth','Blackwell','7094 Sit ',3915384,29,'2006-04-19',16),(79,'Lenore','Watson','Apartado núm.: 441, 2617 Consectetuer C.',4925807,22,'2016-04-09',24),(80,'Omar','Mcintosh','185-6326 Ut, Ctra.',641993,148,'2008-12-06',26);
INSERT INTO EMPLEADO([Legajo],[Nombre],[Apellido],[Direccion],[Sueldo],[Horas_Capacitacion],[Fecha_Ingreso],[ID_Local]) VALUES(81,'Nina','Wright','204-688 Molestie Avenida',2110531,167,'2012-06-17',20),(82,'Dahlia','Franco','368-9634 Magnis ',4642240,63,'2013-04-07',24),(83,'Boris','Mercer','Apartado núm.: 629, 7370 Sed Calle',4269820,66,'2005-03-06',7),(84,'Vera','Hendrix','422-400 Risus. Calle',805394,37,'2010-05-10',15),(85,'Eric','Hooper','120-1449 Sodales. C/',1771715,37,'2008-02-23',29),(86,'Demetrius','Manning','Apdo.:954-2353 Ut, Ctra.',604165,186,'2012-03-14',19),(87,'Connor','Hatfield','Apdo.:307-7360 Integer Carretera',3108367,161,'2009-08-04',14),(88,'Zelda','Rosa','Apdo.:984-6113 Et Avda.',2000013,168,'2005-04-04',7),(89,'Finn','Talley','Apdo.:941-732 Placerat. Avenida',396463,142,'2011-01-25',11),(90,'Katell','Guthrie','Apartado núm.: 905, 7861 Aliquet. Av.',1969158,106,'2010-11-30',8);
INSERT INTO EMPLEADO([Legajo],[Nombre],[Apellido],[Direccion],[Sueldo],[Horas_Capacitacion],[Fecha_Ingreso],[ID_Local]) VALUES(91,'Griffin','Wilkinson','Apartado núm.: 764, 642 Nunc C.',4849289,99,'2014-11-07',4),(92,'Richard','Sharp','Apartado núm.: 477, 4415 Semper Carretera',1132280,89,'2008-01-16',8),(93,'Shafira','Moore','5733 Faucibus Carretera',2155581,64,'2013-02-07',3),(94,'Rogan','Harvey','632-2797 Non, Calle',3171658,41,'2009-03-14',3),(95,'Lionel','Delacruz','3450 Pulvinar Avenida',3185853,65,'2009-03-06',30),(96,'Sade','Blevins','335-4472 Ornare, C/',607835,101,'2006-12-04',27),(97,'Hasad','Sosa','Apdo.:270-4483 Fusce Calle',886323,1,'2008-09-10',23),(98,'Jessica','Bowman','376-7511 Dui C/',4370119,196,'2014-08-17',1),(99,'Martin','Nash','Apdo.:406-7932 Blandit Ctra.',374185,34,'2015-07-19',9),(100,'Brynn','Gates','Apartado núm.: 222, 1355 Justo Avenida',1108635,56,'2014-04-04',22);





INSERT INTO tELEFONO_EMPLEADO([Legajo],[Telefono_Empleado]) VALUES(1,'9293647'),(2,'6770801'),(3,'9946467'),(4,'6549731'),(5,'2065221'),(6,'3870167'),(7,'6332592'),(8,'6642870'),(9,'5313684'),(10,'0352844');
INSERT INTO tELEFONO_EMPLEADO([Legajo],[Telefono_Empleado]) VALUES(11,'9504776'),(12,'1002398'),(13,'4861082'),(14,'7747278'),(15,'1981114'),(16,'2228895'),(17,'8641604'),(18,'7290139'),(19,'6022466'),(20,'0658911');
INSERT INTO tELEFONO_EMPLEADO([Legajo],[Telefono_Empleado]) VALUES(21,'3483203'),(22,'0854379'),(23,'0510337'),(24,'2271689'),(25,'8780805'),(26,'9647968'),(27,'9976027'),(28,'4372484'),(29,'6347273'),(30,'5593373');
INSERT INTO tELEFONO_EMPLEADO([Legajo],[Telefono_Empleado]) VALUES(31,'3179197'),(32,'7581168'),(33,'2407445'),(34,'4905927'),(35,'7927447'),(36,'5283361'),(37,'1874232'),(38,'1723948'),(39,'6218690'),(40,'0979207');
INSERT INTO tELEFONO_EMPLEADO([Legajo],[Telefono_Empleado]) VALUES(41,'9726350'),(42,'3993280'),(43,'1039330'),(44,'9730863'),(45,'9492718'),(46,'5943262'),(47,'5281061'),(48,'9800855'),(49,'5406830'),(50,'6310415');
INSERT INTO tELEFONO_EMPLEADO([Legajo],[Telefono_Empleado]) VALUES(51,'0144461'),(52,'6946182'),(53,'2635508'),(54,'0516486'),(55,'9794947'),(56,'1855269'),(57,'0831170'),(58,'0736107'),(59,'0171019'),(60,'8091083');
INSERT INTO tELEFONO_EMPLEADO([Legajo],[Telefono_Empleado]) VALUES(61,'4703907'),(62,'4304706'),(63,'6792367'),(64,'1817290'),(65,'1407368'),(66,'9545608'),(67,'9315921'),(68,'0900807'),(69,'0358468'),(70,'9078265');
INSERT INTO tELEFONO_EMPLEADO([Legajo],[Telefono_Empleado]) VALUES(71,'9761612'),(72,'5880215'),(73,'1268738'),(74,'3360131'),(75,'2086386'),(76,'5569590'),(77,'9710644'),(78,'9842369'),(79,'2273277'),(80,'3079072');
INSERT INTO tELEFONO_EMPLEADO([Legajo],[Telefono_Empleado]) VALUES(81,'4961341'),(82,'8605980'),(83,'3704172'),(84,'6410503'),(85,'9630019'),(86,'0075894'),(87,'3641986'),(88,'1595606'),(89,'4865627'),(90,'5853465');
INSERT INTO tELEFONO_EMPLEADO([Legajo],[Telefono_Empleado]) VALUES(91,'4876392'),(92,'7720748'),(93,'2854243'),(94,'2719847'),(95,'5866195'),(96,'6262220'),(97,'7805175'),(98,'0030023'),(99,'4886263'),(100,'0539569');


