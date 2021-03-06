USE [Fuente_Parcial]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [Categoria_PK] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[idCiudad] [int] NOT NULL,
	[Provincia_idProvincia] [int] NOT NULL,
	[codigopostal] [int] NULL,
 CONSTRAINT [Ciudad_PK] PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](100) NULL,
	[email] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[fechaInactivo] [date] NULL,
 CONSTRAINT [Cliente_PK] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Color]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[idColor] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [Color_PK] PRIMARY KEY CLUSTERED 
(
	[idColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Despachos]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Despachos](
	[nro] [int] NOT NULL,
	[fecha_despacho] [date] NULL,
	[feche_Entrega] [date] NULL,
	[fecha_recogida] [date] NULL,
	[valorEnvio] [bigint] NULL,
	[FacturaVenta_numeroOrden] [int] NOT NULL,
	[Direccion_idDirección] [int] NOT NULL,
	[valorseguro] [bigint] NULL,
	[Transportadoras_codigo] [int] NOT NULL,
 CONSTRAINT [Despachos_PK] PRIMARY KEY CLUSTERED 
(
	[nro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[numeroOrden] [int] NOT NULL,
	[idProducto1] [int] NOT NULL,
	[cantidad] [int] NULL,
	[precioUnitario] [float] NULL,
 CONSTRAINT [DetalleVenta_PK] PRIMARY KEY CLUSTERED 
(
	[numeroOrden] ASC,
	[idProducto1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion](
	[idDirección] [int] NOT NULL,
	[Dirección] [varchar](50) NULL,
	[idCiudad] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[idTipo] [int] NOT NULL,
 CONSTRAINT [Direccion_PK] PRIMARY KEY CLUSTERED 
(
	[idDirección] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoVenta]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoVenta](
	[idEstado] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [EstadoVenta_PK] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FacturaVenta]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaVenta](
	[numeroOrden] [int] NOT NULL,
	[fecha] [date] NULL,
	[idCliente] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
 CONSTRAINT [FacturaVenta_PK] PRIMARY KEY CLUSTERED 
(
	[numeroOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistorialProducto]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistorialProducto](
	[idHistorial] [int] NOT NULL,
	[fechaAcción] [date] NULL,
	[tipoAccion] [varchar](50) NULL,
	[idProducto] [int] NOT NULL,
 CONSTRAINT [HistorialProducto_PK] PRIMARY KEY CLUSTERED 
(
	[idHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] NOT NULL,
	[nombreProducto] [varchar](50) NULL,
	[descripción] [varchar](200) NULL,
	[Categoria_idCategoria] [int] NOT NULL,
	[Color_idColor] [int] NOT NULL,
	[precioVenta] [float] NULL,
	[precioCompra] [float] NULL,
 CONSTRAINT [Producto_PK] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[idProvincia] [int] NOT NULL,
	[nombreProvincia] [varchar](50) NULL,
	[Region_idRegion] [int] NOT NULL,
 CONSTRAINT [Provincia_PK] PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Region]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Region](
	[idRegion] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [Region_PK] PRIMARY KEY CLUSTERED 
(
	[idRegion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoDireccion]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoDireccion](
	[idTipo] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [TipoDireccion_PK] PRIMARY KEY CLUSTERED 
(
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transportadoras]    Script Date: 11/11/2016 11:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transportadoras](
	[codigo] [int] NOT NULL,
	[nombre] [varchar](40) NULL,
 CONSTRAINT [Transportadoras_PK] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Ciudad]  WITH CHECK ADD  CONSTRAINT [Ciudad_Provincia_FK] FOREIGN KEY([Provincia_idProvincia])
REFERENCES [dbo].[Provincia] ([idProvincia])
GO
ALTER TABLE [dbo].[Ciudad] CHECK CONSTRAINT [Ciudad_Provincia_FK]
GO
ALTER TABLE [dbo].[Despachos]  WITH CHECK ADD  CONSTRAINT [Despachos_Direccion_FK] FOREIGN KEY([Direccion_idDirección])
REFERENCES [dbo].[Direccion] ([idDirección])
GO
ALTER TABLE [dbo].[Despachos] CHECK CONSTRAINT [Despachos_Direccion_FK]
GO
ALTER TABLE [dbo].[Despachos]  WITH CHECK ADD  CONSTRAINT [Despachos_FacturaVenta_FK] FOREIGN KEY([FacturaVenta_numeroOrden])
REFERENCES [dbo].[FacturaVenta] ([numeroOrden])
GO
ALTER TABLE [dbo].[Despachos] CHECK CONSTRAINT [Despachos_FacturaVenta_FK]
GO
ALTER TABLE [dbo].[Despachos]  WITH CHECK ADD  CONSTRAINT [Despachos_Transportadoras_FK] FOREIGN KEY([Transportadoras_codigo])
REFERENCES [dbo].[Transportadoras] ([codigo])
GO
ALTER TABLE [dbo].[Despachos] CHECK CONSTRAINT [Despachos_Transportadoras_FK]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [DetalleVenta_FacturaVenta_FK] FOREIGN KEY([numeroOrden])
REFERENCES [dbo].[FacturaVenta] ([numeroOrden])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [DetalleVenta_FacturaVenta_FK]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [DetalleVenta_Producto_FK] FOREIGN KEY([idProducto1])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [DetalleVenta_Producto_FK]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [Direccion_Ciudad_FK] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudad] ([idCiudad])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [Direccion_Ciudad_FK]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [Direccion_Cliente_FK] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [Direccion_Cliente_FK]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [Direccion_TipoDireccion_FK] FOREIGN KEY([idTipo])
REFERENCES [dbo].[TipoDireccion] ([idTipo])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [Direccion_TipoDireccion_FK]
GO
ALTER TABLE [dbo].[FacturaVenta]  WITH CHECK ADD  CONSTRAINT [FacturaVenta_Cliente_FK] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[FacturaVenta] CHECK CONSTRAINT [FacturaVenta_Cliente_FK]
GO
ALTER TABLE [dbo].[FacturaVenta]  WITH CHECK ADD  CONSTRAINT [FacturaVenta_EstadoVenta_FK] FOREIGN KEY([idEstado])
REFERENCES [dbo].[EstadoVenta] ([idEstado])
GO
ALTER TABLE [dbo].[FacturaVenta] CHECK CONSTRAINT [FacturaVenta_EstadoVenta_FK]
GO
ALTER TABLE [dbo].[HistorialProducto]  WITH CHECK ADD  CONSTRAINT [HistorialProducto_Producto_FK] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[HistorialProducto] CHECK CONSTRAINT [HistorialProducto_Producto_FK]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [Producto_Categoria_FK] FOREIGN KEY([Categoria_idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [Producto_Categoria_FK]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [Producto_Color_FK] FOREIGN KEY([Color_idColor])
REFERENCES [dbo].[Color] ([idColor])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [Producto_Color_FK]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [Provincia_Region_FK] FOREIGN KEY([Region_idRegion])
REFERENCES [dbo].[Region] ([idRegion])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [Provincia_Region_FK]
GO
