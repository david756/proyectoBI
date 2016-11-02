USE [Fuente_Ventas2]
GO
/****** Object:  Table [dbo].[CAT]    Script Date: 31/10/2016 12:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CAT](
	[Cod_Cat] [int] NOT NULL,
	[Descripcion] [varchar](300) NOT NULL,
 CONSTRAINT [PK_CAT] PRIMARY KEY CLUSTERED 
(
	[Cod_Cat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 31/10/2016 12:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[Cod_Empleado] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[Cod_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ESCUELA]    Script Date: 31/10/2016 12:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ESCUELA](
	[Cod_Escuela] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Domicilio] [varchar](300) NOT NULL,
 CONSTRAINT [PK_ESCUELA] PRIMARY KEY CLUSTERED 
(
	[Cod_Escuela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITEM_VENTA]    Script Date: 31/10/2016 12:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM_VENTA](
	[Numero_Ticket] [int] NOT NULL,
	[Cod_Prod] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PROD]    Script Date: 31/10/2016 12:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROD](
	[Cod_Prod] [int] NOT NULL,
	[Cod_Subcat] [int] NOT NULL,
	[Descripcion] [varchar](300) NOT NULL,
	[Precio_Actual] [float] NOT NULL,
 CONSTRAINT [PK_PROD] PRIMARY KEY CLUSTERED 
(
	[Cod_Prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUBCAT]    Script Date: 31/10/2016 12:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUBCAT](
	[Cod_Subcat] [int] NOT NULL,
	[Cod_Cat] [int] NOT NULL,
	[Descripcion] [varchar](300) NOT NULL,
 CONSTRAINT [PK_SUBCAT] PRIMARY KEY CLUSTERED 
(
	[Cod_Subcat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEL_ESCUELA]    Script Date: 31/10/2016 12:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEL_ESCUELA](
	[Cod_Escuela] [int] NOT NULL,
	[Tel_Escuela] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 31/10/2016 12:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[Numero_Ticket] [int] NOT NULL,
	[Fecha_Venta] [date] NOT NULL,
	[Cod_Empleado] [int] NOT NULL,
	[Cod_Escuela] [int] NOT NULL,
 CONSTRAINT [PK_VENTA] PRIMARY KEY CLUSTERED 
(
	[Numero_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ITEM_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_VENTA_PROD] FOREIGN KEY([Cod_Prod])
REFERENCES [dbo].[PROD] ([Cod_Prod])
GO
ALTER TABLE [dbo].[ITEM_VENTA] CHECK CONSTRAINT [FK_ITEM_VENTA_PROD]
GO
ALTER TABLE [dbo].[ITEM_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_VENTA_VENTA] FOREIGN KEY([Numero_Ticket])
REFERENCES [dbo].[VENTA] ([Numero_Ticket])
GO
ALTER TABLE [dbo].[ITEM_VENTA] CHECK CONSTRAINT [FK_ITEM_VENTA_VENTA]
GO
ALTER TABLE [dbo].[PROD]  WITH CHECK ADD  CONSTRAINT [FK_PROD_SUBCAT] FOREIGN KEY([Cod_Subcat])
REFERENCES [dbo].[SUBCAT] ([Cod_Subcat])
GO
ALTER TABLE [dbo].[PROD] CHECK CONSTRAINT [FK_PROD_SUBCAT]
GO
ALTER TABLE [dbo].[SUBCAT]  WITH CHECK ADD  CONSTRAINT [FK_SUBCAT_CAT] FOREIGN KEY([Cod_Cat])
REFERENCES [dbo].[CAT] ([Cod_Cat])
GO
ALTER TABLE [dbo].[SUBCAT] CHECK CONSTRAINT [FK_SUBCAT_CAT]
GO
ALTER TABLE [dbo].[TEL_ESCUELA]  WITH CHECK ADD  CONSTRAINT [FK_TEL_ESCUELA_ESCUELA] FOREIGN KEY([Cod_Escuela])
REFERENCES [dbo].[ESCUELA] ([Cod_Escuela])
GO
ALTER TABLE [dbo].[TEL_ESCUELA] CHECK CONSTRAINT [FK_TEL_ESCUELA_ESCUELA]
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_EMPLEADO] FOREIGN KEY([Cod_Empleado])
REFERENCES [dbo].[EMPLEADO] ([Cod_Empleado])
GO
ALTER TABLE [dbo].[VENTA] CHECK CONSTRAINT [FK_VENTA_EMPLEADO]
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_ESCUELA] FOREIGN KEY([Cod_Escuela])
REFERENCES [dbo].[ESCUELA] ([Cod_Escuela])
GO
ALTER TABLE [dbo].[VENTA] CHECK CONSTRAINT [FK_VENTA_ESCUELA]
GO


INSERT INTO EMPLEADO([Cod_empleado],[nombre],[apellido]) VALUES(1,'Aimee Nolan','Goodman'),(2,'Joshua Hyatt','Glass'),(3,'Athena Nehru','Price'),(4,'Grant Kay','Morales'),(5,'Yeo Blaine','Turner'),(6,'Astra Kato','Randall'),(7,'Miriam Elmo','Craft'),(8,'Jasmine Savannah','Foley'),(9,'Kasimir Dieter','Leach'),(10,'Velma Zenia','Best');
INSERT INTO EMPLEADO([Cod_empleado],[nombre],[apellido]) VALUES(11,'Vivian Candace','Acevedo'),(12,'Caldwell Lara','Humphrey'),(13,'Knox Holly','Mendoza'),(14,'May Quincy','Lyons'),(15,'Driscoll Quintessa','Vance'),(16,'Tobias Joy','Whitney'),(17,'Ali Callie','Spence'),(18,'Maggie Ivy','Weiss'),(19,'Dustin Damon','Fuller'),(20,'Selma Emery','Blake');
INSERT INTO EMPLEADO([Cod_empleado],[nombre],[apellido]) VALUES(21,'Murphy Wesley','Campos'),(22,'Brandon Thor','Bolton'),(23,'Hu Norman','Webb'),(24,'Olga Wallace','Pollard'),(25,'Lenore Lance','Williams'),(26,'Justin Kyle','Singleton'),(27,'Carol Yeo','Allison'),(28,'George Dorothy','Lyons'),(29,'Castor Micah','Giles'),(30,'Gary Cleo','Ross');
INSERT INTO EMPLEADO([Cod_empleado],[nombre],[apellido]) VALUES(31,'Maia Lev','Charles'),(32,'Ava Walker','Richmond'),(33,'Samuel Stephen','Humphrey'),(34,'Kennedy Levi','Mejia'),(35,'Price Oscar','Dominguez'),(36,'Leonard Hayley','Whitaker'),(37,'Marny McKenzie','Farrell'),(38,'Christian Kadeem','Richardson'),(39,'Nicole Velma','Sullivan'),(40,'Lee Marsden','Padilla');
INSERT INTO EMPLEADO([Cod_empleado],[nombre],[apellido]) VALUES(41,'Amber Thaddeus','Shaffer'),(42,'Liberty Mason','Gibson'),(43,'Kato Francis','Mcintosh'),(44,'Wade Iris','Alvarado'),(45,'Basil Brody','Larsen'),(46,'Reed Tana','Perry'),(47,'Zeus Camille','Wynn'),(48,'Libby Mechelle','Spencer'),(49,'Judah Ifeoma','Velazquez'),(50,'Jasmine Emmanuel','Heath');
INSERT INTO EMPLEADO([Cod_empleado],[nombre],[apellido]) VALUES(51,'Cedric Edward','Parsons'),(52,'Alan Kyra','Johnson'),(53,'Berk Frances','Garrison'),(54,'Hayfa Buffy','Mcclure'),(55,'Sydnee Connor','Morales'),(56,'Willow Florence','Mullins'),(57,'Hamish Christine','Willis'),(58,'Xena Zephr','Dotson'),(59,'Ferdinand Micah','Dean'),(60,'Alexis Mara','Moreno');
INSERT INTO EMPLEADO([Cod_empleado],[nombre],[apellido]) VALUES(61,'Tate Madeson','Meyer'),(62,'Lester Calvin','Morales'),(63,'Freya Kieran','Levine'),(64,'Montana Fritz','Browning'),(65,'Quynn Kimberley','Norman'),(66,'Danielle Gregory','Swanson'),(67,'Oscar Ila','Finch'),(68,'Amethyst Daquan','Finch'),(69,'Kevin Colton','Vinson'),(70,'Keelie Libby','Burris');
INSERT INTO EMPLEADO([Cod_empleado],[nombre],[apellido]) VALUES(71,'Vanna Harriet','Mcleod'),(72,'Echo Geraldine','Lindsey'),(73,'Aurelia Teegan','Duffy'),(74,'Rhea Lewis','Vega'),(75,'Venus Stephanie','Reynolds'),(76,'Demetria Kristen','Mcguire'),(77,'Wanda Lynn','Washington'),(78,'Vanna Alice','Kelly'),(79,'Brett Genevieve','Sweet'),(80,'Moana Ahmed','Farrell');
INSERT INTO EMPLEADO([Cod_empleado],[nombre],[apellido]) VALUES(81,'Odessa Anne','Branch'),(82,'Raphael Ulric','Ferrell'),(83,'Brittany Jaquelyn','Oneil'),(84,'Griffin Tanya','Best'),(85,'Jameson Faith','Sellers'),(86,'Sydney Leigh','Webster'),(87,'Carol Maile','Thornton'),(88,'Deacon Aurelia','Bowman'),(89,'Sophia Stuart','Mendez'),(90,'Rhoda Kellie','Shepherd');
INSERT INTO EMPLEADO([Cod_empleado],[nombre],[apellido]) VALUES(91,'Althea Tanner','Macias'),(92,'Fritz Fredericka','David'),(93,'Olivia Brent','Morse'),(94,'Charity Risa','Steele'),(95,'Katelyn Audrey','Dillard'),(96,'Geoffrey Marvin','Foster'),(97,'Nina Matthew','Rodriquez'),(98,'Leila Timothy','Sutton'),(99,'Arthur Gisela','Williamson'),(100,'Hilda Patrick','Hopper');


INSERT INTO CAT([Cod_Cat],[Descripcion]) VALUES(1,'Cat 1'),(2,'Cat 2'),(3,'Cat 3'),(4,'Cat 4'),(5,'Cat 5'),(6,'Cat 6'),(7,'Cat 7'),(8,'Cat 8'),(9,'Cat 9'),(10,'Cat 10');


INSERT INTO SUBCAT([Cod_Subcat],[Cod_Cat],[Descripcion]) VALUES(1,6,'SUB_CAT 1'),(2,2,'SUB_CAT 2'),(3,10,'SUB_CAT 3'),(4,1,'SUB_CAT 4'),(5,1,'SUB_CAT 5'),(6,6,'SUB_CAT 6'),(7,2,'SUB_CAT 7'),(8,2,'SUB_CAT 8'),(9,5,'SUB_CAT 9'),(10,5,'SUB_CAT 10');


INSERT INTO PROD([Cod_Prod],[Cod_Subcat],[Descripcion],[Precio_Actual]) VALUES(1,7,'amet',7441),(2,2,'eget',2191),(3,9,'sit',3846),(4,6,'sit',6306),(5,5,'tincidunt',5679),(6,8,'lacinia.',11899),(7,10,'blandit.',5195),(8,7,'malesuada',13201),(9,4,'ante',11836),(10,7,'fames',5766);
INSERT INTO PROD([Cod_Prod],[Cod_Subcat],[Descripcion],[Precio_Actual]) VALUES(11,5,'at',8170),(12,9,'Quisque',8328),(13,6,'elit',7422),(14,2,'eget',10621),(15,2,'dolor',6804),(16,5,'Nunc',11708),(17,9,'dictum',14467),(18,7,'morbi',11421),(19,4,'eu,',3041),(20,2,'eu',6452);
INSERT INTO PROD([Cod_Prod],[Cod_Subcat],[Descripcion],[Precio_Actual]) VALUES(21,4,'commodo',8130),(22,7,'lorem,',14075),(23,4,'ut',2456),(24,7,'nonummy',14559),(25,6,'parturient',12590),(26,5,'ultrices.',7147),(27,5,'ac',14513),(28,1,'Aliquam',14160),(29,8,'sed',10194),(30,10,'scelerisque',3242);
INSERT INTO PROD([Cod_Prod],[Cod_Subcat],[Descripcion],[Precio_Actual]) VALUES(31,3,'dui,',9373),(32,5,'id,',13762),(33,2,'tellus.',14357),(34,3,'egestas',9844),(35,5,'orci',2284),(36,4,'luctus',9542),(37,10,'euismod',11998),(38,8,'turpis.',11646),(39,3,'nisl.',9244),(40,6,'Nulla',2085);
INSERT INTO PROD([Cod_Prod],[Cod_Subcat],[Descripcion],[Precio_Actual]) VALUES(41,2,'eleifend,',14995),(42,4,'consequat',11276),(43,2,'nascetur',7870),(44,1,'ipsum',11539),(45,7,'pede.',12578),(46,3,'sit',14413),(47,5,'sociis',3872),(48,8,'tellus',12765),(49,9,'Phasellus',9112),(50,10,'mollis.',4582);
INSERT INTO PROD([Cod_Prod],[Cod_Subcat],[Descripcion],[Precio_Actual]) VALUES(51,10,'imperdiet',8091),(52,5,'pede',12868),(53,7,'enim',5172),(54,2,'tortor',5674),(55,6,'dolor',4568),(56,2,'et',11810),(57,2,'convallis',10715),(58,1,'dolor',8830),(59,3,'dui,',13054),(60,10,'auctor',11868);
INSERT INTO PROD([Cod_Prod],[Cod_Subcat],[Descripcion],[Precio_Actual]) VALUES(61,3,'tincidunt',7489),(62,9,'sapien',13329),(63,8,'ornare',3158),(64,5,'tellus,',5263),(65,5,'hendrerit',12280),(66,1,'molestie',11515),(67,10,'Aenean',2806),(68,9,'vel,',7323),(69,3,'ultrices',7928),(70,7,'sociis',7760);
INSERT INTO PROD([Cod_Prod],[Cod_Subcat],[Descripcion],[Precio_Actual]) VALUES(71,7,'elit',11996),(72,5,'erat.',12812),(73,9,'Praesent',9386),(74,7,'mauris',2796),(75,8,'in',4649),(76,9,'viverra.',3822),(77,6,'molestie',8984),(78,9,'Integer',2493),(79,4,'Vestibulum',8516),(80,9,'cursus',7071);
INSERT INTO PROD([Cod_Prod],[Cod_Subcat],[Descripcion],[Precio_Actual]) VALUES(81,6,'Proin',12721),(82,8,'risus.',2715),(83,2,'vitae',7202),(84,6,'sed',12681),(85,3,'rutrum',8050),(86,9,'Suspendisse',7459),(87,7,'ac',8523),(88,3,'erat,',6953),(89,3,'est,',4219),(90,7,'nunc',11545);
INSERT INTO PROD([Cod_Prod],[Cod_Subcat],[Descripcion],[Precio_Actual]) VALUES(91,8,'nisi',11358),(92,2,'ipsum',5637),(93,9,'odio',4301),(94,6,'felis',7540),(95,7,'cubilia',14897),(96,1,'justo',13450),(97,8,'Sed',2903),(98,2,'ultrices.',13190),(99,2,'sit',13712),(100,4,'vulputate',9594);


INSERT INTO ESCUELA([Cod_Escuela],[Nombre],[Domicilio]) VALUES(1,'Aliquam Nisl Nulla Company','9468 Lorem Ctra.'),(2,'Eros Non Company','6916 Porttitor Calle'),(3,'Sodales At Velit Incorporated','Apdo.:128-5935 Nulla C/'),(4,'Euismod Ac Industries','753 At '),(5,'Tincidunt Corporation','2582 Lorem, '),(6,'Tristique Senectus Et PC','491-8338 Blandit. Avda.'),(7,'Natoque Foundation','420-5957 Mauris C.'),(8,'Volutpat Nulla Ltd','Apdo.:679-3662 Blandit Avda.'),(9,'Malesuada Ut Ltd','8676 Quisque Avenida'),(10,'Elit Elit Corp.','416-5416 Risus Av.');
INSERT INTO ESCUELA([Cod_Escuela],[Nombre],[Domicilio]) VALUES(11,'Eleifend Egestas Corp.','Apartado núm.: 984, 1950 Consequat Carretera'),(12,'Faucibus Incorporated','583-954 Erat Carretera'),(13,'Cursus Et Ltd','7036 Vel, Avda.'),(14,'Proin Dolor Nulla LLP','Apartado núm.: 174, 1143 Posuere, Av.'),(15,'Ornare LLC','298-1910 Natoque C.'),(16,'Accumsan Interdum Limited','2066 Eget, Avenida'),(17,'Dapibus Quam Quis Foundation','406-8466 A, Av.'),(18,'Tincidunt LLC','Apdo.:931-8409 Cras Carretera'),(19,'Metus Aenean Limited','4401 Sed C.'),(20,'Tincidunt Dui Augue Associates','Apdo.:208-2526 Eu ');
INSERT INTO ESCUELA([Cod_Escuela],[Nombre],[Domicilio]) VALUES(21,'Donec Consulting','Apartado núm.: 852, 8924 Laoreet '),(22,'Bibendum Donec Limited','Apartado núm.: 888, 5540 Ligula. Av.'),(23,'Nisi Magna Sed Company','Apartado núm.: 308, 7937 Natoque C.'),(24,'Non Limited','332-1185 Facilisi. C.'),(25,'Eu Incorporated','746-836 Senectus C/'),(26,'Nisi Cum Sociis Corp.','Apartado núm.: 316, 2584 Fermentum Av.'),(27,'Lacus Varius Et Incorporated','Apartado núm.: 767, 6432 Amet Calle'),(28,'Quam Vel PC','Apartado núm.: 766, 2794 Dolor. Av.'),(29,'In Inc.','619-8315 Elit. C.'),(30,'Metus Vivamus Corporation','7323 Nec Avda.');
INSERT INTO ESCUELA([Cod_Escuela],[Nombre],[Domicilio]) VALUES(31,'Nascetur PC','934-7180 Penatibus C.'),(32,'Tellus Id Institute','9485 Proin C/'),(33,'Semper Industries','772-2898 Id Avenida'),(34,'Gravida Sit Amet LLC','Apartado núm.: 554, 2173 Magna C.'),(35,'In At Pede Associates','2098 Ut Carretera'),(36,'Convallis Dolor Quisque Institute','371-9063 Sed Calle'),(37,'Aliquam Eros Turpis Industries','733-3274 Vivamus C.'),(38,'Egestas Blandit Nam Industries','6992 Felis Avda.'),(39,'Parturient Corporation','Apartado núm.: 988, 5130 Placerat Carretera'),(40,'Felis Industries','Apdo.:829-3699 Mauris Ctra.');
INSERT INTO ESCUELA([Cod_Escuela],[Nombre],[Domicilio]) VALUES(41,'Magna Corporation','Apdo.:427-218 Odio. Ctra.'),(42,'Nunc In Institute','Apdo.:922-1202 Etiam C.'),(43,'Ultricies Company','Apdo.:880-4572 Curabitur Carretera'),(44,'Mattis Industries','Apartado núm.: 411, 3181 Ipsum Carretera'),(45,'Nisi LLC','Apdo.:940-9390 Elit. C/'),(46,'Diam Associates','Apartado núm.: 210, 1806 Sem. C.'),(47,'Pretium Aliquet Metus LLC','Apdo.:944-2967 Pharetra '),(48,'Aliquam Institute','Apdo.:722-9975 Semper Carretera'),(49,'Amet PC','Apdo.:612-8948 Sit '),(50,'Eu Nibh LLP','584-4614 Laoreet, C.');
INSERT INTO ESCUELA([Cod_Escuela],[Nombre],[Domicilio]) VALUES(51,'Ac Feugiat Incorporated','4575 Eget Calle'),(52,'Quam Pellentesque LLP','Apartado núm.: 891, 5629 Mattis. Avda.'),(53,'Curae; Corp.','922-1260 Orci. Avda.'),(54,'Quisque Porttitor Inc.','Apdo.:363-2925 Nullam Ctra.'),(55,'Magna A Neque LLP','7833 Fusce Avda.'),(56,'Ultricies Dignissim Incorporated','Apartado núm.: 153, 5595 Cursus, Avenida'),(57,'Ligula Nullam Foundation','Apdo.:353-9371 Integer C/'),(58,'Erat Ltd','Apdo.:737-8248 Suspendisse C/'),(59,'Non Sapien Molestie Incorporated','954-7234 Lorem '),(60,'Mattis Ornare Corporation','Apartado núm.: 115, 3072 Eu Avda.');
INSERT INTO ESCUELA([Cod_Escuela],[Nombre],[Domicilio]) VALUES(61,'Orci Quis Corporation','9792 Sed C.'),(62,'Diam Lorem Auctor Corporation','359-4265 Aenean Carretera'),(63,'Ultricies Ligula Nullam Ltd','Apdo.:576-2158 Dictum Avenida'),(64,'Et Arcu Imperdiet Company','Apdo.:310-5995 Lorem C.'),(65,'Eu Company','798-2628 Et Carretera'),(66,'Ultricies Ltd','876 Nulla Avda.'),(67,'Lectus Pede Incorporated','Apartado núm.: 289, 8499 Euismod Carretera'),(68,'Lectus Incorporated','4821 Gravida C.'),(69,'Molestie Limited','9029 Eget C.'),(70,'Sed Congue Elit Foundation','546-2372 Eget Carretera');
INSERT INTO ESCUELA([Cod_Escuela],[Nombre],[Domicilio]) VALUES(71,'Dui Associates','Apdo.:968-3344 Sem '),(72,'Quam LLC','900-4812 Erat. '),(73,'Quisque Ac Libero Inc.','8110 Ac Avda.'),(74,'Nibh Consulting','2930 Et Avda.'),(75,'Mauris Corp.','740-8402 Nulla. Calle'),(76,'Blandit Nam Nulla Foundation','Apdo.:635-6371 Sit Avenida'),(77,'Augue Ac Ipsum Industries','556-1552 Est Avenida'),(78,'Lacinia Vitae Sodales Company','Apdo.:796-6257 Nibh Avenida'),(79,'Augue Company','815-1158 Nulla C/'),(80,'Natoque Penatibus Et Foundation','804-2528 Ut Calle');
INSERT INTO ESCUELA([Cod_Escuela],[Nombre],[Domicilio]) VALUES(81,'Lacus Varius Company','Apdo.:174-7836 Rutrum Ctra.'),(82,'Nulla Corp.','Apartado núm.: 557, 2933 Quis, Avenida'),(83,'Sagittis Felis Institute','3752 Auctor C.'),(84,'Lacinia Vitae Sodales Foundation','3071 Magna Ctra.'),(85,'Mi Enim Company','Apdo.:229-6170 Neque. C/'),(86,'Luctus Limited','302-8129 Molestie '),(87,'Consectetuer Rhoncus Nullam Associates','Apdo.:108-9381 Molestie Avda.'),(88,'Euismod Foundation','167-3710 Urna. Avenida'),(89,'Fusce Mi Lorem LLP','295-3235 Leo Calle'),(90,'Nibh Associates','Apartado núm.: 527, 3640 Neque. Calle');
INSERT INTO ESCUELA([Cod_Escuela],[Nombre],[Domicilio]) VALUES(91,'Congue In Corp.','569-3055 Ac Calle'),(92,'Enim Etiam Industries','Apartado núm.: 235, 5304 Quis Avenida'),(93,'Erat Semper Rutrum Foundation','163-8827 Adipiscing C.'),(94,'Enim LLP','Apartado núm.: 761, 5082 Cum Avda.'),(95,'Cubilia Curae; Phasellus Inc.','3795 Vestibulum Avenida'),(96,'Orci Sem Eget Associates','Apdo.:151-3805 Vulputate, Av.'),(97,'Integer Mollis PC','Apdo.:404-8806 Sed C/'),(98,'Ullamcorper Magna Corp.','Apdo.:556-1467 Lectus Avda.'),(99,'Montes Industries','648 Justo. Av.'),(100,'Lobortis Ltd','4084 Aliquet, Avenida');


INSERT INTO TEL_ESCUELA([Cod_escuela],[Tel_Escuela]) VALUES(1,'6352389'),(2,'6544343'),(3,'2582297'),(4,'7967155'),(5,'2674818'),(6,'3216642'),(7,'9544098'),(8,'4267208'),(9,'2073891'),(10,'3821119');
INSERT INTO TEL_ESCUELA([Cod_escuela],[Tel_Escuela]) VALUES(11,'3418112'),(12,'8567183'),(13,'3343041'),(14,'1797332'),(15,'9733104'),(16,'3584948'),(17,'0197494'),(18,'0705221'),(19,'7749448'),(20,'8736979');
INSERT INTO TEL_ESCUELA([Cod_escuela],[Tel_Escuela]) VALUES(21,'1642598'),(22,'7572205'),(23,'2991365'),(24,'6721146'),(25,'2077360'),(26,'5931561'),(27,'3765965'),(28,'7790048'),(29,'2999605'),(30,'6355507');
INSERT INTO TEL_ESCUELA([Cod_escuela],[Tel_Escuela]) VALUES(31,'0181425'),(32,'7085538'),(33,'6742922'),(34,'6659973'),(35,'2046617'),(36,'8372082'),(37,'9260040'),(38,'4040049'),(39,'5712758'),(40,'5846200');
INSERT INTO TEL_ESCUELA([Cod_escuela],[Tel_Escuela]) VALUES(41,'7679607'),(42,'9119185'),(43,'6237095'),(44,'4432609'),(45,'8768168'),(46,'5149147'),(47,'2844747'),(48,'8171159'),(49,'8676469'),(50,'1124593');
INSERT INTO TEL_ESCUELA([Cod_escuela],[Tel_Escuela]) VALUES(51,'7770264'),(52,'8788560'),(53,'4841635'),(54,'7096238'),(55,'7356316'),(56,'3025946'),(57,'5225582'),(58,'0356835'),(59,'6153653'),(60,'2032570');
INSERT INTO TEL_ESCUELA([Cod_escuela],[Tel_Escuela]) VALUES(61,'1706757'),(62,'3104572'),(63,'5281741'),(64,'6317485'),(65,'1353981'),(66,'8201638'),(67,'4835519'),(68,'5841447'),(69,'4976568'),(70,'6112949');
INSERT INTO TEL_ESCUELA([Cod_escuela],[Tel_Escuela]) VALUES(71,'7350150'),(72,'7248533'),(73,'6561334'),(74,'4296561'),(75,'8337023'),(76,'7127030'),(77,'0985331'),(78,'5377492'),(79,'4045137'),(80,'5617562');
INSERT INTO TEL_ESCUELA([Cod_escuela],[Tel_Escuela]) VALUES(81,'3938518'),(82,'0019504'),(83,'0323312'),(84,'0848416'),(85,'5550500'),(86,'0975218'),(87,'6754299'),(88,'0557543'),(89,'9370606'),(90,'6211807');
INSERT INTO TEL_ESCUELA([Cod_escuela],[Tel_Escuela]) VALUES(91,'3203915'),(92,'6531081'),(93,'6891807'),(94,'1033441'),(95,'7651863'),(96,'9545900'),(97,'9221354'),(98,'9888066'),(99,'0803039'),(100,'2365572');


INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(1,'2016-05-12',26,79),(2,'2015-11-21',47,50),(3,'2016-09-23',35,91),(4,'2016-08-08',29,95),(5,'2015-12-13',26,99),(6,'2016-01-01',77,85),(7,'2016-03-21',89,47),(8,'2016-08-29',86,34),(9,'2015-11-14',82,48),(10,'2015-12-19',39,82);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(11,'2016-10-09',79,48),(12,'2016-10-01',42,12),(13,'2016-10-04',43,28),(14,'2016-04-30',15,55),(15,'2016-04-18',29,13),(16,'2016-09-16',80,12),(17,'2015-12-23',6,6),(18,'2016-05-03',19,64),(19,'2016-02-23',36,89),(20,'2016-03-10',73,95);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(21,'2016-08-17',16,40),(22,'2016-06-28',21,79),(23,'2016-03-21',45,64),(24,'2016-07-25',49,93),(25,'2015-12-10',86,64),(26,'2016-09-07',25,41),(27,'2016-06-28',97,30),(28,'2016-06-19',69,74),(29,'2016-03-14',46,88),(30,'2016-09-15',16,56);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(31,'2015-12-30',28,36),(32,'2016-05-16',96,71),(33,'2016-06-18',48,9),(34,'2016-08-29',43,30),(35,'2016-06-25',26,91),(36,'2016-06-15',76,16),(37,'2016-06-26',66,87),(38,'2016-08-06',88,60),(39,'2016-05-11',77,18),(40,'2015-11-04',16,97);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(41,'2016-08-29',34,20),(42,'2015-12-21',97,83),(43,'2016-09-14',64,4),(44,'2015-11-09',61,28),(45,'2016-10-18',58,28),(46,'2016-05-27',22,52),(47,'2016-05-04',64,62),(48,'2016-01-15',41,66),(49,'2016-05-24',33,40),(50,'2016-01-23',79,17);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(51,'2016-03-05',66,93),(52,'2016-08-21',24,56),(53,'2016-07-14',54,89),(54,'2015-12-16',53,94),(55,'2016-06-12',50,51),(56,'2016-05-31',12,57),(57,'2016-03-01',11,97),(58,'2015-12-11',33,75),(59,'2016-10-13',89,51),(60,'2016-07-26',77,100);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(61,'2016-10-21',7,77),(62,'2016-06-02',89,11),(63,'2016-01-02',22,21),(64,'2016-05-05',24,52),(65,'2016-10-07',58,19),(66,'2016-01-30',32,86),(67,'2016-09-11',10,46),(68,'2016-05-27',6,50),(69,'2016-03-31',66,5),(70,'2016-02-16',68,45);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(71,'2015-12-05',27,14),(72,'2016-01-21',29,38),(73,'2016-09-22',96,35),(74,'2015-12-23',81,22),(75,'2016-01-05',58,49),(76,'2015-11-19',50,18),(77,'2016-07-31',72,3),(78,'2016-05-17',79,69),(79,'2016-04-27',32,9),(80,'2016-01-19',48,36);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(81,'2016-04-08',83,19),(82,'2015-12-06',98,84),(83,'2016-06-03',22,44),(84,'2016-05-08',3,11),(85,'2016-03-20',47,26),(86,'2016-08-25',72,25),(87,'2015-11-20',95,53),(88,'2016-08-12',6,96),(89,'2016-06-23',72,8),(90,'2016-03-17',57,21);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(91,'2016-01-20',39,98),(92,'2016-04-20',28,42),(93,'2016-04-28',48,99),(94,'2016-02-26',37,75),(95,'2016-02-07',83,55),(96,'2016-04-14',7,54),(97,'2015-11-19',31,4),(98,'2016-03-23',19,88),(99,'2015-12-13',79,59),(100,'2015-11-21',10,20);

INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(101,'2016-07-18',43,29),(102,'2016-04-07',83,63),(103,'2016-07-09',82,79),(104,'2016-10-05',55,28),(105,'2016-01-01',35,63),(106,'2016-07-06',55,91),(107,'2015-12-01',79,47),(108,'2015-12-27',32,9),(109,'2016-07-31',79,61),(110,'2016-08-16',29,12);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(111,'2016-04-29',87,3),(112,'2016-06-01',51,31),(113,'2016-10-16',39,53),(114,'2016-09-09',43,11),(115,'2016-08-14',64,44),(116,'2016-07-18',87,23),(117,'2016-04-10',9,61),(118,'2016-09-29',63,87),(119,'2016-01-06',57,95),(120,'2016-01-20',76,40);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(121,'2016-04-30',68,8),(122,'2016-05-14',72,69),(123,'2016-03-13',96,82),(124,'2016-05-05',63,49),(125,'2016-06-24',41,57),(126,'2016-02-20',26,69),(127,'2016-08-03',5,22),(128,'2016-05-05',7,23),(129,'2016-07-09',28,34),(130,'2016-01-04',65,72);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(131,'2016-08-05',84,49),(132,'2016-09-23',2,28),(133,'2016-09-14',81,12),(134,'2016-01-22',10,38),(135,'2016-05-16',25,93),(136,'2016-03-17',15,56),(137,'2015-12-19',55,53),(138,'2016-07-06',3,61),(139,'2016-09-15',96,48),(140,'2016-10-05',90,51);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(141,'2015-12-08',97,88),(142,'2016-02-14',22,97),(143,'2016-04-17',54,73),(144,'2015-12-15',62,29),(145,'2016-04-14',38,80),(146,'2016-04-11',40,46),(147,'2016-09-14',74,84),(148,'2016-05-02',68,5),(149,'2016-07-21',46,90),(150,'2016-05-10',18,88);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(151,'2016-06-19',23,21),(152,'2016-03-28',92,19),(153,'2015-12-12',46,90),(154,'2016-02-28',4,81),(155,'2016-05-14',20,54),(156,'2016-05-07',16,69),(157,'2016-04-23',34,37),(158,'2016-03-19',34,72),(159,'2016-06-22',93,83),(160,'2016-05-12',81,58);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(161,'2016-02-21',28,8),(162,'2015-11-10',5,10),(163,'2016-03-18',29,1),(164,'2016-02-24',80,24),(165,'2015-12-31',63,97),(166,'2016-07-17',99,17),(167,'2016-04-19',69,38),(168,'2016-05-07',2,15),(169,'2016-05-10',96,15),(170,'2016-07-01',71,53);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(171,'2016-02-18',70,80),(172,'2016-10-16',58,58),(173,'2015-11-29',69,8),(174,'2016-07-29',34,70),(175,'2016-03-05',83,90),(176,'2016-07-13',49,53),(177,'2016-01-28',23,87),(178,'2015-12-02',82,86),(179,'2015-11-18',48,51),(180,'2016-03-26',46,70);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(181,'2016-10-26',9,69),(182,'2016-02-18',11,42),(183,'2016-06-18',93,40),(184,'2016-04-15',97,90),(185,'2016-03-21',55,10),(186,'2016-02-29',39,26),(187,'2016-09-13',49,74),(188,'2016-02-03',31,42),(189,'2016-07-15',12,58),(190,'2016-07-16',88,30);
INSERT INTO VENTA([Numero_Ticket],[Fecha_Venta],[Cod_Empleado],[Cod_Escuela]) VALUES(191,'2016-10-12',20,23),(192,'2016-07-12',34,83),(193,'2016-10-02',74,47),(194,'2015-12-21',55,50),(195,'2016-08-14',31,35),(196,'2016-04-08',38,28),(197,'2016-10-17',18,29),(198,'2016-05-09',9,57),(199,'2016-09-05',87,21),(200,'2016-01-17',39,93);



INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(147,36,10,4567),(137,74,1,9412),(48,18,10,12460),(165,6,10,4409),(115,28,5,14380),(89,91,4,5963),(76,72,1,7767),(150,59,6,12432),(65,1,9,11663),(80,57,3,5126);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(99,99,13,3279),(28,77,5,5809),(50,52,13,2291),(42,45,9,3441),(160,76,11,14647),(141,86,3,8902),(172,77,6,4859),(118,57,3,13236),(128,43,15,11773),(58,18,9,14524);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(73,82,8,13485),(54,65,5,14074),(34,59,1,5241),(83,93,10,10169),(9,63,15,4372),(40,66,15,14657),(190,39,8,11537),(198,9,2,10552),(197,27,7,6352),(117,98,9,11868);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(82,24,6,8266),(139,55,6,14642),(106,18,14,5558),(151,96,7,4643),(21,93,10,10415),(122,6,4,9129),(107,95,3,7044),(101,17,10,10032),(155,29,9,5874),(43,34,10,13335);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(71,24,6,8311),(129,10,3,11435),(183,14,4,10006),(160,43,6,6854),(182,21,5,8276),(23,4,5,3944),(92,5,3,5971),(54,85,14,12032),(195,17,13,11074),(2,4,1,6026);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(105,18,10,7671),(99,75,13,13577),(114,17,3,5572),(141,51,11,6159),(189,44,2,3356),(75,15,11,12062),(182,27,13,12019),(14,51,11,5541),(60,41,7,7192),(191,100,3,4146);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(59,66,12,2915),(11,29,5,6601),(18,9,1,9031),(21,73,2,4289),(144,62,14,2114),(175,20,11,6478),(180,78,10,11700),(135,36,8,6064),(123,94,4,3841),(163,93,13,13283);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(96,23,12,6956),(48,94,2,10694),(129,34,4,5801),(145,85,4,6270),(156,54,11,3639),(148,77,7,8314),(83,63,2,11506),(128,38,4,5716),(115,18,2,14548),(190,56,3,11142);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(45,5,10,13751),(115,99,1,2730),(31,64,10,8992),(54,73,15,11555),(108,28,11,5716),(194,5,5,6421),(131,70,9,7534),(200,13,2,14711),(173,70,7,5811),(168,83,15,2852);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(24,71,7,2069),(36,80,4,6964),(168,49,14,2688),(177,10,14,9167),(53,55,2,4278),(53,39,5,14968),(118,16,5,4225),(59,6,6,3047),(118,52,7,14980),(96,12,11,8017);

INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(4,56,9,9462),(100,72,7,11509),(18,84,12,3131),(82,27,13,6422),(16,10,12,10248),(125,70,12,4725),(41,31,14,12624),(108,3,5,3977),(144,69,10,2427),(87,19,9,5886);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(200,90,7,10340),(1,59,12,3733),(75,60,8,6571),(32,19,14,14301),(179,20,4,12227),(48,93,14,2254),(60,7,14,11739),(109,46,7,6278),(142,15,5,9798),(178,57,9,9572);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(88,50,12,5063),(93,15,10,3528),(26,46,13,9821),(90,57,8,5858),(131,52,10,7881),(102,51,13,5894),(56,58,11,11273),(178,72,10,3392),(92,16,15,9143),(149,36,5,12747);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(90,43,3,13482),(85,42,14,11643),(70,31,6,3605),(69,8,12,8433),(131,100,5,2483),(2,35,3,4614),(69,37,13,9878),(159,7,6,3604),(35,44,12,4362),(50,92,14,6303);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(117,2,7,2534),(141,19,2,3436),(177,72,10,7745),(16,37,8,7546),(87,61,10,4248),(174,1,4,4344),(198,67,1,10593),(178,41,13,3122),(75,41,4,12100),(100,19,1,4534);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(42,94,4,3685),(158,4,1,10033),(157,68,12,11145),(77,50,8,5609),(127,84,4,4865),(114,24,5,13742),(9,6,15,7493),(11,93,14,12544),(122,78,8,10003),(76,92,8,13895);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(51,77,14,4453),(47,19,14,13577),(12,73,15,3067),(179,63,6,9457),(94,79,3,2137),(79,59,7,9513),(174,77,15,9222),(190,40,4,9521),(42,41,13,13778),(85,78,8,11683);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(106,86,4,11405),(5,3,8,11006),(43,89,13,13258),(92,45,5,12534),(9,54,4,10935),(126,55,5,10930),(2,22,10,5070),(189,28,15,13359),(109,44,11,8021),(11,89,12,6264);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(114,63,14,8409),(77,92,3,12774),(58,51,3,3619),(142,51,4,7638),(177,99,1,13814),(89,10,10,12820),(3,62,3,12159),(154,35,2,2869),(40,13,14,8069),(55,48,8,5148);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(50,70,15,10331),(155,5,12,9050),(84,32,8,11925),(194,71,8,2707),(174,73,5,2121),(90,11,5,5213),(184,46,5,8457),(68,64,9,6733),(161,91,11,7716),(198,41,7,8070);

INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(96,21,8,5043),(172,36,7,7697),(135,32,14,7553),(193,47,6,13392),(180,63,8,9705),(129,59,12,10460),(183,93,5,4465),(35,5,3,12943),(41,6,15,8278),(12,11,7,6592);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(70,100,5,7592),(193,86,1,3237),(94,5,12,10347),(170,18,2,5895),(162,72,4,9290),(177,10,6,3252),(22,13,1,5892),(83,25,4,8642),(84,12,10,14727),(16,7,8,9525);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(109,35,12,14104),(198,52,11,4285),(93,74,2,2269),(68,54,11,2427),(11,17,7,3548),(172,77,12,5109),(132,89,9,6829),(6,19,11,9696),(27,54,7,10361),(104,37,10,12610);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(19,64,5,2434),(178,75,6,4160),(196,73,1,4166),(85,92,14,3496),(15,58,2,14332),(11,15,7,10519),(164,35,15,4462),(76,79,4,8873),(175,65,7,7760),(129,28,3,2910);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(10,50,15,9099),(185,33,3,10079),(9,29,1,12706),(165,32,5,6725),(51,73,11,8575),(177,93,8,14242),(171,68,2,2577),(105,53,3,9607),(70,39,6,9199),(200,83,10,3248);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(143,29,7,4675),(83,74,12,4453),(65,70,7,13060),(155,75,10,9568),(194,55,4,7776),(118,6,13,14352),(169,44,5,5392),(75,82,7,10003),(123,49,5,11260),(173,78,4,5146);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(140,78,10,6936),(7,25,14,6680),(138,75,6,4968),(126,52,15,3348),(157,49,11,12792),(104,94,11,13679),(5,75,6,10560),(197,73,6,2526),(66,91,14,4090),(80,1,8,12745);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(150,23,12,4104),(189,16,5,2213),(186,1,4,6249),(67,56,5,5810),(193,29,1,9759),(5,9,14,4871),(163,56,11,7335),(151,69,4,5907),(199,2,4,5981),(49,89,11,9325);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(151,35,1,4893),(84,99,8,6053),(187,29,2,7363),(127,35,9,6954),(104,65,8,11584),(199,65,7,12944),(66,64,5,7475),(140,95,1,11385),(53,50,10,2960),(186,66,3,14918);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(89,100,11,6959),(5,99,8,10244),(165,18,8,4177),(33,52,6,4603),(172,11,12,5438),(25,90,2,7232),(93,67,6,5883),(30,29,15,8477),(155,75,11,7399),(186,50,5,2339);

INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(180,58,7,7569),(164,23,15,4007),(179,41,1,3108),(18,9,10,13243),(178,21,8,12233),(41,39,8,4574),(11,77,11,10913),(116,49,4,8318),(34,41,1,7637),(125,98,7,10149);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(154,39,11,8380),(67,92,14,10668),(131,51,6,14555),(193,99,11,11658),(100,36,8,14255),(95,74,7,7501),(50,53,4,13496),(51,68,3,3539),(24,70,11,7493),(196,62,1,2078);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(199,92,3,6826),(134,51,15,14377),(38,47,3,3296),(168,9,3,5912),(49,54,15,11506),(139,96,6,2139),(131,14,11,2588),(55,17,11,2362),(133,90,12,11374),(6,14,9,6005);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(81,74,1,13042),(51,20,1,8135),(175,94,13,8986),(84,22,3,5364),(26,46,2,5493),(19,2,1,13129),(104,13,1,9976),(196,5,9,9511),(122,70,5,14328),(120,13,4,6390);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(143,62,11,13678),(125,37,4,11937),(70,3,9,4476),(90,77,3,12600),(63,100,15,3313),(67,18,7,11928),(112,55,2,2301),(148,49,7,8092),(77,93,11,9061),(1,9,3,13288);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(92,44,15,13998),(167,57,5,9644),(49,61,8,12987),(148,8,15,10955),(158,64,3,2484),(17,55,10,4233),(7,85,14,9113),(31,36,6,9796),(66,37,6,13164),(143,24,7,7272);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(24,22,15,6493),(174,12,3,2131),(40,52,9,3458),(132,53,13,9907),(161,40,4,7734),(183,44,11,8762),(102,14,11,9006),(66,28,7,3604),(106,48,7,8563),(146,56,14,3329);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(105,79,7,8140),(24,41,1,14424),(110,11,9,11171),(197,82,5,7537),(47,77,4,6989),(173,92,10,10485),(148,16,4,4202),(193,78,3,3456),(116,61,7,9345),(109,40,12,5794);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(27,23,3,8840),(66,83,12,9702),(87,82,11,12887),(194,36,13,4583),(130,89,8,4938),(104,5,4,3054),(23,75,6,5625),(21,49,10,10627),(57,48,4,3984),(133,22,13,4493);
INSERT INTO ITEM_VENTA([Numero_Ticket],[Cod_Prod],[Cantidad],[Precio]) VALUES(132,37,15,7499),(6,94,6,13796),(143,19,10,11765),(185,19,5,2581),(149,4,8,13017),(149,6,9,14415),(84,44,13,11207),(164,69,2,7970),(176,2,4,12590),(79,79,10,14602);
