USE [Fuente_Ventas1]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 31/10/2016 12:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[ID_Categoria] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED 
(
	[ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 31/10/2016 12:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[ID_Empleado] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NULL,
 CONSTRAINT [PK_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ESCUELA]    Script Date: 31/10/2016 12:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ESCUELA](
	[ID_Escuela] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Domicilio] [varchar](300) NOT NULL,
 CONSTRAINT [PK_ESCUELA] PRIMARY KEY CLUSTERED 
(
	[ID_Escuela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITEM_VENTA]    Script Date: 31/10/2016 12:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM_VENTA](
	[Numero_Ticket] [int] NOT NULL,
	[ID_Producto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 31/10/2016 12:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[ID_Producto] [int] NOT NULL,
	[ID_Subcategoria] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Precio_Actual] [float] NOT NULL,
 CONSTRAINT [PK_PRODUCTO] PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUBCATEGORIA]    Script Date: 31/10/2016 12:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUBCATEGORIA](
	[ID_Subcategoria] [int] NOT NULL,
	[ID_Categoria] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SUBCATEGORIA] PRIMARY KEY CLUSTERED 
(
	[ID_Subcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TELEFONO_ESCUELA]    Script Date: 31/10/2016 12:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TELEFONO_ESCUELA](
	[ID_Escuela] [int] NOT NULL,
	[Telefono_Escuela] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 31/10/2016 12:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[Numero_Ticket] [int] NOT NULL,
	[Fecha_Venta] [date] NOT NULL,
	[ID_Empleado] [int] NOT NULL,
	[ID_Escuela] [int] NOT NULL,
 CONSTRAINT [PK_VENTA] PRIMARY KEY CLUSTERED 
(
	[Numero_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ITEM_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_VENTA_PRODUCTO] FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[PRODUCTO] ([ID_Producto])
GO
ALTER TABLE [dbo].[ITEM_VENTA] CHECK CONSTRAINT [FK_ITEM_VENTA_PRODUCTO]
GO
ALTER TABLE [dbo].[ITEM_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_VENTA_VENTA] FOREIGN KEY([Numero_Ticket])
REFERENCES [dbo].[VENTA] ([Numero_Ticket])
GO
ALTER TABLE [dbo].[ITEM_VENTA] CHECK CONSTRAINT [FK_ITEM_VENTA_VENTA]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_SUBCATEGORIA] FOREIGN KEY([ID_Subcategoria])
REFERENCES [dbo].[SUBCATEGORIA] ([ID_Subcategoria])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_SUBCATEGORIA]
GO
ALTER TABLE [dbo].[SUBCATEGORIA]  WITH CHECK ADD  CONSTRAINT [FK_SUBCATEGORIA_CATEGORIA] FOREIGN KEY([ID_Categoria])
REFERENCES [dbo].[CATEGORIA] ([ID_Categoria])
GO
ALTER TABLE [dbo].[SUBCATEGORIA] CHECK CONSTRAINT [FK_SUBCATEGORIA_CATEGORIA]
GO
ALTER TABLE [dbo].[TELEFONO_ESCUELA]  WITH CHECK ADD  CONSTRAINT [FK_TELEFONO_ESCUELA_ESCUELA] FOREIGN KEY([ID_Escuela])
REFERENCES [dbo].[ESCUELA] ([ID_Escuela])
GO
ALTER TABLE [dbo].[TELEFONO_ESCUELA] CHECK CONSTRAINT [FK_TELEFONO_ESCUELA_ESCUELA]
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_EMPLEADO] FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[EMPLEADO] ([ID_Empleado])
GO
ALTER TABLE [dbo].[VENTA] CHECK CONSTRAINT [FK_VENTA_EMPLEADO]
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_ESCUELA] FOREIGN KEY([ID_Escuela])
REFERENCES [dbo].[ESCUELA] ([ID_Escuela])
GO
ALTER TABLE [dbo].[VENTA] CHECK CONSTRAINT [FK_VENTA_ESCUELA]
GO




INSERT INTO CATEGORIA([ID_Categoria],[Descripcion]) VALUES(1,'Categoria 1'),(2,'Categoria 2'),(3,'Categoria 3'),(4,'Categoria 4'),(5,'Categoria 5'),(6,'Categoria 6'),(7,'Categoria 7'),(8,'Categoria 8'),(9,'Categoria 9'),(10,'Categoria 10');


