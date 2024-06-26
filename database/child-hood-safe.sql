USE [master]
GO
/****** Object:  Database [TestChildHood]    Script Date: 7/06/2024 23:05:17 ******/
CREATE DATABASE [TestChildHood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestChildHood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestChildHood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestChildHood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestChildHood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TestChildHood] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestChildHood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestChildHood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestChildHood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestChildHood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestChildHood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestChildHood] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestChildHood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestChildHood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestChildHood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestChildHood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestChildHood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestChildHood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestChildHood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestChildHood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestChildHood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestChildHood] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestChildHood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestChildHood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestChildHood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestChildHood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestChildHood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestChildHood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestChildHood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestChildHood] SET RECOVERY FULL 
GO
ALTER DATABASE [TestChildHood] SET  MULTI_USER 
GO
ALTER DATABASE [TestChildHood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestChildHood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestChildHood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestChildHood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestChildHood] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestChildHood] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestChildHood', N'ON'
GO
ALTER DATABASE [TestChildHood] SET QUERY_STORE = ON
GO
ALTER DATABASE [TestChildHood] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TestChildHood]
GO
/****** Object:  Table [dbo].[Aproximacion_Edad]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aproximacion_Edad](
	[Aproximacion_EdadID] [int] IDENTITY(1,1) NOT NULL,
	[edad_menor] [tinyint] NOT NULL,
	[edad_mayor] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Aproximacion_EdadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria_Posts]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria_Posts](
	[PostsID] [int] NOT NULL,
	[CategoriaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PostsID] ASC,
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[ComentarioID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[PostsID] [int] NOT NULL,
	[Comentario_Respuesta] [int] NULL,
	[comentario] [text] NOT NULL,
	[fecha_publicado] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ComentarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comisaria]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comisaria](
	[ComisariaID] [int] IDENTITY(1,1) NOT NULL,
	[Division_PolicialID] [int] NOT NULL,
	[UbigeoID] [char](6) NOT NULL,
	[comisaria] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ComisariaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comunidad]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comunidad](
	[ComunidadID] [int] IDENTITY(1,1) NOT NULL,
	[CreadorID] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[descripcion] [text] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ComunidadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Correo_Electronico]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Correo_Electronico](
	[Correo_ElectronicoID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[correo_electronico] [nvarchar](320) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Correo_ElectronicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Denuncia_Anonima]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Denuncia_Anonima](
	[Denuncia_AnonimaID] [int] IDENTITY(1,1) NOT NULL,
	[DificultadID] [int] NOT NULL,
	[UbigeoID] [char](6) NOT NULL,
	[Descripcion_MenorID] [int] NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[descripcion_caso] [text] NULL,
	[fecha_registro_denuncia] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Denuncia_AnonimaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Denuncia_Aprobada]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Denuncia_Aprobada](
	[Denuncia_AprobadaID] [int] NOT NULL,
	[descripcion] [text] NOT NULL,
	[fecha_registro_aprobacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Denuncia_AprobadaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Denuncia_En_Proceso]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Denuncia_En_Proceso](
	[Denuncia_En_ProcesoID] [int] NOT NULL,
	[FiscaliaID] [int] NOT NULL,
	[ComisariaID] [int] NOT NULL,
	[fecha_registro_en_proceso] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Denuncia_En_ProcesoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descripcion_Menor]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descripcion_Menor](
	[Descripcion_MenorID] [int] IDENTITY(1,1) NOT NULL,
	[SexoID] [int] NOT NULL,
	[Aproximacion_EdadID] [int] NOT NULL,
	[Tonalidad_PielID] [int] NOT NULL,
	[PrendasID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Descripcion_MenorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descripcion_Menor_Estado_Fisica]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descripcion_Menor_Estado_Fisica](
	[Estado_FisicoID] [int] NOT NULL,
	[Descripcion_MenorID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Estado_FisicoID] ASC,
	[Descripcion_MenorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descripcion_Menor_Trabajo_Ilegal]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descripcion_Menor_Trabajo_Ilegal](
	[Trabajo_IlegalID] [int] NOT NULL,
	[Descripcion_MenorID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Trabajo_IlegalID] ASC,
	[Descripcion_MenorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultad]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultad](
	[DificultadID] [int] IDENTITY(1,1) NOT NULL,
	[niveles_dificultad] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DificultadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Division_Policial]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Division_Policial](
	[DivisionPolicialID] [int] IDENTITY(1,1) NOT NULL,
	[division_policial] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DivisionPolicialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Fisico]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Fisico](
	[Estado_FisicoID] [int] IDENTITY(1,1) NOT NULL,
	[estado_fisico] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Estado_FisicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Prendas]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Prendas](
	[Estado_PrendasID] [int] IDENTITY(1,1) NOT NULL,
	[estado_prendas] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Estado_PrendasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiqueta](
	[EtiquetaID] [int] IDENTITY(1,1) NOT NULL,
	[etiquetas] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EtiquetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiquetas_Posts]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiquetas_Posts](
	[PostsID] [int] NOT NULL,
	[EtiquetaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PostsID] ASC,
	[EtiquetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fiscalia]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fiscalia](
	[FiscaliaID] [int] IDENTITY(1,1) NOT NULL,
	[UbigeoID] [char](6) NOT NULL,
	[fiscalia] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FiscaliaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostsID] [int] IDENTITY(1,1) NOT NULL,
	[ComunidadID] [int] NOT NULL,
	[Denuncia_AprobadaID] [int] NULL,
	[UsuarioID] [int] NOT NULL,
	[titulo] [nvarchar](100) NOT NULL,
	[contenido] [text] NOT NULL,
	[fecha_publicacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PostsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prendas]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prendas](
	[PrendasID] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_ropa] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PrendasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prendas_Estado_Prendas]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prendas_Estado_Prendas](
	[PrendasID] [int] NOT NULL,
	[Estado_PrendasID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PrendasID] ASC,
	[Estado_PrendasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[SexoID] [int] IDENTITY(1,1) NOT NULL,
	[sexo] [nvarchar](9) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SexoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[TelefonoID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[numero_telefonico] [char](9) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TelefonoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tonalidad_Piel]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tonalidad_Piel](
	[Tonalidad_PielID] [int] IDENTITY(1,1) NOT NULL,
	[tonalidad_piel] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Tonalidad_PielID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajo_Ilegal]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajo_Ilegal](
	[Trabajo_IlegalID] [int] IDENTITY(1,1) NOT NULL,
	[trabajo_ilegal] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Trabajo_IlegalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubigeo]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubigeo](
	[UbigeoID] [char](6) NOT NULL,
	[departamento] [nvarchar](15) NOT NULL,
	[provincia] [nvarchar](30) NOT NULL,
	[distrito] [nvarchar](35) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UbigeoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](30) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[contraseña] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Comunidad]    Script Date: 7/06/2024 23:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Comunidad](
	[UsuarioID] [int] NOT NULL,
	[ComunidadID] [int] NOT NULL,
	[fecha_ingreso] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC,
	[ComunidadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categoria_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_TO_Categoria_Posts] FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[Categoria] ([CategoriaID])
GO
ALTER TABLE [dbo].[Categoria_Posts] CHECK CONSTRAINT [FK_Categoria_TO_Categoria_Posts]
GO
ALTER TABLE [dbo].[Categoria_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_TO_Categoria_Posts] FOREIGN KEY([PostsID])
REFERENCES [dbo].[Posts] ([PostsID])
GO
ALTER TABLE [dbo].[Categoria_Posts] CHECK CONSTRAINT [FK_Posts_TO_Categoria_Posts]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_TO_Comentario] FOREIGN KEY([Comentario_Respuesta])
REFERENCES [dbo].[Comentario] ([ComentarioID])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_TO_Comentario]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Posts_TO_Comentario] FOREIGN KEY([PostsID])
REFERENCES [dbo].[Posts] ([PostsID])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Posts_TO_Comentario]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TO_Comentario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Usuario_TO_Comentario]
GO
ALTER TABLE [dbo].[Comisaria]  WITH CHECK ADD  CONSTRAINT [FK_Division_Policial_TO_Comisaria] FOREIGN KEY([Division_PolicialID])
REFERENCES [dbo].[Division_Policial] ([DivisionPolicialID])
GO
ALTER TABLE [dbo].[Comisaria] CHECK CONSTRAINT [FK_Division_Policial_TO_Comisaria]
GO
ALTER TABLE [dbo].[Comisaria]  WITH CHECK ADD  CONSTRAINT [FK_Ubigeo_TO_Comisaria] FOREIGN KEY([UbigeoID])
REFERENCES [dbo].[Ubigeo] ([UbigeoID])
GO
ALTER TABLE [dbo].[Comisaria] CHECK CONSTRAINT [FK_Ubigeo_TO_Comisaria]
GO
ALTER TABLE [dbo].[Comunidad]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TO_Comunidad] FOREIGN KEY([CreadorID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Comunidad] CHECK CONSTRAINT [FK_Usuario_TO_Comunidad]
GO
ALTER TABLE [dbo].[Correo_Electronico]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TO_Correo_Electronico] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Correo_Electronico] CHECK CONSTRAINT [FK_Usuario_TO_Correo_Electronico]
GO
ALTER TABLE [dbo].[Denuncia_Anonima]  WITH CHECK ADD  CONSTRAINT [FK_Descripcion_Menor_TO_Denuncia_Anonima] FOREIGN KEY([Descripcion_MenorID])
REFERENCES [dbo].[Descripcion_Menor] ([Descripcion_MenorID])
GO
ALTER TABLE [dbo].[Denuncia_Anonima] CHECK CONSTRAINT [FK_Descripcion_Menor_TO_Denuncia_Anonima]
GO
ALTER TABLE [dbo].[Denuncia_Anonima]  WITH CHECK ADD  CONSTRAINT [FK_Dificultad_TO_Denuncia_Anonima] FOREIGN KEY([DificultadID])
REFERENCES [dbo].[Dificultad] ([DificultadID])
GO
ALTER TABLE [dbo].[Denuncia_Anonima] CHECK CONSTRAINT [FK_Dificultad_TO_Denuncia_Anonima]
GO
ALTER TABLE [dbo].[Denuncia_Anonima]  WITH CHECK ADD  CONSTRAINT [FK_Ubigeo_TO_Denuncia_Anonima] FOREIGN KEY([UbigeoID])
REFERENCES [dbo].[Ubigeo] ([UbigeoID])
GO
ALTER TABLE [dbo].[Denuncia_Anonima] CHECK CONSTRAINT [FK_Ubigeo_TO_Denuncia_Anonima]
GO
ALTER TABLE [dbo].[Denuncia_Anonima]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TO_Denuncia_Anonima] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Denuncia_Anonima] CHECK CONSTRAINT [FK_Usuario_TO_Denuncia_Anonima]
GO
ALTER TABLE [dbo].[Denuncia_Aprobada]  WITH CHECK ADD  CONSTRAINT [FK_Denuncia_En_Proceso_TO_Denuncia_Aprobada] FOREIGN KEY([Denuncia_AprobadaID])
REFERENCES [dbo].[Denuncia_En_Proceso] ([Denuncia_En_ProcesoID])
GO
ALTER TABLE [dbo].[Denuncia_Aprobada] CHECK CONSTRAINT [FK_Denuncia_En_Proceso_TO_Denuncia_Aprobada]
GO
ALTER TABLE [dbo].[Denuncia_En_Proceso]  WITH CHECK ADD  CONSTRAINT [FK_Comisaria_TO_Denuncia_En_Proceso] FOREIGN KEY([ComisariaID])
REFERENCES [dbo].[Comisaria] ([ComisariaID])
GO
ALTER TABLE [dbo].[Denuncia_En_Proceso] CHECK CONSTRAINT [FK_Comisaria_TO_Denuncia_En_Proceso]
GO
ALTER TABLE [dbo].[Denuncia_En_Proceso]  WITH CHECK ADD  CONSTRAINT [FK_Denuncia_Anonima_TO_Denuncia_En_Proceso] FOREIGN KEY([Denuncia_En_ProcesoID])
REFERENCES [dbo].[Denuncia_Anonima] ([Denuncia_AnonimaID])
GO
ALTER TABLE [dbo].[Denuncia_En_Proceso] CHECK CONSTRAINT [FK_Denuncia_Anonima_TO_Denuncia_En_Proceso]
GO
ALTER TABLE [dbo].[Denuncia_En_Proceso]  WITH CHECK ADD  CONSTRAINT [FK_Fiscalia_TO_Denuncia_En_Proceso] FOREIGN KEY([FiscaliaID])
REFERENCES [dbo].[Fiscalia] ([FiscaliaID])
GO
ALTER TABLE [dbo].[Denuncia_En_Proceso] CHECK CONSTRAINT [FK_Fiscalia_TO_Denuncia_En_Proceso]
GO
ALTER TABLE [dbo].[Descripcion_Menor]  WITH CHECK ADD  CONSTRAINT [FK_Aproximacion_Edad_TO_Descripcion_Menor] FOREIGN KEY([Aproximacion_EdadID])
REFERENCES [dbo].[Aproximacion_Edad] ([Aproximacion_EdadID])
GO
ALTER TABLE [dbo].[Descripcion_Menor] CHECK CONSTRAINT [FK_Aproximacion_Edad_TO_Descripcion_Menor]
GO
ALTER TABLE [dbo].[Descripcion_Menor]  WITH CHECK ADD  CONSTRAINT [FK_Prendas_TO_Descripcion_Menor] FOREIGN KEY([PrendasID])
REFERENCES [dbo].[Prendas] ([PrendasID])
GO
ALTER TABLE [dbo].[Descripcion_Menor] CHECK CONSTRAINT [FK_Prendas_TO_Descripcion_Menor]
GO
ALTER TABLE [dbo].[Descripcion_Menor]  WITH CHECK ADD  CONSTRAINT [FK_Sexo_TO_Descripcion_Menor] FOREIGN KEY([SexoID])
REFERENCES [dbo].[Sexo] ([SexoID])
GO
ALTER TABLE [dbo].[Descripcion_Menor] CHECK CONSTRAINT [FK_Sexo_TO_Descripcion_Menor]
GO
ALTER TABLE [dbo].[Descripcion_Menor]  WITH CHECK ADD  CONSTRAINT [FK_Tonalidad_Piel_TO_Descripcion_Menor] FOREIGN KEY([Tonalidad_PielID])
REFERENCES [dbo].[Tonalidad_Piel] ([Tonalidad_PielID])
GO
ALTER TABLE [dbo].[Descripcion_Menor] CHECK CONSTRAINT [FK_Tonalidad_Piel_TO_Descripcion_Menor]
GO
ALTER TABLE [dbo].[Descripcion_Menor_Estado_Fisica]  WITH CHECK ADD  CONSTRAINT [FK_Descripcion_Menor_TO_Descripcion_Menor_Estado_Fisica] FOREIGN KEY([Descripcion_MenorID])
REFERENCES [dbo].[Descripcion_Menor] ([Descripcion_MenorID])
GO
ALTER TABLE [dbo].[Descripcion_Menor_Estado_Fisica] CHECK CONSTRAINT [FK_Descripcion_Menor_TO_Descripcion_Menor_Estado_Fisica]
GO
ALTER TABLE [dbo].[Descripcion_Menor_Estado_Fisica]  WITH CHECK ADD  CONSTRAINT [FK_Estado_Fisico_TO_Descripcion_Menor_Estado_Fisica] FOREIGN KEY([Estado_FisicoID])
REFERENCES [dbo].[Estado_Fisico] ([Estado_FisicoID])
GO
ALTER TABLE [dbo].[Descripcion_Menor_Estado_Fisica] CHECK CONSTRAINT [FK_Estado_Fisico_TO_Descripcion_Menor_Estado_Fisica]
GO
ALTER TABLE [dbo].[Descripcion_Menor_Trabajo_Ilegal]  WITH CHECK ADD  CONSTRAINT [FK_Descripcion_Menor_TO_Descripcion_Menor_Trabajo_Ilegal] FOREIGN KEY([Descripcion_MenorID])
REFERENCES [dbo].[Descripcion_Menor] ([Descripcion_MenorID])
GO
ALTER TABLE [dbo].[Descripcion_Menor_Trabajo_Ilegal] CHECK CONSTRAINT [FK_Descripcion_Menor_TO_Descripcion_Menor_Trabajo_Ilegal]
GO
ALTER TABLE [dbo].[Descripcion_Menor_Trabajo_Ilegal]  WITH CHECK ADD  CONSTRAINT [FK_Trabajo_Ilegal_TO_Descripcion_Menor_Trabajo_Ilegal] FOREIGN KEY([Trabajo_IlegalID])
REFERENCES [dbo].[Trabajo_Ilegal] ([Trabajo_IlegalID])
GO
ALTER TABLE [dbo].[Descripcion_Menor_Trabajo_Ilegal] CHECK CONSTRAINT [FK_Trabajo_Ilegal_TO_Descripcion_Menor_Trabajo_Ilegal]
GO
ALTER TABLE [dbo].[Etiquetas_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Etiqueta_TO_Etiquetas_Posts] FOREIGN KEY([EtiquetaID])
REFERENCES [dbo].[Etiqueta] ([EtiquetaID])
GO
ALTER TABLE [dbo].[Etiquetas_Posts] CHECK CONSTRAINT [FK_Etiqueta_TO_Etiquetas_Posts]
GO
ALTER TABLE [dbo].[Etiquetas_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_TO_Etiquetas_Posts] FOREIGN KEY([PostsID])
REFERENCES [dbo].[Posts] ([PostsID])
GO
ALTER TABLE [dbo].[Etiquetas_Posts] CHECK CONSTRAINT [FK_Posts_TO_Etiquetas_Posts]
GO
ALTER TABLE [dbo].[Fiscalia]  WITH CHECK ADD  CONSTRAINT [FK_Ubigeo_TO_Fiscalia] FOREIGN KEY([UbigeoID])
REFERENCES [dbo].[Ubigeo] ([UbigeoID])
GO
ALTER TABLE [dbo].[Fiscalia] CHECK CONSTRAINT [FK_Ubigeo_TO_Fiscalia]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Comunidad_TO_Posts] FOREIGN KEY([ComunidadID])
REFERENCES [dbo].[Comunidad] ([ComunidadID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Comunidad_TO_Posts]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Denuncia_Aprobada_TO_Posts] FOREIGN KEY([Denuncia_AprobadaID])
REFERENCES [dbo].[Denuncia_Aprobada] ([Denuncia_AprobadaID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Denuncia_Aprobada_TO_Posts]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TO_Posts] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Usuario_TO_Posts]
GO
ALTER TABLE [dbo].[Prendas_Estado_Prendas]  WITH CHECK ADD  CONSTRAINT [FK_Estado_Prendas_TO_Prendas_Estado_Prendas] FOREIGN KEY([Estado_PrendasID])
REFERENCES [dbo].[Estado_Prendas] ([Estado_PrendasID])
GO
ALTER TABLE [dbo].[Prendas_Estado_Prendas] CHECK CONSTRAINT [FK_Estado_Prendas_TO_Prendas_Estado_Prendas]
GO
ALTER TABLE [dbo].[Prendas_Estado_Prendas]  WITH CHECK ADD  CONSTRAINT [FK_Prendas_TO_Prendas_Estado_Prendas] FOREIGN KEY([PrendasID])
REFERENCES [dbo].[Prendas] ([PrendasID])
GO
ALTER TABLE [dbo].[Prendas_Estado_Prendas] CHECK CONSTRAINT [FK_Prendas_TO_Prendas_Estado_Prendas]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TO_Telefono] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Usuario_TO_Telefono]
GO
ALTER TABLE [dbo].[Usuario_Comunidad]  WITH CHECK ADD  CONSTRAINT [FK_Comunidad_TO_Usuario_Comunidad] FOREIGN KEY([ComunidadID])
REFERENCES [dbo].[Comunidad] ([ComunidadID])
GO
ALTER TABLE [dbo].[Usuario_Comunidad] CHECK CONSTRAINT [FK_Comunidad_TO_Usuario_Comunidad]
GO
ALTER TABLE [dbo].[Usuario_Comunidad]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TO_Usuario_Comunidad] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Usuario_Comunidad] CHECK CONSTRAINT [FK_Usuario_TO_Usuario_Comunidad]
GO
USE [master]
GO
ALTER DATABASE [TestChildHood] SET  READ_WRITE 
GO
