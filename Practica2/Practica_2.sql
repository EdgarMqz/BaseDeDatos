USE [master]
GO
/****** Object:  Database [ClinicaVet]    Script Date: 24/02/2018 11:55:08 a.m. ******/
CREATE DATABASE [ClinicaVet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClinicaVet', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ClinicaVet.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ClinicaVet_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ClinicaVet_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ClinicaVet] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClinicaVet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClinicaVet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClinicaVet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClinicaVet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClinicaVet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClinicaVet] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClinicaVet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClinicaVet] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ClinicaVet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClinicaVet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClinicaVet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClinicaVet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClinicaVet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClinicaVet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClinicaVet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClinicaVet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClinicaVet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClinicaVet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClinicaVet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClinicaVet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClinicaVet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClinicaVet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClinicaVet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClinicaVet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClinicaVet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClinicaVet] SET  MULTI_USER 
GO
ALTER DATABASE [ClinicaVet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClinicaVet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClinicaVet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClinicaVet] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ClinicaVet]
GO
/****** Object:  Table [dbo].[medico]    Script Date: 24/02/2018 11:55:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medico](
	[cedula] [uniqueidentifier] NOT NULL,
	[nombre] [nchar](10) NOT NULL,
	[salario] [int] NOT NULL,
	[fechaNacimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_medico] PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 24/02/2018 11:55:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[id] [uniqueidentifier] NOT NULL,
	[peso] [int] NOT NULL,
	[nombre] [char](10) NOT NULL,
	[fechaNacimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[practicante]    Script Date: 24/02/2018 11:55:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[practicante](
	[id] [uniqueidentifier] NOT NULL,
	[nombre] [nchar](10) NOT NULL,
	[salario] [int] NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[edad]  AS (datediff(year,[fechanacimiento],getdate())),
 CONSTRAINT [PK_practicante] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProvedorAlimento]    Script Date: 24/02/2018 11:55:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProvedorAlimento](
	[RFC] [uniqueidentifier] NOT NULL,
	[RazonSocial] [nchar](10) NOT NULL,
	[CantidadAlimento] [float] NOT NULL,
	[FechaCompra] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sales]    Script Date: 24/02/2018 11:55:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[folio] [uniqueidentifier] NOT NULL,
	[cantidad] [int] NULL,
	[precio] [float] NULL,
	[total]  AS ([precio]*(1.16)),
	[fechaExpedicion] [date] NULL,
 CONSTRAINT [Ventas] PRIMARY KEY CLUSTERED 
(
	[folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [medico]    Script Date: 24/02/2018 11:55:08 a.m. ******/
CREATE NONCLUSTERED INDEX [medico] ON [dbo].[medico]
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ClinicaVet] SET  READ_WRITE 
GO