INSERT INTO SUBCATEGORIA([ID_Subcategoria],[ID_Categoria],[Descripcion]) VALUES(1,6,'SUB_CAT 1'),(2,2,'SUB_CAT 2'),(3,10,'SUB_CAT 3'),(4,1,'SUB_CAT 4'),(5,1,'SUB_CAT 5'),(6,6,'SUB_CAT 6'),(7,2,'SUB_CAT 7'),(8,2,'SUB_CAT 8'),(9,5,'SUB_CAT 9'),(10,5,'SUB_CAT 10');


INSERT INTO PRODUCTO([ID_Producto],[ID_Subcategoria],[Descripcion],[Precio_Actual]) VALUES(1,7,'amet',7441),(2,2,'eget',2191),(3,9,'sit',3846),(4,6,'sit',6306),(5,5,'tincidunt',5679),(6,8,'lacinia.',11899),(7,10,'blandit.',5195),(8,7,'malesuada',13201),(9,4,'ante',11836),(10,7,'fames',5766);
INSERT INTO PRODUCTO([ID_Producto],[ID_Subcategoria],[Descripcion],[Precio_Actual]) VALUES(11,5,'at',8170),(12,9,'Quisque',8328),(13,6,'elit',7422),(14,2,'eget',10621),(15,2,'dolor',6804),(16,5,'Nunc',11708),(17,9,'dictum',14467),(18,7,'morbi',11421),(19,4,'eu,',3041),(20,2,'eu',6452);
INSERT INTO PRODUCTO([ID_Producto],[ID_Subcategoria],[Descripcion],[Precio_Actual]) VALUES(21,4,'commodo',8130),(22,7,'lorem,',14075),(23,4,'ut',2456),(24,7,'nonummy',14559),(25,6,'parturient',12590),(26,5,'ultrices.',7147),(27,5,'ac',14513),(28,1,'Aliquam',14160),(29,8,'sed',10194),(30,10,'scelerisque',3242);
INSERT INTO PRODUCTO([ID_Producto],[ID_Subcategoria],[Descripcion],[Precio_Actual]) VALUES(31,3,'dui,',9373),(32,5,'id,',13762),(33,2,'tellus.',14357),(34,3,'egestas',9844),(35,5,'orci',2284),(36,4,'luctus',9542),(37,10,'euismod',11998),(38,8,'turpis.',11646),(39,3,'nisl.',9244),(40,6,'Nulla',2085);
INSERT INTO PRODUCTO([ID_Producto],[ID_Subcategoria],[Descripcion],[Precio_Actual]) VALUES(41,2,'eleifend,',14995),(42,4,'consequat',11276),(43,2,'nascetur',7870),(44,1,'ipsum',11539),(45,7,'pede.',12578),(46,3,'sit',14413),(47,5,'sociis',3872),(48,8,'tellus',12765),(49,9,'Phasellus',9112),(50,10,'mollis.',4582);
INSERT INTO PRODUCTO([ID_Producto],[ID_Subcategoria],[Descripcion],[Precio_Actual]) VALUES(51,10,'imperdiet',8091),(52,5,'pede',12868),(53,7,'enim',5172),(54,2,'tortor',5674),(55,6,'dolor',4568),(56,2,'et',11810),(57,2,'convallis',10715),(58,1,'dolor',8830),(59,3,'dui,',13054),(60,10,'auctor',11868);
INSERT INTO PRODUCTO([ID_Producto],[ID_Subcategoria],[Descripcion],[Precio_Actual]) VALUES(61,3,'tincidunt',7489),(62,9,'sapien',13329),(63,8,'ornare',3158),(64,5,'tellus,',5263),(65,5,'hendrerit',12280),(66,1,'molestie',11515),(67,10,'Aenean',2806),(68,9,'vel,',7323),(69,3,'ultrices',7928),(70,7,'sociis',7760);
INSERT INTO PRODUCTO([ID_Producto],[ID_Subcategoria],[Descripcion],[Precio_Actual]) VALUES(71,7,'elit',11996),(72,5,'erat.',12812),(73,9,'Praesent',9386),(74,7,'mauris',2796),(75,8,'in',4649),(76,9,'viverra.',3822),(77,6,'molestie',8984),(78,9,'Integer',2493),(79,4,'Vestibulum',8516),(80,9,'cursus',7071);
INSERT INTO PRODUCTO([ID_Producto],[ID_Subcategoria],[Descripcion],[Precio_Actual]) VALUES(81,6,'Proin',12721),(82,8,'risus.',2715),(83,2,'vitae',7202),(84,6,'sed',12681),(85,3,'rutrum',8050),(86,9,'Suspendisse',7459),(87,7,'ac',8523),(88,3,'erat,',6953),(89,3,'est,',4219),(90,7,'nunc',11545);
INSERT INTO PRODUCTO([ID_Producto],[ID_Subcategoria],[Descripcion],[Precio_Actual]) VALUES(91,8,'nisi',11358),(92,2,'ipsum',5637),(93,9,'odio',4301),(94,6,'felis',7540),(95,7,'cubilia',14897),(96,1,'justo',13450),(97,8,'Sed',2903),(98,2,'ultrices.',13190),(99,2,'sit',13712),(100,4,'vulputate',9594);


