USE [DW_Parcial]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/11/2016 17:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[clienteKey] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[nombre] [nchar](10) NOT NULL,
	[apellido] [nchar](10) NOT NULL,
	[NombreCompleto] [nchar](10) NOT NULL,
	[email] [nchar](10) NOT NULL,
	[telefono] [nchar](10) NOT NULL,
	[direccion1] [nchar](10) NOT NULL,
	[tipoDireccion14] [nchar](10) NOT NULL,
	[ciudad] [nchar](10) NOT NULL,
	[provincia] [nchar](10) NOT NULL,
	[direccion2] [nchar](10) NOT NULL,
	[tipoDireccion2] [nchar](10) NOT NULL,
	[ciudad2] [nchar](10) NOT NULL,
	[provincia2] [nchar](10) NOT NULL,
	[estado2] [nchar](10) NOT NULL,
	[region2] [nchar](10) NOT NULL,
	[codigoPostal] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[clienteKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dim_Fecha]    Script Date: 11/11/2016 17:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Fecha](
	[dateKey] [int] NOT NULL,
	[fechaCompleta] [nchar](10) NOT NULL,
	[dia] [nchar](10) NOT NULL,
	[mes] [nchar](10) NOT NULL,
	[año] [nchar](10) NOT NULL,
	[semestre] [nchar](10) NOT NULL,
	[trimestre] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Dim_Fecha] PRIMARY KEY CLUSTERED 
(
	[dateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fact_Envios]    Script Date: 11/11/2016 17:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Envios](
	[numeroOrden] [int] NOT NULL,
	[Producto] [int] NOT NULL,
	[Cliente] [int] NOT NULL,
	[Fecha] [int] NOT NULL,
	[estado] [nchar](10) NULL,
	[precioUnidad] [nchar](10) NULL,
	[cantidad] [nchar](10) NULL,
 CONSTRAINT [PK_Fact_Envios] PRIMARY KEY CLUSTERED 
(
	[numeroOrden] ASC,
	[Producto] ASC,
	[Cliente] ASC,
	[Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 11/11/2016 17:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[productoKey] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[categoria] [varchar](50) NOT NULL,
	[color] [varchar](50) NOT NULL,
	[fechaDescontinuado] [date] NULL,
	[descripcion] [varchar](200) NOT NULL,
	[Activo] [varchar](50) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[productoKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Fact_Envios]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Envios_Cliente] FOREIGN KEY([Cliente])
REFERENCES [dbo].[Cliente] ([clienteKey])
GO
ALTER TABLE [dbo].[Fact_Envios] CHECK CONSTRAINT [FK_Fact_Envios_Cliente]
GO
ALTER TABLE [dbo].[Fact_Envios]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Envios_Dim_Fecha] FOREIGN KEY([Fecha])
REFERENCES [dbo].[Dim_Fecha] ([dateKey])
GO
ALTER TABLE [dbo].[Fact_Envios] CHECK CONSTRAINT [FK_Fact_Envios_Dim_Fecha]
GO
ALTER TABLE [dbo].[Fact_Envios]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Envios_Producto] FOREIGN KEY([Producto])
REFERENCES [dbo].[Producto] ([productoKey])
GO
ALTER TABLE [dbo].[Fact_Envios] CHECK CONSTRAINT [FK_Fact_Envios_Producto]
GO
