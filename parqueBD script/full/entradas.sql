USE [Fuente_Entradas]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 31/10/2016 12:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[Codigo_Categoria] [int] NOT NULL,
	[Descripcion_Categoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED 
(
	[Codigo_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 31/10/2016 12:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[codigo_empleado] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[codigo_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ESCUELA]    Script Date: 31/10/2016 12:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ESCUELA](
	[Codigo_Escuela] [int] NOT NULL,
	[Nombre_Escuela] [varchar](50) NOT NULL,
	[Domicilio_Escuela] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ESCUELA] PRIMARY KEY CLUSTERED 
(
	[Codigo_Escuela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITEM_VENTA]    Script Date: 31/10/2016 12:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM_VENTA](
	[Numero_Ticket] [int] NOT NULL,
	[Codigo_Tipo_Visita] [int] NOT NULL,
	[Cantidad_Alumnos_Reales] [int] NOT NULL,
	[Arancel_por_Alumno] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TELEFONO_ESCUELA]    Script Date: 31/10/2016 12:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TELEFONO_ESCUELA](
	[Codigo_Escuela] [int] NOT NULL,
	[Telefono_Escuela] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TIPO_VISITA]    Script Date: 31/10/2016 12:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIPO_VISITA](
	[Codigo_Tipo_Visita] [int] NOT NULL,
	[Descripcion_Tipo_Visita] [varchar](50) NOT NULL,
	[Arancel_Por_Alumno] [float] NOT NULL,
	[Codigo_Categoria] [int] NOT NULL,
 CONSTRAINT [PK_TIPO_VISITA] PRIMARY KEY CLUSTERED 
(
	[Codigo_Tipo_Visita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 31/10/2016 12:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[Numero_Ticket] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Codigo_Empleado] [int] NOT NULL,
	[Codigo_Escuela] [int] NOT NULL,
 CONSTRAINT [PK_VENTA] PRIMARY KEY CLUSTERED 
(
	[Numero_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ITEM_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_VENTA_TIPO_VISITA] FOREIGN KEY([Codigo_Tipo_Visita])
REFERENCES [dbo].[TIPO_VISITA] ([Codigo_Tipo_Visita])
GO
ALTER TABLE [dbo].[ITEM_VENTA] CHECK CONSTRAINT [FK_ITEM_VENTA_TIPO_VISITA]
GO
ALTER TABLE [dbo].[ITEM_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_VENTA_VENTA] FOREIGN KEY([Numero_Ticket])
REFERENCES [dbo].[VENTA] ([Numero_Ticket])
GO
ALTER TABLE [dbo].[ITEM_VENTA] CHECK CONSTRAINT [FK_ITEM_VENTA_VENTA]
GO
ALTER TABLE [dbo].[TELEFONO_ESCUELA]  WITH CHECK ADD  CONSTRAINT [FK_TELEFONO_ESCUELA_ESCUELA] FOREIGN KEY([Codigo_Escuela])
REFERENCES [dbo].[ESCUELA] ([Codigo_Escuela])
GO
ALTER TABLE [dbo].[TELEFONO_ESCUELA] CHECK CONSTRAINT [FK_TELEFONO_ESCUELA_ESCUELA]
GO
ALTER TABLE [dbo].[TIPO_VISITA]  WITH CHECK ADD  CONSTRAINT [FK_TIPO_VISITA_CATEGORIA] FOREIGN KEY([Codigo_Categoria])
REFERENCES [dbo].[CATEGORIA] ([Codigo_Categoria])
GO
ALTER TABLE [dbo].[TIPO_VISITA] CHECK CONSTRAINT [FK_TIPO_VISITA_CATEGORIA]
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_EMPLEADO] FOREIGN KEY([Codigo_Empleado])
REFERENCES [dbo].[EMPLEADO] ([codigo_empleado])
GO
ALTER TABLE [dbo].[VENTA] CHECK CONSTRAINT [FK_VENTA_EMPLEADO]
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_ESCUELA] FOREIGN KEY([Codigo_Escuela])
REFERENCES [dbo].[ESCUELA] ([Codigo_Escuela])
GO
ALTER TABLE [dbo].[VENTA] CHECK CONSTRAINT [FK_VENTA_ESCUELA]
GO





INSERT INTO CATEGORIA([Codigo_Categoria],[Descripcion_Categoria]) VALUES(1,'Categoria A'),(2,'Categoria B'),(3,'Categoria C'),(4,'Categoria D'),(5,'Categoria F');


INSERT INTO TIPO_VISITA([Codigo_Tipo_Visita],[Descripcion_Tipo_Visita],[Arancel_Por_Alumno],[Codigo_Categoria]) VALUES(1,'fermentum fermentum ',23999,5),(2,'sed turpis nec mauris ',21701,2),(3,'in aliquet lobortis, nisi ',22717,4),(4,'Nam ligula elit, hendrerit',20818,3),(5,'amet, consectetuer ',20167,3),(6,'nonummy ipsum non arcu.',24877,2),(7,'ut nisi a odio semper ',21676,1),(8,'sit amet risus. Donec ',24593,5),(9,'odio, auctor vitae, aliquet ',20051,4),(10,'sit amet',21519,2);

INSERT INTO ESCUELA([codigo_escuela],[Nombre_Escuela],[Domicilio_Escuela]) VALUES(1,'Aliquam Nisl Nulla Company','9468 Lorem Ctra.'),(2,'Eros Non Company','6916 Porttitor Calle'),(3,'Sodales At Velit Incorporated','Apdo.:128-5935 Nulla C/'),(4,'Euismod Ac Industries','753 At '),(5,'Tincidunt Corporation','2582 Lorem, '),(6,'Tristique Senectus Et PC','491-8338 Blandit. Avda.'),(7,'Natoque Foundation','420-5957 Mauris C.'),(8,'Volutpat Nulla Ltd','Apdo.:679-3662 Blandit Avda.'),(9,'Malesuada Ut Ltd','8676 Quisque Avenida'),(10,'Elit Elit Corp.','416-5416 Risus Av.');
INSERT INTO ESCUELA([codigo_escuela],[Nombre_Escuela],[Domicilio_Escuela]) VALUES(11,'Eleifend Egestas Corp.','Apartado núm.: 984, 1950 Consequat Carretera'),(12,'Faucibus Incorporated','583-954 Erat Carretera'),(13,'Cursus Et Ltd','7036 Vel, Avda.'),(14,'Proin Dolor Nulla LLP','Apartado núm.: 174, 1143 Posuere, Av.'),(15,'Ornare LLC','298-1910 Natoque C.'),(16,'Accumsan Interdum Limited','2066 Eget, Avenida'),(17,'Dapibus Quam Quis Foundation','406-8466 A, Av.'),(18,'Tincidunt LLC','Apdo.:931-8409 Cras Carretera'),(19,'Metus Aenean Limited','4401 Sed C.'),(20,'Tincidunt Dui Augue Associates','Apdo.:208-2526 Eu ');
INSERT INTO ESCUELA([codigo_escuela],[Nombre_Escuela],[Domicilio_Escuela]) VALUES(21,'Donec Consulting','Apartado núm.: 852, 8924 Laoreet '),(22,'Bibendum Donec Limited','Apartado núm.: 888, 5540 Ligula. Av.'),(23,'Nisi Magna Sed Company','Apartado núm.: 308, 7937 Natoque C.'),(24,'Non Limited','332-1185 Facilisi. C.'),(25,'Eu Incorporated','746-836 Senectus C/'),(26,'Nisi Cum Sociis Corp.','Apartado núm.: 316, 2584 Fermentum Av.'),(27,'Lacus Varius Et Incorporated','Apartado núm.: 767, 6432 Amet Calle'),(28,'Quam Vel PC','Apartado núm.: 766, 2794 Dolor. Av.'),(29,'In Inc.','619-8315 Elit. C.'),(30,'Metus Vivamus Corporation','7323 Nec Avda.');
INSERT INTO ESCUELA([codigo_escuela],[Nombre_Escuela],[Domicilio_Escuela]) VALUES(31,'Nascetur PC','934-7180 Penatibus C.'),(32,'Tellus Id Institute','9485 Proin C/'),(33,'Semper Industries','772-2898 Id Avenida'),(34,'Gravida Sit Amet LLC','Apartado núm.: 554, 2173 Magna C.'),(35,'In At Pede Associates','2098 Ut Carretera'),(36,'Convallis Dolor Quisque Institute','371-9063 Sed Calle'),(37,'Aliquam Eros Turpis Industries','733-3274 Vivamus C.'),(38,'Egestas Blandit Nam Industries','6992 Felis Avda.'),(39,'Parturient Corporation','Apartado núm.: 988, 5130 Placerat Carretera'),(40,'Felis Industries','Apdo.:829-3699 Mauris Ctra.');
INSERT INTO ESCUELA([codigo_escuela],[Nombre_Escuela],[Domicilio_Escuela]) VALUES(41,'Magna Corporation','Apdo.:427-218 Odio. Ctra.'),(42,'Nunc In Institute','Apdo.:922-1202 Etiam C.'),(43,'Ultricies Company','Apdo.:880-4572 Curabitur Carretera'),(44,'Mattis Industries','Apartado núm.: 411, 3181 Ipsum Carretera'),(45,'Nisi LLC','Apdo.:940-9390 Elit. C/'),(46,'Diam Associates','Apartado núm.: 210, 1806 Sem. C.'),(47,'Pretium Aliquet Metus LLC','Apdo.:944-2967 Pharetra '),(48,'Aliquam Institute','Apdo.:722-9975 Semper Carretera'),(49,'Amet PC','Apdo.:612-8948 Sit '),(50,'Eu Nibh LLP','584-4614 Laoreet, C.');
INSERT INTO ESCUELA([codigo_escuela],[Nombre_Escuela],[Domicilio_Escuela]) VALUES(51,'Ac Feugiat Incorporated','4575 Eget Calle'),(52,'Quam Pellentesque LLP','Apartado núm.: 891, 5629 Mattis. Avda.'),(53,'Curae; Corp.','922-1260 Orci. Avda.'),(54,'Quisque Porttitor Inc.','Apdo.:363-2925 Nullam Ctra.'),(55,'Magna A Neque LLP','7833 Fusce Avda.'),(56,'Ultricies Dignissim Incorporated','Apartado núm.: 153, 5595 Cursus, Avenida'),(57,'Ligula Nullam Foundation','Apdo.:353-9371 Integer C/'),(58,'Erat Ltd','Apdo.:737-8248 Suspendisse C/'),(59,'Non Sapien Molestie Incorporated','954-7234 Lorem '),(60,'Mattis Ornare Corporation','Apartado núm.: 115, 3072 Eu Avda.');
INSERT INTO ESCUELA([codigo_escuela],[Nombre_Escuela],[Domicilio_Escuela]) VALUES(61,'Orci Quis Corporation','9792 Sed C.'),(62,'Diam Lorem Auctor Corporation','359-4265 Aenean Carretera'),(63,'Ultricies Ligula Nullam Ltd','Apdo.:576-2158 Dictum Avenida'),(64,'Et Arcu Imperdiet Company','Apdo.:310-5995 Lorem C.'),(65,'Eu Company','798-2628 Et Carretera'),(66,'Ultricies Ltd','876 Nulla Avda.'),(67,'Lectus Pede Incorporated','Apartado núm.: 289, 8499 Euismod Carretera'),(68,'Lectus Incorporated','4821 Gravida C.'),(69,'Molestie Limited','9029 Eget C.'),(70,'Sed Congue Elit Foundation','546-2372 Eget Carretera');
INSERT INTO ESCUELA([codigo_escuela],[Nombre_Escuela],[Domicilio_Escuela]) VALUES(71,'Dui Associates','Apdo.:968-3344 Sem '),(72,'Quam LLC','900-4812 Erat. '),(73,'Quisque Ac Libero Inc.','8110 Ac Avda.'),(74,'Nibh Consulting','2930 Et Avda.'),(75,'Mauris Corp.','740-8402 Nulla. Calle'),(76,'Blandit Nam Nulla Foundation','Apdo.:635-6371 Sit Avenida'),(77,'Augue Ac Ipsum Industries','556-1552 Est Avenida'),(78,'Lacinia Vitae Sodales Company','Apdo.:796-6257 Nibh Avenida'),(79,'Augue Company','815-1158 Nulla C/'),(80,'Natoque Penatibus Et Foundation','804-2528 Ut Calle');
INSERT INTO ESCUELA([codigo_escuela],[Nombre_Escuela],[Domicilio_Escuela]) VALUES(81,'Lacus Varius Company','Apdo.:174-7836 Rutrum Ctra.'),(82,'Nulla Corp.','Apartado núm.: 557, 2933 Quis, Avenida'),(83,'Sagittis Felis Institute','3752 Auctor C.'),(84,'Lacinia Vitae Sodales Foundation','3071 Magna Ctra.'),(85,'Mi Enim Company','Apdo.:229-6170 Neque. C/'),(86,'Luctus Limited','302-8129 Molestie '),(87,'Consectetuer Rhoncus Nullam Associates','Apdo.:108-9381 Molestie Avda.'),(88,'Euismod Foundation','167-3710 Urna. Avenida'),(89,'Fusce Mi Lorem LLP','295-3235 Leo Calle'),(90,'Nibh Associates','Apartado núm.: 527, 3640 Neque. Calle');
INSERT INTO ESCUELA([codigo_escuela],[Nombre_Escuela],[Domicilio_Escuela]) VALUES(91,'Congue In Corp.','569-3055 Ac Calle'),(92,'Enim Etiam Industries','Apartado núm.: 235, 5304 Quis Avenida'),(93,'Erat Semper Rutrum Foundation','163-8827 Adipiscing C.'),(94,'Enim LLP','Apartado núm.: 761, 5082 Cum Avda.'),(95,'Cubilia Curae; Phasellus Inc.','3795 Vestibulum Avenida'),(96,'Orci Sem Eget Associates','Apdo.:151-3805 Vulputate, Av.'),(97,'Integer Mollis PC','Apdo.:404-8806 Sed C/'),(98,'Ullamcorper Magna Corp.','Apdo.:556-1467 Lectus Avda.'),(99,'Montes Industries','648 Justo. Av.'),(100,'Lobortis Ltd','4084 Aliquet, Avenida');


INSERT INTO EMPLEADO([codigo_empleado],[nombre],[apellido]) VALUES(1,'Aimee Nolan','Goodman'),(2,'Joshua Hyatt','Glass'),(3,'Athena Nehru','Price'),(4,'Grant Kay','Morales'),(5,'Yeo Blaine','Turner'),(6,'Astra Kato','Randall'),(7,'Miriam Elmo','Craft'),(8,'Jasmine Savannah','Foley'),(9,'Kasimir Dieter','Leach'),(10,'Velma Zenia','Best');
INSERT INTO EMPLEADO([codigo_empleado],[nombre],[apellido]) VALUES(11,'Vivian Candace','Acevedo'),(12,'Caldwell Lara','Humphrey'),(13,'Knox Holly','Mendoza'),(14,'May Quincy','Lyons'),(15,'Driscoll Quintessa','Vance'),(16,'Tobias Joy','Whitney'),(17,'Ali Callie','Spence'),(18,'Maggie Ivy','Weiss'),(19,'Dustin Damon','Fuller'),(20,'Selma Emery','Blake');
INSERT INTO EMPLEADO([codigo_empleado],[nombre],[apellido]) VALUES(21,'Murphy Wesley','Campos'),(22,'Brandon Thor','Bolton'),(23,'Hu Norman','Webb'),(24,'Olga Wallace','Pollard'),(25,'Lenore Lance','Williams'),(26,'Justin Kyle','Singleton'),(27,'Carol Yeo','Allison'),(28,'George Dorothy','Lyons'),(29,'Castor Micah','Giles'),(30,'Gary Cleo','Ross');
INSERT INTO EMPLEADO([codigo_empleado],[nombre],[apellido]) VALUES(31,'Maia Lev','Charles'),(32,'Ava Walker','Richmond'),(33,'Samuel Stephen','Humphrey'),(34,'Kennedy Levi','Mejia'),(35,'Price Oscar','Dominguez'),(36,'Leonard Hayley','Whitaker'),(37,'Marny McKenzie','Farrell'),(38,'Christian Kadeem','Richardson'),(39,'Nicole Velma','Sullivan'),(40,'Lee Marsden','Padilla');
INSERT INTO EMPLEADO([codigo_empleado],[nombre],[apellido]) VALUES(41,'Amber Thaddeus','Shaffer'),(42,'Liberty Mason','Gibson'),(43,'Kato Francis','Mcintosh'),(44,'Wade Iris','Alvarado'),(45,'Basil Brody','Larsen'),(46,'Reed Tana','Perry'),(47,'Zeus Camille','Wynn'),(48,'Libby Mechelle','Spencer'),(49,'Judah Ifeoma','Velazquez'),(50,'Jasmine Emmanuel','Heath');
INSERT INTO EMPLEADO([codigo_empleado],[nombre],[apellido]) VALUES(51,'Cedric Edward','Parsons'),(52,'Alan Kyra','Johnson'),(53,'Berk Frances','Garrison'),(54,'Hayfa Buffy','Mcclure'),(55,'Sydnee Connor','Morales'),(56,'Willow Florence','Mullins'),(57,'Hamish Christine','Willis'),(58,'Xena Zephr','Dotson'),(59,'Ferdinand Micah','Dean'),(60,'Alexis Mara','Moreno');
INSERT INTO EMPLEADO([codigo_empleado],[nombre],[apellido]) VALUES(61,'Tate Madeson','Meyer'),(62,'Lester Calvin','Morales'),(63,'Freya Kieran','Levine'),(64,'Montana Fritz','Browning'),(65,'Quynn Kimberley','Norman'),(66,'Danielle Gregory','Swanson'),(67,'Oscar Ila','Finch'),(68,'Amethyst Daquan','Finch'),(69,'Kevin Colton','Vinson'),(70,'Keelie Libby','Burris');
INSERT INTO EMPLEADO([codigo_empleado],[nombre],[apellido]) VALUES(71,'Vanna Harriet','Mcleod'),(72,'Echo Geraldine','Lindsey'),(73,'Aurelia Teegan','Duffy'),(74,'Rhea Lewis','Vega'),(75,'Venus Stephanie','Reynolds'),(76,'Demetria Kristen','Mcguire'),(77,'Wanda Lynn','Washington'),(78,'Vanna Alice','Kelly'),(79,'Brett Genevieve','Sweet'),(80,'Moana Ahmed','Farrell');
INSERT INTO EMPLEADO([codigo_empleado],[nombre],[apellido]) VALUES(81,'Odessa Anne','Branch'),(82,'Raphael Ulric','Ferrell'),(83,'Brittany Jaquelyn','Oneil'),(84,'Griffin Tanya','Best'),(85,'Jameson Faith','Sellers'),(86,'Sydney Leigh','Webster'),(87,'Carol Maile','Thornton'),(88,'Deacon Aurelia','Bowman'),(89,'Sophia Stuart','Mendez'),(90,'Rhoda Kellie','Shepherd');
INSERT INTO EMPLEADO([codigo_empleado],[nombre],[apellido]) VALUES(91,'Althea Tanner','Macias'),(92,'Fritz Fredericka','David'),(93,'Olivia Brent','Morse'),(94,'Charity Risa','Steele'),(95,'Katelyn Audrey','Dillard'),(96,'Geoffrey Marvin','Foster'),(97,'Nina Matthew','Rodriquez'),(98,'Leila Timothy','Sutton'),(99,'Arthur Gisela','Williamson'),(100,'Hilda Patrick','Hopper');


INSERT INTO TELEFONO_ESCUELA([codigo_escuela],[Telefono_Escuela]) VALUES(1,'6352389'),(2,'6544343'),(3,'2582297'),(4,'7967155'),(5,'2674818'),(6,'3216642'),(7,'9544098'),(8,'4267208'),(9,'2073891'),(10,'3821119');
INSERT INTO TELEFONO_ESCUELA([codigo_escuela],[Telefono_Escuela]) VALUES(11,'3418112'),(12,'8567183'),(13,'3343041'),(14,'1797332'),(15,'9733104'),(16,'3584948'),(17,'0197494'),(18,'0705221'),(19,'7749448'),(20,'8736979');
INSERT INTO TELEFONO_ESCUELA([codigo_escuela],[Telefono_Escuela]) VALUES(21,'1642598'),(22,'7572205'),(23,'2991365'),(24,'6721146'),(25,'2077360'),(26,'5931561'),(27,'3765965'),(28,'7790048'),(29,'2999605'),(30,'6355507');
INSERT INTO TELEFONO_ESCUELA([codigo_escuela],[Telefono_Escuela]) VALUES(31,'0181425'),(32,'7085538'),(33,'6742922'),(34,'6659973'),(35,'2046617'),(36,'8372082'),(37,'9260040'),(38,'4040049'),(39,'5712758'),(40,'5846200');
INSERT INTO TELEFONO_ESCUELA([codigo_escuela],[Telefono_Escuela]) VALUES(41,'7679607'),(42,'9119185'),(43,'6237095'),(44,'4432609'),(45,'8768168'),(46,'5149147'),(47,'2844747'),(48,'8171159'),(49,'8676469'),(50,'1124593');
INSERT INTO TELEFONO_ESCUELA([codigo_escuela],[Telefono_Escuela]) VALUES(51,'7770264'),(52,'8788560'),(53,'4841635'),(54,'7096238'),(55,'7356316'),(56,'3025946'),(57,'5225582'),(58,'0356835'),(59,'6153653'),(60,'2032570');
INSERT INTO TELEFONO_ESCUELA([codigo_escuela],[Telefono_Escuela]) VALUES(61,'1706757'),(62,'3104572'),(63,'5281741'),(64,'6317485'),(65,'1353981'),(66,'8201638'),(67,'4835519'),(68,'5841447'),(69,'4976568'),(70,'6112949');
INSERT INTO TELEFONO_ESCUELA([codigo_escuela],[Telefono_Escuela]) VALUES(71,'7350150'),(72,'7248533'),(73,'6561334'),(74,'4296561'),(75,'8337023'),(76,'7127030'),(77,'0985331'),(78,'5377492'),(79,'4045137'),(80,'5617562');
INSERT INTO TELEFONO_ESCUELA([codigo_escuela],[Telefono_Escuela]) VALUES(81,'3938518'),(82,'0019504'),(83,'0323312'),(84,'0848416'),(85,'5550500'),(86,'0975218'),(87,'6754299'),(88,'0557543'),(89,'9370606'),(90,'6211807');
INSERT INTO TELEFONO_ESCUELA([codigo_escuela],[Telefono_Escuela]) VALUES(91,'3203915'),(92,'6531081'),(93,'6891807'),(94,'1033441'),(95,'7651863'),(96,'9545900'),(97,'9221354'),(98,'9888066'),(99,'0803039'),(100,'2365572');


INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(1,'2016-06-18',80,93),(2,'2017-06-14',77,22),(3,'2016-09-17',55,81),(4,'2017-06-07',68,90),(5,'2016-08-04',71,48),(6,'2016-12-28',50,18),(7,'2015-11-06',55,85),(8,'2016-06-07',4,45),(9,'2016-11-24',69,67),(10,'2017-06-11',92,57);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(11,'2015-05-31',61,90),(12,'2017-06-22',40,23),(13,'2017-06-10',74,3),(14,'2016-04-29',16,8),(15,'2015-04-21',7,80),(16,'2016-07-17',58,25),(17,'2014-10-26',18,91),(18,'2016-05-14',19,67),(19,'2016-11-15',68,4),(20,'2016-10-01',17,69);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(21,'2015-10-31',63,26),(22,'2015-11-23',91,3),(23,'2015-01-21',10,6),(24,'2015-08-02',45,87),(25,'2016-09-23',24,50),(26,'2015-09-27',69,61),(27,'2015-09-08',44,76),(28,'2016-07-29',74,100),(29,'2016-06-25',28,66),(30,'2016-08-29',46,17);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(31,'2015-05-17',70,99),(32,'2015-01-29',31,66),(33,'2017-08-11',46,95),(34,'2017-01-05',42,75),(35,'2017-01-11',43,26),(36,'2015-12-06',52,59),(37,'2017-04-16',38,46),(38,'2015-03-05',85,64),(39,'2015-12-06',60,54),(40,'2016-06-17',59,25);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(41,'2016-07-04',88,50),(42,'2016-03-24',52,22),(43,'2016-03-20',51,59),(44,'2015-07-24',73,97),(45,'2015-08-26',77,83),(46,'2015-05-31',16,17),(47,'2015-05-20',52,23),(48,'2016-01-28',27,96),(49,'2017-08-11',32,90),(50,'2014-10-27',11,61);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(51,'2017-02-06',43,22),(52,'2017-04-08',35,21),(53,'2014-10-04',7,31),(54,'2015-08-24',57,71),(55,'2016-09-24',19,28),(56,'2016-06-16',40,56),(57,'2016-11-06',38,87),(58,'2015-07-28',39,74),(59,'2015-07-11',16,56),(60,'2016-12-30',86,91);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(61,'2015-02-22',71,78),(62,'2017-06-10',1,76),(63,'2015-07-15',58,65),(64,'2015-08-11',69,77),(65,'2015-01-09',86,78),(66,'2016-04-19',67,20),(67,'2016-11-10',47,23),(68,'2016-05-05',4,57),(69,'2015-08-30',32,80),(70,'2014-12-11',71,6);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(71,'2017-07-17',10,74),(72,'2016-05-13',39,22),(73,'2015-04-22',36,65),(74,'2016-12-27',51,73),(75,'2017-02-16',67,63),(76,'2014-12-18',70,28),(77,'2017-04-04',43,98),(78,'2017-05-22',59,84),(79,'2015-06-01',93,31),(80,'2016-06-21',65,42);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(81,'2016-09-25',79,73),(82,'2015-10-31',17,74),(83,'2017-02-22',81,49),(84,'2017-07-18',94,96),(85,'2017-05-31',32,40),(86,'2015-03-17',76,8),(87,'2016-12-19',60,2),(88,'2016-10-28',45,39),(89,'2016-06-28',88,13),(90,'2016-06-08',73,10);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(91,'2017-04-10',5,42),(92,'2015-09-29',12,83),(93,'2016-02-11',16,37),(94,'2016-06-07',40,65),(95,'2014-12-11',57,40),(96,'2016-08-10',51,1),(97,'2017-08-30',86,66),(98,'2015-01-07',53,13),(99,'2016-04-05',27,35),(100,'2015-12-30',3,30);

INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(101,'2015-11-07',75,46),(102,'2015-10-01',63,60),(103,'2016-02-22',57,49),(104,'2015-05-24',95,41),(105,'2014-11-06',56,96),(106,'2017-05-04',2,75),(107,'2017-02-18',4,23),(108,'2017-08-27',42,57),(109,'2017-06-01',99,11),(110,'2016-04-12',61,37);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(111,'2014-12-14',3,75),(112,'2014-10-25',84,40),(113,'2017-05-12',73,33),(114,'2017-02-12',30,67),(115,'2014-11-25',20,39),(116,'2015-11-25',30,1),(117,'2016-03-24',42,39),(118,'2015-04-18',70,38),(119,'2015-06-13',47,28),(120,'2015-07-19',95,41);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(121,'2015-11-07',71,28),(122,'2015-12-24',7,80),(123,'2015-12-25',86,34),(124,'2014-10-29',55,69),(125,'2017-07-18',1,47),(126,'2015-04-11',45,50),(127,'2015-04-10',34,3),(128,'2016-12-30',39,24),(129,'2016-04-27',6,56),(130,'2015-02-17',72,40);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(131,'2017-10-02',32,92),(132,'2015-02-28',86,58),(133,'2017-09-02',74,29),(134,'2017-06-23',55,44),(135,'2015-03-08',85,54),(136,'2017-05-02',66,60),(137,'2016-09-17',79,1),(138,'2017-03-16',56,91),(139,'2016-01-29',92,85),(140,'2015-05-27',76,78);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(141,'2017-06-27',84,54),(142,'2015-03-07',83,38),(143,'2015-07-16',32,9),(144,'2015-09-07',36,25),(145,'2015-02-16',35,47),(146,'2015-10-14',21,15),(147,'2016-06-01',65,75),(148,'2016-06-28',77,30),(149,'2015-08-31',71,12),(150,'2016-05-04',48,89);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(151,'2015-11-05',32,15),(152,'2017-03-23',10,39),(153,'2015-10-22',95,34),(154,'2014-11-08',61,29),(155,'2015-02-27',15,94),(156,'2015-09-16',32,96),(157,'2015-09-15',55,60),(158,'2015-11-27',12,46),(159,'2016-10-02',72,70),(160,'2017-01-02',71,29);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(161,'2014-10-27',23,84),(162,'2015-09-19',74,93),(163,'2014-10-22',40,22),(164,'2015-02-10',38,10),(165,'2015-03-06',93,24),(166,'2016-01-15',55,76),(167,'2016-05-20',84,29),(168,'2016-12-29',7,84),(169,'2016-01-23',30,17),(170,'2016-09-30',79,83);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(171,'2015-12-04',79,88),(172,'2017-03-02',64,7),(173,'2014-11-24',14,75),(174,'2016-12-09',42,33),(175,'2017-07-28',69,1),(176,'2016-04-30',74,71),(177,'2017-01-08',14,40),(178,'2015-01-25',21,97),(179,'2016-01-17',2,70),(180,'2015-06-05',43,60);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(181,'2015-09-07',41,16),(182,'2016-02-29',11,98),(183,'2016-08-20',96,35),(184,'2016-01-15',36,24),(185,'2017-07-05',100,88),(186,'2014-11-14',63,80),(187,'2016-05-25',87,36),(188,'2014-11-21',65,85),(189,'2015-07-23',36,12),(190,'2015-01-10',7,90);
INSERT INTO VENTA([Numero_Ticket],[Fecha],[Codigo_Empleado],[Codigo_Escuela]) VALUES(191,'2016-04-25',10,11),(192,'2017-04-05',61,86),(193,'2016-03-14',77,47),(194,'2017-05-23',93,6),(195,'2017-06-06',36,46),(196,'2017-08-03',41,48),(197,'2016-03-24',69,30),(198,'2017-10-10',16,73),(199,'2016-11-29',31,98),(200,'2016-05-11',2,76);


INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(183,7,14,20304),(15,8,13,20601),(12,5,7,32770),(178,3,10,39370),(48,10,19,22850),(23,7,8,27193),(164,10,20,30137),(16,2,29,29235),(8,10,3,28245),(74,9,27,34175);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(93,8,12,25312),(64,5,30,24233),(182,8,14,23257),(35,5,13,29420),(31,4,29,32219),(70,6,1,39863),(178,8,26,27186),(132,9,12,37286),(28,7,16,38268),(83,6,8,31065);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(124,4,13,35370),(20,10,4,37241),(66,10,24,31243),(162,4,5,35877),(123,2,21,25630),(171,7,28,36428),(110,4,12,22071),(92,10,28,35956),(36,9,11,30683),(12,2,13,20615);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(4,6,24,38012),(192,8,18,37609),(188,5,9,21234),(148,5,13,33078),(85,9,21,20503),(183,8,19,37972),(166,5,22,20205),(121,6,23,35904),(117,6,21,39204),(138,2,12,38876);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(120,2,27,30435),(7,1,1,39442),(10,3,6,34332),(129,1,29,38297),(118,5,26,39385),(117,3,9,26937),(96,5,13,34821),(179,4,25,37456),(47,9,17,36377),(116,4,20,31325);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(146,1,14,36426),(137,5,20,33868),(80,9,22,31095),(135,7,1,24846),(162,5,8,27084),(180,6,4,20787),(57,2,23,39955),(117,10,26,33891),(29,5,2,23454),(184,9,23,37533);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(147,1,26,29302),(103,9,27,39345),(134,4,29,23463),(168,6,10,21537),(74,5,26,39647),(131,4,20,27980),(93,2,1,22558),(153,10,12,27455),(25,5,18,35566),(94,6,18,30078);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(109,5,16,23600),(87,8,26,37859),(63,8,13,31879),(148,7,10,24727),(54,5,23,39711),(182,9,11,24580),(164,4,16,38505),(107,8,24,33773),(138,4,16,31713),(20,4,26,37202);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(34,3,30,31258),(76,9,2,24223),(154,6,18,33664),(86,7,18,35753),(51,3,1,25101),(91,6,23,33860),(198,3,23,21849),(166,6,22,24380),(195,4,7,21049),(193,6,30,33089);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(113,3,12,36150),(5,4,14,23446),(87,9,15,33767),(173,6,13,29528),(137,3,12,31373),(146,5,18,39857),(157,1,18,34134),(35,2,30,26307),(72,5,25,31925),(29,5,9,33005);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(101,6,15,32116),(184,8,28,33189),(62,8,8,31313),(74,6,28,25386),(36,1,15,32650),(53,1,10,21488),(196,2,3,27352),(54,1,23,31871),(2,9,19,24737),(74,6,20,37632);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(193,7,29,38630),(7,5,20,24610),(71,5,27,29559),(45,3,4,25590),(3,5,2,32555),(133,8,4,38674),(48,6,20,21635),(155,1,25,35553),(125,9,28,23156),(22,10,20,38470);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(167,4,21,25301),(17,1,5,39034),(39,3,13,36972),(38,7,4,35212),(150,8,13,28829),(86,2,20,38494),(69,8,22,29297),(89,4,21,25866),(32,10,13,35844),(62,1,25,38594);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(3,3,2,31311),(130,10,20,39534),(42,7,16,31164),(37,10,11,33914),(42,2,3,24575),(197,8,13,24362),(61,10,10,33396),(157,4,15,37560),(174,4,10,33815),(109,1,23,22433);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(119,1,1,31926),(171,7,28,27459),(175,7,10,37117),(153,7,20,38295),(65,9,2,26008),(194,8,3,22752),(183,2,22,38767),(92,8,23,21632),(196,6,7,26980),(160,7,19,28930);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(7,5,19,34416),(171,3,25,23267),(164,1,11,39898),(154,4,3,28173),(50,9,15,28086),(108,1,16,27195),(161,7,30,28903),(47,3,16,37046),(181,9,17,32165),(132,10,12,23649);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(86,5,6,36662),(172,9,18,37249),(185,1,19,36111),(189,6,16,24638),(107,10,30,36043),(180,10,10,22239),(96,2,27,31237),(154,7,28,38693),(90,9,26,26429),(166,6,25,27092);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(85,2,30,24782),(167,6,6,35188),(69,3,17,36494),(134,5,15,32759),(88,2,1,37175),(190,4,22,23229),(138,10,18,37140),(48,7,8,39830),(67,8,7,27769),(67,7,3,31808);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(192,10,7,26525),(40,7,19,31095),(78,3,30,28462),(183,3,26,34715),(175,6,16,28845),(60,10,10,20719),(184,6,25,23233),(78,5,25,23032),(122,5,9,38880),(99,6,28,29477);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Codigo_Tipo_Visita],[Cantidad_Alumnos_Reales],[Arancel_por_Alumno]) VALUES(106,3,12,26783),(181,3,14,27673),(94,2,19,39788),(46,1,12,30056),(128,9,9,36947),(113,6,13,35039),(126,10,22,20315),(123,9,8,36543),(90,5,26,39656),(42,5,11,30226);