INSERT INTO ESCUELA([ID_Escuela],[Nombre],[Domicilio]) VALUES(1,'Aliquam Nisl Nulla Company','9468 Lorem Ctra.'),(2,'Eros Non Company','6916 Porttitor Calle'),(3,'Sodales At Velit Incorporated','Apdo.:128-5935 Nulla C/'),(4,'Euismod Ac Industries','753 At '),(5,'Tincidunt Corporation','2582 Lorem, '),(6,'Tristique Senectus Et PC','491-8338 Blandit. Avda.'),(7,'Natoque Foundation','420-5957 Mauris C.'),(8,'Volutpat Nulla Ltd','Apdo.:679-3662 Blandit Avda.'),(9,'Malesuada Ut Ltd','8676 Quisque Avenida'),(10,'Elit Elit Corp.','416-5416 Risus Av.');
INSERT INTO ESCUELA([ID_Escuela],[Nombre],[Domicilio]) VALUES(11,'Eleifend Egestas Corp.','Apartado núm.: 984, 1950 Consequat Carretera'),(12,'Faucibus Incorporated','583-954 Erat Carretera'),(13,'Cursus Et Ltd','7036 Vel, Avda.'),(14,'Proin Dolor Nulla LLP','Apartado núm.: 174, 1143 Posuere, Av.'),(15,'Ornare LLC','298-1910 Natoque C.'),(16,'Accumsan Interdum Limited','2066 Eget, Avenida'),(17,'Dapibus Quam Quis Foundation','406-8466 A, Av.'),(18,'Tincidunt LLC','Apdo.:931-8409 Cras Carretera'),(19,'Metus Aenean Limited','4401 Sed C.'),(20,'Tincidunt Dui Augue Associates','Apdo.:208-2526 Eu ');
INSERT INTO ESCUELA([ID_Escuela],[Nombre],[Domicilio]) VALUES(21,'Donec Consulting','Apartado núm.: 852, 8924 Laoreet '),(22,'Bibendum Donec Limited','Apartado núm.: 888, 5540 Ligula. Av.'),(23,'Nisi Magna Sed Company','Apartado núm.: 308, 7937 Natoque C.'),(24,'Non Limited','332-1185 Facilisi. C.'),(25,'Eu Incorporated','746-836 Senectus C/'),(26,'Nisi Cum Sociis Corp.','Apartado núm.: 316, 2584 Fermentum Av.'),(27,'Lacus Varius Et Incorporated','Apartado núm.: 767, 6432 Amet Calle'),(28,'Quam Vel PC','Apartado núm.: 766, 2794 Dolor. Av.'),(29,'In Inc.','619-8315 Elit. C.'),(30,'Metus Vivamus Corporation','7323 Nec Avda.');
INSERT INTO ESCUELA([ID_Escuela],[Nombre],[Domicilio]) VALUES(31,'Nascetur PC','934-7180 Penatibus C.'),(32,'Tellus Id Institute','9485 Proin C/'),(33,'Semper Industries','772-2898 Id Avenida'),(34,'Gravida Sit Amet LLC','Apartado núm.: 554, 2173 Magna C.'),(35,'In At Pede Associates','2098 Ut Carretera'),(36,'Convallis Dolor Quisque Institute','371-9063 Sed Calle'),(37,'Aliquam Eros Turpis Industries','733-3274 Vivamus C.'),(38,'Egestas Blandit Nam Industries','6992 Felis Avda.'),(39,'Parturient Corporation','Apartado núm.: 988, 5130 Placerat Carretera'),(40,'Felis Industries','Apdo.:829-3699 Mauris Ctra.');
INSERT INTO ESCUELA([ID_Escuela],[Nombre],[Domicilio]) VALUES(41,'Magna Corporation','Apdo.:427-218 Odio. Ctra.'),(42,'Nunc In Institute','Apdo.:922-1202 Etiam C.'),(43,'Ultricies Company','Apdo.:880-4572 Curabitur Carretera'),(44,'Mattis Industries','Apartado núm.: 411, 3181 Ipsum Carretera'),(45,'Nisi LLC','Apdo.:940-9390 Elit. C/'),(46,'Diam Associates','Apartado núm.: 210, 1806 Sem. C.'),(47,'Pretium Aliquet Metus LLC','Apdo.:944-2967 Pharetra '),(48,'Aliquam Institute','Apdo.:722-9975 Semper Carretera'),(49,'Amet PC','Apdo.:612-8948 Sit '),(50,'Eu Nibh LLP','584-4614 Laoreet, C.');
INSERT INTO ESCUELA([ID_Escuela],[Nombre],[Domicilio]) VALUES(51,'Ac Feugiat Incorporated','4575 Eget Calle'),(52,'Quam Pellentesque LLP','Apartado núm.: 891, 5629 Mattis. Avda.'),(53,'Curae; Corp.','922-1260 Orci. Avda.'),(54,'Quisque Porttitor Inc.','Apdo.:363-2925 Nullam Ctra.'),(55,'Magna A Neque LLP','7833 Fusce Avda.'),(56,'Ultricies Dignissim Incorporated','Apartado núm.: 153, 5595 Cursus, Avenida'),(57,'Ligula Nullam Foundation','Apdo.:353-9371 Integer C/'),(58,'Erat Ltd','Apdo.:737-8248 Suspendisse C/'),(59,'Non Sapien Molestie Incorporated','954-7234 Lorem '),(60,'Mattis Ornare Corporation','Apartado núm.: 115, 3072 Eu Avda.');
INSERT INTO ESCUELA([ID_Escuela],[Nombre],[Domicilio]) VALUES(61,'Orci Quis Corporation','9792 Sed C.'),(62,'Diam Lorem Auctor Corporation','359-4265 Aenean Carretera'),(63,'Ultricies Ligula Nullam Ltd','Apdo.:576-2158 Dictum Avenida'),(64,'Et Arcu Imperdiet Company','Apdo.:310-5995 Lorem C.'),(65,'Eu Company','798-2628 Et Carretera'),(66,'Ultricies Ltd','876 Nulla Avda.'),(67,'Lectus Pede Incorporated','Apartado núm.: 289, 8499 Euismod Carretera'),(68,'Lectus Incorporated','4821 Gravida C.'),(69,'Molestie Limited','9029 Eget C.'),(70,'Sed Congue Elit Foundation','546-2372 Eget Carretera');
INSERT INTO ESCUELA([ID_Escuela],[Nombre],[Domicilio]) VALUES(71,'Dui Associates','Apdo.:968-3344 Sem '),(72,'Quam LLC','900-4812 Erat. '),(73,'Quisque Ac Libero Inc.','8110 Ac Avda.'),(74,'Nibh Consulting','2930 Et Avda.'),(75,'Mauris Corp.','740-8402 Nulla. Calle'),(76,'Blandit Nam Nulla Foundation','Apdo.:635-6371 Sit Avenida'),(77,'Augue Ac Ipsum Industries','556-1552 Est Avenida'),(78,'Lacinia Vitae Sodales Company','Apdo.:796-6257 Nibh Avenida'),(79,'Augue Company','815-1158 Nulla C/'),(80,'Natoque Penatibus Et Foundation','804-2528 Ut Calle');
INSERT INTO ESCUELA([ID_Escuela],[Nombre],[Domicilio]) VALUES(81,'Lacus Varius Company','Apdo.:174-7836 Rutrum Ctra.'),(82,'Nulla Corp.','Apartado núm.: 557, 2933 Quis, Avenida'),(83,'Sagittis Felis Institute','3752 Auctor C.'),(84,'Lacinia Vitae Sodales Foundation','3071 Magna Ctra.'),(85,'Mi Enim Company','Apdo.:229-6170 Neque. C/'),(86,'Luctus Limited','302-8129 Molestie '),(87,'Consectetuer Rhoncus Nullam Associates','Apdo.:108-9381 Molestie Avda.'),(88,'Euismod Foundation','167-3710 Urna. Avenida'),(89,'Fusce Mi Lorem LLP','295-3235 Leo Calle'),(90,'Nibh Associates','Apartado núm.: 527, 3640 Neque. Calle');
INSERT INTO ESCUELA([ID_Escuela],[Nombre],[Domicilio]) VALUES(91,'Congue In Corp.','569-3055 Ac Calle'),(92,'Enim Etiam Industries','Apartado núm.: 235, 5304 Quis Avenida'),(93,'Erat Semper Rutrum Foundation','163-8827 Adipiscing C.'),(94,'Enim LLP','Apartado núm.: 761, 5082 Cum Avda.'),(95,'Cubilia Curae; Phasellus Inc.','3795 Vestibulum Avenida'),(96,'Orci Sem Eget Associates','Apdo.:151-3805 Vulputate, Av.'),(97,'Integer Mollis PC','Apdo.:404-8806 Sed C/'),(98,'Ullamcorper Magna Corp.','Apdo.:556-1467 Lectus Avda.'),(99,'Montes Industries','648 Justo. Av.'),(100,'Lobortis Ltd','4084 Aliquet, Avenida');


