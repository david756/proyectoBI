USE [Parque]
GO
/****** Object:  Table [dbo].[Dim_Cliente]    Script Date: 22/10/2016 1:39:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Cliente](
	[clienteKey] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[nombreCompletoCliente] [varchar](50) NOT NULL,
	[fechaNacimientoCliente] [date] NOT NULL,
	[generoCliente] [varchar](50) NOT NULL,
	[paisCliente] [varchar](50) NOT NULL,
	[provinciaCliente] [varchar](50) NOT NULL,
	[ciudadCliente] [varchar](50) NOT NULL,
	[fk_escuela] [int] NULL,
	[vigenciaCliente] [date] NOT NULL,
 CONSTRAINT [PK_Dim_Cliente] PRIMARY KEY CLUSTERED 
(
	[clienteKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Empleado]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Empleado](
	[empleadoKey] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[nombreCompletoEmpleado] [varchar](50) NOT NULL,
	[generoEmpleado] [varchar](50) NOT NULL,
	[sueldo] [float] NOT NULL,
	[horasCapacitacion] [int] NOT NULL,
	[fechaIngreso] [date] NOT NULL,
	[paisEmpleado] [varchar](50) NOT NULL,
	[provinciaEmpleado] [varchar](50) NOT NULL,
	[ciudadEmpleado] [varchar](50) NOT NULL,
	[vigenciaEmpleado] [varchar](50) NOT NULL,
	[fk_local] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Empleado] PRIMARY KEY CLUSTERED 
(
	[empleadoKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Escuela]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Escuela](
	[escuelaKey] [int] NOT NULL,
	[idEscuela] [int] NOT NULL,
	[nombreEscuela] [varchar](50) NOT NULL,
	[tipoEscuela] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_Escuela] PRIMARY KEY CLUSTERED 
(
	[escuelaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Local]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Local](
	[localKey] [int] NOT NULL,
	[idLocal] [int] NOT NULL,
	[nombreLocal] [varchar](50) NOT NULL,
	[distanciaBoleteria] [int] NOT NULL,
	[tamanoLocal] [int] NOT NULL,
	[vigenciaLocal] [date] NOT NULL,
 CONSTRAINT [PK_Dim_Local] PRIMARY KEY CLUSTERED 
(
	[localKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Parque]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Parque](
	[parqueKey] [int] NOT NULL,
	[idParque] [int] NOT NULL,
	[nombreParque] [varchar](50) NOT NULL,
	[fk_region] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Parque] PRIMARY KEY CLUSTERED 
(
	[parqueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Producto]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Producto](
	[productoKey] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[nombreProducto] [varchar](50) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[costoActual] [float] NOT NULL,
	[subcategoria] [varchar](50) NOT NULL,
	[categoria] [varchar](50) NOT NULL,
	[vigenciaProducto] [date] NOT NULL,
 CONSTRAINT [PK_Dim_Producto] PRIMARY KEY CLUSTERED 
(
	[productoKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Region]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Region](
	[regionKey] [int] NOT NULL,
	[idRegion] [int] NOT NULL,
	[nombreRegion] [varchar](50) NOT NULL,
	[zonaGeografica] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_Region] PRIMARY KEY CLUSTERED 
(
	[regionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Tiempo]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Tiempo](
	[tiempoKey] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[anio] [int] NOT NULL,
	[mes] [varchar](50) NOT NULL,
	[semana] [int] NOT NULL,
	[diaSemana] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_Tiempo] PRIMARY KEY CLUSTERED 
(
	[tiempoKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fac_Stock_Disponible]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fac_Stock_Disponible](
	[id] [nchar](10) NOT NULL,
	[fk_productoKey] [int] NOT NULL,
	[fk_tiempoKey] [int] NOT NULL,
	[fk_localKey] [int] NOT NULL,
	[unidadesDisponibles] [int] NOT NULL,
	[ventasHoy] [int] NOT NULL,
 CONSTRAINT [PK_Fac_Stock_Disponible] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fac_Venta_Entrada_Cliente]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fac_Venta_Entrada_Cliente](
	[id] [nchar](10) NOT NULL,
	[fk_tiempoKey] [int] NOT NULL,
	[fk_parqueKey] [int] NOT NULL,
	[fk_regionKey] [int] NOT NULL,
	[fk_clienteKey] [int] NOT NULL,
	[fk_localKey] [int] NOT NULL,
	[fk_empleadoKey] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[valorUnidad] [float] NOT NULL,
	[valorTotal] [float] NOT NULL,
 CONSTRAINT [PK_Fac_Venta_Entrada_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fac_Venta_Entrada_Escuela]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fac_Venta_Entrada_Escuela](
	[id] [nchar](10) NOT NULL,
	[fk_tiempoKey] [int] NOT NULL,
	[fk_parqueKey] [int] NOT NULL,
	[fk_regionKey] [int] NOT NULL,
	[fk_escuelaKey] [int] NOT NULL,
	[fk_localKey] [int] NOT NULL,
	[fk_empleadoKey] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[valorUnidad] [float] NOT NULL,
	[valorTotal] [float] NOT NULL,
 CONSTRAINT [PK_Fac_Venta_Entrada_Escuela] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fac_Venta_Producto_Cliente]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fac_Venta_Producto_Cliente](
	[id] [nchar](10) NOT NULL,
	[fk_tiempoKey] [int] NOT NULL,
	[fk_regionKey] [int] NOT NULL,
	[fk_localKey] [int] NOT NULL,
	[fk_clienteKey] [int] NOT NULL,
	[fk_empleadoKey] [int] NOT NULL,
	[fk_productoKey] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[valorUnidad] [float] NOT NULL,
	[valorTotal] [float] NOT NULL,
 CONSTRAINT [PK_Fac_Venta_Producto_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fac_Venta_Producto_Escuela]    Script Date: 22/10/2016 1:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fac_Venta_Producto_Escuela](
	[id] [nchar](10) NOT NULL,
	[fk_tiempoKey] [int] NOT NULL,
	[fk_regionKey] [int] NOT NULL,
	[fk_localKey] [int] NOT NULL,
	[fk_escuelaKey] [int] NOT NULL,
	[fk_empleadoKey] [int] NOT NULL,
	[fk_productoKey] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[valorUnidad] [float] NOT NULL,
	[valorTotal] [float] NOT NULL,
 CONSTRAINT [PK_Fac_Venta_Producto_Escuela] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Fac_Stock_Disponible]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Stock_Disponible_Dim_Local] FOREIGN KEY([fk_localKey])
REFERENCES [dbo].[Dim_Local] ([localKey])
GO
ALTER TABLE [dbo].[Fac_Stock_Disponible] CHECK CONSTRAINT [FK_Fac_Stock_Disponible_Dim_Local]
GO
ALTER TABLE [dbo].[Fac_Stock_Disponible]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Stock_Disponible_Dim_Producto] FOREIGN KEY([fk_productoKey])
REFERENCES [dbo].[Dim_Producto] ([productoKey])
GO
ALTER TABLE [dbo].[Fac_Stock_Disponible] CHECK CONSTRAINT [FK_Fac_Stock_Disponible_Dim_Producto]
GO
ALTER TABLE [dbo].[Fac_Stock_Disponible]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Stock_Disponible_Dim_Tiempo] FOREIGN KEY([fk_tiempoKey])
REFERENCES [dbo].[Dim_Tiempo] ([tiempoKey])
GO
ALTER TABLE [dbo].[Fac_Stock_Disponible] CHECK CONSTRAINT [FK_Fac_Stock_Disponible_Dim_Tiempo]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Cliente] FOREIGN KEY([fk_clienteKey])
REFERENCES [dbo].[Dim_Cliente] ([clienteKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Cliente]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Empleado] FOREIGN KEY([fk_empleadoKey])
REFERENCES [dbo].[Dim_Empleado] ([empleadoKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Empleado]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Local] FOREIGN KEY([fk_localKey])
REFERENCES [dbo].[Dim_Local] ([localKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Local]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Parque] FOREIGN KEY([fk_parqueKey])
REFERENCES [dbo].[Dim_Parque] ([parqueKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Parque]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Region] FOREIGN KEY([fk_regionKey])
REFERENCES [dbo].[Dim_Region] ([regionKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Region]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Tiempo] FOREIGN KEY([fk_tiempoKey])
REFERENCES [dbo].[Dim_Tiempo] ([tiempoKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Cliente_Dim_Tiempo]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Empleado] FOREIGN KEY([fk_empleadoKey])
REFERENCES [dbo].[Dim_Empleado] ([empleadoKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Empleado]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Escuela] FOREIGN KEY([fk_escuelaKey])
REFERENCES [dbo].[Dim_Escuela] ([escuelaKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Escuela]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Local] FOREIGN KEY([fk_localKey])
REFERENCES [dbo].[Dim_Local] ([localKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Local]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Parque] FOREIGN KEY([fk_parqueKey])
REFERENCES [dbo].[Dim_Parque] ([parqueKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Parque]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Region] FOREIGN KEY([fk_regionKey])
REFERENCES [dbo].[Dim_Region] ([regionKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Region]
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Tiempo] FOREIGN KEY([fk_tiempoKey])
REFERENCES [dbo].[Dim_Tiempo] ([tiempoKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Entrada_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Entrada_Escuela_Dim_Tiempo]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Cliente] FOREIGN KEY([fk_clienteKey])
REFERENCES [dbo].[Dim_Cliente] ([clienteKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Cliente]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Empleado] FOREIGN KEY([fk_empleadoKey])
REFERENCES [dbo].[Dim_Empleado] ([empleadoKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Empleado]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Local] FOREIGN KEY([fk_localKey])
REFERENCES [dbo].[Dim_Local] ([localKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Local]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Producto] FOREIGN KEY([fk_productoKey])
REFERENCES [dbo].[Dim_Producto] ([productoKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Producto]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Region] FOREIGN KEY([fk_regionKey])
REFERENCES [dbo].[Dim_Region] ([regionKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Region]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Tiempo] FOREIGN KEY([fk_tiempoKey])
REFERENCES [dbo].[Dim_Tiempo] ([tiempoKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Cliente] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Cliente_Dim_Tiempo]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Empleado] FOREIGN KEY([fk_empleadoKey])
REFERENCES [dbo].[Dim_Empleado] ([empleadoKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Empleado]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Escuela] FOREIGN KEY([fk_escuelaKey])
REFERENCES [dbo].[Dim_Escuela] ([escuelaKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Escuela]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Local] FOREIGN KEY([fk_localKey])
REFERENCES [dbo].[Dim_Local] ([localKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Local]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Producto] FOREIGN KEY([fk_productoKey])
REFERENCES [dbo].[Dim_Producto] ([productoKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Producto]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Region] FOREIGN KEY([fk_regionKey])
REFERENCES [dbo].[Dim_Region] ([regionKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Region]
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Tiempo] FOREIGN KEY([fk_tiempoKey])
REFERENCES [dbo].[Dim_Tiempo] ([tiempoKey])
GO
ALTER TABLE [dbo].[Fac_Venta_Producto_Escuela] CHECK CONSTRAINT [FK_Fac_Venta_Producto_Escuela_Dim_Tiempo]
GO
