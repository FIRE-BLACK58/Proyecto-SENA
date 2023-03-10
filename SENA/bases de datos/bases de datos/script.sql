USE [master]
GO
/****** Object:  Database [ProyectoDB]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE DATABASE [ProyectoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProyectoDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProyectoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProyectoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ProyectoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoDB] SET QUERY_STORE = OFF
GO
USE [ProyectoDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arbitroes]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arbitroes](
	[ArbitroId] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [nvarchar](20) NOT NULL,
	[Nombres] [nvarchar](20) NOT NULL,
	[Apellidos] [nvarchar](20) NOT NULL,
	[Genero] [nvarchar](20) NOT NULL,
	[Deporte] [nvarchar](20) NOT NULL,
	[Telefono] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_dbo.Arbitroes] PRIMARY KEY CLUSTERED 
(
	[ArbitroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canchas]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canchas](
	[CanchaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Direccion] [nvarchar](40) NOT NULL,
	[Telefono] [nvarchar](15) NOT NULL,
	[CantidadEspectadores] [nvarchar](15) NOT NULL,
	[Medidas] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.Canchas] PRIMARY KEY CLUSTERED 
(
	[CanchaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deportistas]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportistas](
	[DeportistaId] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [nvarchar](20) NOT NULL,
	[Nombres] [nvarchar](20) NOT NULL,
	[Apellidos] [nvarchar](20) NOT NULL,
	[Direccion] [nvarchar](40) NOT NULL,
	[Telefono] [nvarchar](15) NOT NULL,
	[RH] [nvarchar](15) NOT NULL,
	[EPS] [nvarchar](20) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Genero] [nvarchar](20) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrenadors]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrenadors](
	[EntrenadorId] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [nvarchar](20) NOT NULL,
	[Nombres] [nvarchar](20) NOT NULL,
	[Apellidos] [nvarchar](40) NOT NULL,
	[Genero] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_dbo.Entrenadors] PRIMARY KEY CLUSTERED 
(
	[EntrenadorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipoes]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipoes](
	[EquipoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Deporte] [nvarchar](20) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[EntrenadorId] [int] NOT NULL,
	[PatrocinadorId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Equipoes] PRIMARY KEY CLUSTERED 
(
	[EquipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Escenarios]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Escenarios](
	[EscenarioId] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [nvarchar](40) NOT NULL,
	[Telefono] [nvarchar](15) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.Escenarios] PRIMARY KEY CLUSTERED 
(
	[EscenarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[MunicipioId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_dbo.Municipios] PRIMARY KEY CLUSTERED 
(
	[MunicipioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patrocinadors]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patrocinadors](
	[PatrocinadorId] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [nvarchar](20) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Direccion] [nvarchar](40) NOT NULL,
	[Telefono] [nvarchar](15) NOT NULL,
	[TipoPersona] [nvarchar](15) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Patrocinadors] PRIMARY KEY CLUSTERED 
(
	[PatrocinadorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TorneoEquipoes]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TorneoEquipoes](
	[TorneoEquipoId] [int] IDENTITY(1,1) NOT NULL,
	[TorneoId] [int] NOT NULL,
	[Equipoid] [int] NOT NULL,
 CONSTRAINT [PK_dbo.TorneoEquipoes] PRIMARY KEY CLUSTERED 
(
	[TorneoEquipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Torneos]    Script Date: 17/09/2022 12:28:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Torneos](
	[TorneoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Categoria] [nvarchar](20) NOT NULL,
	[FechaInicial] [datetime] NOT NULL,
	[FechaFinal] [datetime] NOT NULL,
	[MunicipioId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Torneos] PRIMARY KEY CLUSTERED 
(
	[TorneoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexIdentificacion]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IndexIdentificacion] ON [dbo].[Arbitroes]
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexIdentificacion]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IndexIdentificacion] ON [dbo].[Entrenadors]
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexNombre]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IndexNombre] ON [dbo].[Equipoes]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EntrenadorId]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_EntrenadorId] ON [dbo].[Equipoes]
(
	[EntrenadorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatrocinadorId]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_PatrocinadorId] ON [dbo].[Equipoes]
(
	[PatrocinadorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexNombre]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IndexNombre] ON [dbo].[Municipios]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexIdentificacion]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IndexIdentificacion] ON [dbo].[Patrocinadors]
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Equipoid]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Equipoid] ON [dbo].[TorneoEquipoes]
(
	[Equipoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TorneoId]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_TorneoId] ON [dbo].[TorneoEquipoes]
(
	[TorneoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexNombre]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IndexNombre] ON [dbo].[Torneos]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MunicipioId]    Script Date: 17/09/2022 12:28:07 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_MunicipioId] ON [dbo].[Torneos]
(
	[MunicipioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Escenarios] ADD  DEFAULT ('') FOR [Nombre]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Equipoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Equipoes_dbo.Entrenadors_EntrenadorId] FOREIGN KEY([EntrenadorId])
REFERENCES [dbo].[Entrenadors] ([EntrenadorId])
GO
ALTER TABLE [dbo].[Equipoes] CHECK CONSTRAINT [FK_dbo.Equipoes_dbo.Entrenadors_EntrenadorId]
GO
ALTER TABLE [dbo].[Equipoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Equipoes_dbo.Patrocinadors_PatrocinadorId] FOREIGN KEY([PatrocinadorId])
REFERENCES [dbo].[Patrocinadors] ([PatrocinadorId])
GO
ALTER TABLE [dbo].[Equipoes] CHECK CONSTRAINT [FK_dbo.Equipoes_dbo.Patrocinadors_PatrocinadorId]
GO
ALTER TABLE [dbo].[TorneoEquipoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TorneoEquipoes_dbo.Equipoes_Equipoid] FOREIGN KEY([Equipoid])
REFERENCES [dbo].[Equipoes] ([EquipoId])
GO
ALTER TABLE [dbo].[TorneoEquipoes] CHECK CONSTRAINT [FK_dbo.TorneoEquipoes_dbo.Equipoes_Equipoid]
GO
ALTER TABLE [dbo].[TorneoEquipoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TorneoEquipoes_dbo.Torneos_TorneoId] FOREIGN KEY([TorneoId])
REFERENCES [dbo].[Torneos] ([TorneoId])
GO
ALTER TABLE [dbo].[TorneoEquipoes] CHECK CONSTRAINT [FK_dbo.TorneoEquipoes_dbo.Torneos_TorneoId]
GO
ALTER TABLE [dbo].[Torneos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Torneos_dbo.Municipios_MunicipioId] FOREIGN KEY([MunicipioId])
REFERENCES [dbo].[Municipios] ([MunicipioId])
GO
ALTER TABLE [dbo].[Torneos] CHECK CONSTRAINT [FK_dbo.Torneos_dbo.Municipios_MunicipioId]
GO
USE [master]
GO
ALTER DATABASE [ProyectoDB] SET  READ_WRITE 
GO