INSERT INTO TELEFONO_ESCUELA([ID_escuela],[Telefono_Escuela]) VALUES(1,'6352389'),(2,'6544343'),(3,'2582297'),(4,'7967155'),(5,'2674818'),(6,'3216642'),(7,'9544098'),(8,'4267208'),(9,'2073891'),(10,'3821119');
INSERT INTO TELEFONO_ESCUELA([ID_escuela],[Telefono_Escuela]) VALUES(11,'3418112'),(12,'8567183'),(13,'3343041'),(14,'1797332'),(15,'9733104'),(16,'3584948'),(17,'0197494'),(18,'0705221'),(19,'7749448'),(20,'8736979');
INSERT INTO TELEFONO_ESCUELA([ID_escuela],[Telefono_Escuela]) VALUES(21,'1642598'),(22,'7572205'),(23,'2991365'),(24,'6721146'),(25,'2077360'),(26,'5931561'),(27,'3765965'),(28,'7790048'),(29,'2999605'),(30,'6355507');
INSERT INTO TELEFONO_ESCUELA([ID_escuela],[Telefono_Escuela]) VALUES(31,'0181425'),(32,'7085538'),(33,'6742922'),(34,'6659973'),(35,'2046617'),(36,'8372082'),(37,'9260040'),(38,'4040049'),(39,'5712758'),(40,'5846200');
INSERT INTO TELEFONO_ESCUELA([ID_escuela],[Telefono_Escuela]) VALUES(41,'7679607'),(42,'9119185'),(43,'6237095'),(44,'4432609'),(45,'8768168'),(46,'5149147'),(47,'2844747'),(48,'8171159'),(49,'8676469'),(50,'1124593');
INSERT INTO TELEFONO_ESCUELA([ID_escuela],[Telefono_Escuela]) VALUES(51,'7770264'),(52,'8788560'),(53,'4841635'),(54,'7096238'),(55,'7356316'),(56,'3025946'),(57,'5225582'),(58,'0356835'),(59,'6153653'),(60,'2032570');
INSERT INTO TELEFONO_ESCUELA([ID_escuela],[Telefono_Escuela]) VALUES(61,'1706757'),(62,'3104572'),(63,'5281741'),(64,'6317485'),(65,'1353981'),(66,'8201638'),(67,'4835519'),(68,'5841447'),(69,'4976568'),(70,'6112949');
INSERT INTO TELEFONO_ESCUELA([ID_escuela],[Telefono_Escuela]) VALUES(71,'7350150'),(72,'7248533'),(73,'6561334'),(74,'4296561'),(75,'8337023'),(76,'7127030'),(77,'0985331'),(78,'5377492'),(79,'4045137'),(80,'5617562');
INSERT INTO TELEFONO_ESCUELA([ID_escuela],[Telefono_Escuela]) VALUES(81,'3938518'),(82,'0019504'),(83,'0323312'),(84,'0848416'),(85,'5550500'),(86,'0975218'),(87,'6754299'),(88,'0557543'),(89,'9370606'),(90,'6211807');
INSERT INTO TELEFONO_ESCUELA([ID_escuela],[Telefono_Escuela]) VALUES(91,'3203915'),(92,'6531081'),(93,'6891807'),(94,'1033441'),(95,'7651863'),(96,'9545900'),(97,'9221354'),(98,'9888066'),(99,'0803039'),(100,'2365572');


INSERT INTO EMPLEADO([ID_empleado],[nombre],[apellido]) VALUES(1,'Aimee Nolan','Goodman'),(2,'Joshua Hyatt','Glass'),(3,'Athena Nehru','Price'),(4,'Grant Kay','Morales'),(5,'Yeo Blaine','Turner'),(6,'Astra Kato','Randall'),(7,'Miriam Elmo','Craft'),(8,'Jasmine Savannah','Foley'),(9,'Kasimir Dieter','Leach'),(10,'Velma Zenia','Best');
INSERT INTO EMPLEADO([ID_empleado],[nombre],[apellido]) VALUES(11,'Vivian Candace','Acevedo'),(12,'Caldwell Lara','Humphrey'),(13,'Knox Holly','Mendoza'),(14,'May Quincy','Lyons'),(15,'Driscoll Quintessa','Vance'),(16,'Tobias Joy','Whitney'),(17,'Ali Callie','Spence'),(18,'Maggie Ivy','Weiss'),(19,'Dustin Damon','Fuller'),(20,'Selma Emery','Blake');
INSERT INTO EMPLEADO([ID_empleado],[nombre],[apellido]) VALUES(21,'Murphy Wesley','Campos'),(22,'Brandon Thor','Bolton'),(23,'Hu Norman','Webb'),(24,'Olga Wallace','Pollard'),(25,'Lenore Lance','Williams'),(26,'Justin Kyle','Singleton'),(27,'Carol Yeo','Allison'),(28,'George Dorothy','Lyons'),(29,'Castor Micah','Giles'),(30,'Gary Cleo','Ross');
INSERT INTO EMPLEADO([ID_empleado],[nombre],[apellido]) VALUES(31,'Maia Lev','Charles'),(32,'Ava Walker','Richmond'),(33,'Samuel Stephen','Humphrey'),(34,'Kennedy Levi','Mejia'),(35,'Price Oscar','Dominguez'),(36,'Leonard Hayley','Whitaker'),(37,'Marny McKenzie','Farrell'),(38,'Christian Kadeem','Richardson'),(39,'Nicole Velma','Sullivan'),(40,'Lee Marsden','Padilla');
INSERT INTO EMPLEADO([ID_empleado],[nombre],[apellido]) VALUES(41,'Amber Thaddeus','Shaffer'),(42,'Liberty Mason','Gibson'),(43,'Kato Francis','Mcintosh'),(44,'Wade Iris','Alvarado'),(45,'Basil Brody','Larsen'),(46,'Reed Tana','Perry'),(47,'Zeus Camille','Wynn'),(48,'Libby Mechelle','Spencer'),(49,'Judah Ifeoma','Velazquez'),(50,'Jasmine Emmanuel','Heath');
INSERT INTO EMPLEADO([ID_empleado],[nombre],[apellido]) VALUES(51,'Cedric Edward','Parsons'),(52,'Alan Kyra','Johnson'),(53,'Berk Frances','Garrison'),(54,'Hayfa Buffy','Mcclure'),(55,'Sydnee Connor','Morales'),(56,'Willow Florence','Mullins'),(57,'Hamish Christine','Willis'),(58,'Xena Zephr','Dotson'),(59,'Ferdinand Micah','Dean'),(60,'Alexis Mara','Moreno');
INSERT INTO EMPLEADO([ID_empleado],[nombre],[apellido]) VALUES(61,'Tate Madeson','Meyer'),(62,'Lester Calvin','Morales'),(63,'Freya Kieran','Levine'),(64,'Montana Fritz','Browning'),(65,'Quynn Kimberley','Norman'),(66,'Danielle Gregory','Swanson'),(67,'Oscar Ila','Finch'),(68,'Amethyst Daquan','Finch'),(69,'Kevin Colton','Vinson'),(70,'Keelie Libby','Burris');
INSERT INTO EMPLEADO([ID_empleado],[nombre],[apellido]) VALUES(71,'Vanna Harriet','Mcleod'),(72,'Echo Geraldine','Lindsey'),(73,'Aurelia Teegan','Duffy'),(74,'Rhea Lewis','Vega'),(75,'Venus Stephanie','Reynolds'),(76,'Demetria Kristen','Mcguire'),(77,'Wanda Lynn','Washington'),(78,'Vanna Alice','Kelly'),(79,'Brett Genevieve','Sweet'),(80,'Moana Ahmed','Farrell');
INSERT INTO EMPLEADO([ID_empleado],[nombre],[apellido]) VALUES(81,'Odessa Anne','Branch'),(82,'Raphael Ulric','Ferrell'),(83,'Brittany Jaquelyn','Oneil'),(84,'Griffin Tanya','Best'),(85,'Jameson Faith','Sellers'),(86,'Sydney Leigh','Webster'),(87,'Carol Maile','Thornton'),(88,'Deacon Aurelia','Bowman'),(89,'Sophia Stuart','Mendez'),(90,'Rhoda Kellie','Shepherd');
INSERT INTO EMPLEADO([ID_empleado],[nombre],[apellido]) VALUES(91,'Althea Tanner','Macias'),(92,'Fritz Fredericka','David'),(93,'Olivia Brent','Morse'),(94,'Charity Risa','Steele'),(95,'Katelyn Audrey','Dillard'),(96,'Geoffrey Marvin','Foster'),(97,'Nina Matthew','Rodriquez'),(98,'Leila Timothy','Sutton'),(99,'Arthur Gisela','Williamson'),(100,'Hilda Patrick','Hopper');


INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[ID_Empleado],[ID_Escuela]) VALUES(1,'2016-05-11',89,60),(2,'2016-10-02',97,67),(3,'2016-07-28',4,47),(4,'2016-09-18',39,28),(5,'2016-09-15',52,91),(6,'2016-01-26',87,15),(7,'2016-08-11',77,74),(8,'2016-02-06',65,13),(9,'2015-12-19',57,24),(10,'2016-10-10',6,37);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[ID_Empleado],[ID_Escuela]) VALUES(11,'2015-12-10',11,40),(12,'2016-06-02',58,43),(13,'2016-03-31',54,37),(14,'2016-02-26',63,37),(15,'2015-11-20',59,6),(16,'2016-01-15',86,41),(17,'2016-09-28',85,2),(18,'2016-08-03',36,27),(19,'2016-07-09',55,68),(20,'2016-03-11',11,56);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[ID_Empleado],[ID_Escuela]) VALUES(21,'2016-03-09',19,96),(22,'2015-11-29',19,8),(23,'2016-09-11',43,66),(24,'2016-02-06',22,32),(25,'2016-06-07',87,61),(26,'2016-01-14',7,36),(27,'2016-08-11',91,26),(28,'2016-04-15',37,28),(29,'2015-11-04',90,45),(30,'2016-07-24',19,96);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[ID_Empleado],[ID_Escuela]) VALUES(31,'2016-05-23',99,75),(32,'2016-04-24',94,38),(33,'2016-10-08',2,41),(34,'2015-11-05',49,38),(35,'2015-12-24',97,100),(36,'2015-12-13',82,7),(37,'2016-06-12',76,69),(38,'2016-06-19',40,75),(39,'2016-09-27',16,14),(40,'2016-04-22',47,40);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[ID_Empleado],[ID_Escuela]) VALUES(41,'2016-06-05',82,13),(42,'2016-07-01',69,46),(43,'2016-04-06',53,35),(44,'2016-07-16',81,18),(45,'2015-11-25',5,38),(46,'2015-11-11',35,59),(47,'2016-01-04',41,31),(48,'2016-07-13',37,90),(49,'2016-09-07',20,96),(50,'2016-04-04',69,49);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[ID_Empleado],[ID_Escuela]) VALUES(51,'2016-06-24',98,53),(52,'2016-08-27',61,14),(53,'2016-07-15',5,55),(54,'2016-05-06',9,92),(55,'2016-08-05',54,27),(56,'2016-05-13',41,57),(57,'2016-06-02',57,44),(58,'2016-01-13',43,16),(59,'2016-02-29',47,77),(60,'2016-02-15',9,24);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[ID_Empleado],[ID_Escuela]) VALUES(61,'2016-06-04',43,41),(62,'2016-02-19',92,82),(63,'2016-05-23',19,21),(64,'2016-01-31',18,44),(65,'2016-09-11',47,22),(66,'2016-10-14',35,14),(67,'2015-11-29',85,39),(68,'2016-08-28',22,71),(69,'2016-09-07',86,17),(70,'2016-05-08',43,24);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[ID_Empleado],[ID_Escuela]) VALUES(71,'2016-09-23',99,73),(72,'2015-11-13',6,53),(73,'2016-07-21',42,73),(74,'2015-12-10',88,5),(75,'2016-02-20',8,36),(76,'2015-11-02',49,94),(77,'2015-12-24',34,23),(78,'2015-12-22',27,42),(79,'2016-05-05',56,21),(80,'2015-12-03',70,66);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[ID_Empleado],[ID_Escuela]) VALUES(81,'2016-01-31',84,17),(82,'2016-04-13',64,76),(83,'2015-11-02',62,88),(84,'2016-10-05',86,53),(85,'2016-08-11',60,39),(86,'2016-09-21',29,78),(87,'2016-08-08',48,24),(88,'2015-12-11',21,32),(89,'2015-12-04',67,21),(90,'2016-03-29',75,33);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[ID_Empleado],[ID_Escuela]) VALUES(91,'2016-04-21',77,37),(92,'2015-11-12',25,72),(93,'2016-09-30',42,16),(94,'2016-08-17',50,78),(95,'2015-11-16',90,28),(96,'2015-11-19',31,51),(97,'2016-10-18',58,97),(98,'2016-05-09',55,21),(99,'2015-12-15',1,29),(100,'2016-03-13',79,81);


INSERT INTO ITEM_VENTA([Numero_Ticket],[ID_Producto],[Cantidad],[Precio]) VALUES(91,67,10,8966),(95,51,7,12954),(81,12,6,2031),(70,60,10,9446),(34,75,2,2116),(38,18,6,2391),(32,15,9,3875),(12,88,2,9861),(21,24,2,4354),(14,72,4,13006);
INSERT INTO ITEM_VENTA([Numero_Ticket],[ID_Producto],[Cantidad],[Precio]) VALUES(64,97,6,14021),(77,60,4,4039),(18,51,8,13184),(31,81,6,11099),(78,13,1,4087),(25,39,6,10461),(13,93,2,4367),(50,92,7,3935),(84,40,3,9286),(83,23,10,4223);
INSERT INTO ITEM_VENTA([Numero_Ticket],[ID_Producto],[Cantidad],[Precio]) VALUES(46,2,3,6899),(50,100,5,5004),(64,82,8,12897),(97,36,9,3459),(95,67,8,13246),(80,40,7,13663),(94,39,3,14245),(41,12,1,11736),(69,77,5,2549),(19,77,8,8305);
INSERT INTO ITEM_VENTA([Numero_Ticket],[ID_Producto],[Cantidad],[Precio]) VALUES(3,30,6,5220),(44,35,3,7272),(64,75,4,6507),(9,19,4,8216),(12,60,7,6604),(28,49,1,9140),(84,42,10,4538),(40,74,1,9078),(59,78,4,5029),(73,24,8,14484);
INSERT INTO ITEM_VENTA([Numero_Ticket],[ID_Producto],[Cantidad],[Precio]) VALUES(56,28,5,5642),(85,98,9,6383),(39,27,8,11612),(90,5,1,13625),(36,32,3,11448),(55,71,10,5875),(45,17,8,4539),(30,17,10,6555),(93,87,7,2386),(75,8,6,3430);
INSERT INTO ITEM_VENTA([Numero_Ticket],[ID_Producto],[Cantidad],[Precio]) VALUES(86,35,7,11530),(83,4,5,10913),(88,87,1,5108),(12,64,4,14357),(45,19,5,14748),(100,99,1,6547),(62,16,10,10213),(46,86,7,2267),(79,49,2,6689),(44,33,8,14630);
INSERT INTO ITEM_VENTA([Numero_Ticket],[ID_Producto],[Cantidad],[Precio]) VALUES(8,20,6,6608),(86,100,3,3421),(86,50,8,2235),(83,80,1,11161),(27,1,10,9026),(55,11,2,13413),(100,68,6,7400),(50,8,1,3044),(3,71,3,6351),(37,62,8,4792);
INSERT INTO ITEM_VENTA([Numero_Ticket],[ID_Producto],[Cantidad],[Precio]) VALUES(88,72,9,9803),(21,29,1,13297),(33,39,2,12473),(13,26,4,9072),(20,87,4,4735),(85,76,4,10788),(38,30,10,12326),(84,91,2,2092),(87,11,2,5303),(88,35,9,9799);
INSERT INTO ITEM_VENTA([Numero_Ticket],[ID_Producto],[Cantidad],[Precio]) VALUES(41,7,2,10141),(88,38,3,8539),(62,71,10,8224),(60,21,6,12017),(66,100,10,2836),(44,43,10,7126),(98,44,2,6653),(75,26,2,6368),(64,40,4,10185),(79,84,5,11849);
INSERT INTO ITEM_VENTA([Numero_Ticket],[ID_Producto],[Cantidad],[Precio]) VALUES(19,54,9,14049),(37,84,1,6257),(22,21,5,5683),(66,91,1,12097),(83,51,8,14110),(56,54,1,7249),(71,75,3,14962),(91,64,3,5012),(68,27,6,12056),(92,23,8,8271);
