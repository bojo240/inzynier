USE [master]
GO
/****** Object:  Database [Inzynier]    Script Date: 09.03.2020 19:52:43 ******/
CREATE DATABASE [Inzynier]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inzynier', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Inzynier.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Inzynier_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Inzynier_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Inzynier] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inzynier].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inzynier] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inzynier] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inzynier] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inzynier] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inzynier] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inzynier] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inzynier] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inzynier] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inzynier] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inzynier] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inzynier] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inzynier] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inzynier] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inzynier] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inzynier] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Inzynier] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inzynier] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inzynier] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inzynier] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inzynier] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inzynier] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inzynier] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inzynier] SET RECOVERY FULL 
GO
ALTER DATABASE [Inzynier] SET  MULTI_USER 
GO
ALTER DATABASE [Inzynier] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inzynier] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inzynier] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inzynier] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Inzynier] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Inzynier', N'ON'
GO
ALTER DATABASE [Inzynier] SET QUERY_STORE = OFF
GO
USE [Inzynier]
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] UNIQUE NONCLUSTERED 
(
	[group_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_permission_content_type_id_codename_01ab375a_uniq] UNIQUE NONCLUSTERED 
(
	[content_type_id] ASC,
	[codename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetime2](7) NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_user_username_6821ab7c_uniq] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_user_groups_user_id_group_id_94350c0c_uniq] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bielskie]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bielskie](
	[nazwa] [varchar](max) NULL,
	[rodzaj] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bielskie75_98]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bielskie75_98](
	[Wojewodztwo] [nvarchar](50) NULL,
	[Gmina1975] [nvarchar](50) NULL,
	[Uwagi1975] [nvarchar](500) NULL,
	[Gmina_02_07_1976] [nvarchar](50) NULL,
	[Gmina_01_01_1977] [nvarchar](50) NULL,
	[Gmina_01_04_1990] [nvarchar](50) NULL,
	[Gmina_02_04_1991] [nvarchar](50) NULL,
	[Gmina_01_01_1992] [nvarchar](50) NULL,
	[Gmina_31_12_1997] [nvarchar](50) NULL,
	[Rodzaj] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[czestochowskie75_98]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[czestochowskie75_98](
	[Wojewodztwo] [nvarchar](50) NULL,
	[Gmina1975] [nvarchar](50) NULL,
	[Rodzaj] [nvarchar](50) NULL,
	[Opis] [nvarchar](500) NULL,
	[Gmina_15_01_1976] [nvarchar](50) NULL,
	[Gmina_01_01_1977] [nvarchar](50) NULL,
	[Gmina_01_10_1982] [nvarchar](50) NULL,
	[Gmina_01_01_1992] [nvarchar](50) NULL,
	[Gmina_01_01_1993] [nvarchar](50) NULL,
	[Gmina_31_12_1997] [nvarchar](50) NULL,
	[RodzajGminy] [nvarchar](50) NULL,
	[Wojewodztwo_w_98] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetime2](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [django_content_type_app_label_model_76bd3d3b_uniq] UNIQUE NONCLUSTERED 
(
	[app_label] ASC,
	[model] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gmina]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gmina](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
	[Rodzaj] [nvarchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[CzyZweryfikowane] [bit] NOT NULL,
	[CzyDataPowstania] [bit] NOT NULL,
 CONSTRAINT [PK_Gmina_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gmina2]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gmina2](
	[ID] [numeric](18, 0) NULL,
	[IDGminy] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GminaPowiat]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GminaPowiat](
	[IDPowiat] [numeric](18, 0) NOT NULL,
	[StartDatePowiat] [date] NOT NULL,
	[IDGmina] [numeric](18, 0) NOT NULL,
	[StartDateGmina] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[CzyZweryfikowane] [bit] NOT NULL,
 CONSTRAINT [PK_GminaPowiat] PRIMARY KEY CLUSTERED 
(
	[IDPowiat] ASC,
	[StartDatePowiat] ASC,
	[IDGmina] ASC,
	[StartDateGmina] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GminaWojewodztwo]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GminaWojewodztwo](
	[IDGmina] [numeric](18, 0) NOT NULL,
	[StartDateGmina] [date] NOT NULL,
	[IDWojewodztwo] [numeric](18, 0) NOT NULL,
	[StartDateWojewodztwo] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[CzyZweryfikowane] [bit] NOT NULL,
 CONSTRAINT [PK_GminaWojewodztwo] PRIMARY KEY CLUSTERED 
(
	[IDGmina] ASC,
	[StartDateGmina] ASC,
	[IDWojewodztwo] ASC,
	[StartDateWojewodztwo] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[katowickie1973]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[katowickie1973](
	[Wojewodztwo] [nvarchar](50) NULL,
	[Powiat] [nvarchar](50) NULL,
	[Gmina] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[katowickie75_98]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[katowickie75_98](
	[Wojewodztwo] [nvarchar](50) NULL,
	[Gmina1975] [nvarchar](50) NULL,
	[Gmina_01_02_1977] [nvarchar](50) NULL,
	[Gmina_01_10_1982] [nvarchar](50) NULL,
	[Gmina_01_01_1991] [nvarchar](50) NULL,
	[Gmina_02_04_1991] [nvarchar](50) NULL,
	[Gmina_01_01_1992] [nvarchar](50) NULL,
	[Gmina_01_01_1993] [nvarchar](50) NULL,
	[Gmina_30_12_1994] [nvarchar](50) NULL,
	[Gmina_01_01_1997] [nvarchar](50) NULL,
	[Gmina_31_12_1997] [nvarchar](50) NULL,
	[Uwagi] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[katowickieGminy1973]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[katowickieGminy1973](
	[Wojewodztwo] [nvarchar](50) NULL,
	[Powiat] [nvarchar](50) NULL,
	[Gmina1972] [nvarchar](50) NULL,
	[Gmina1I1975] [nvarchar](50) NULL,
	[Gmina27V1975] [nvarchar](50) NULL,
	[Gmina1VI1975] [nvarchar](50) NULL,
	[DokadUwagi] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[legnickie75_98]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[legnickie75_98](
	[Wojewodztwo] [nvarchar](50) NULL,
	[Gmina_31_12_1976] [nvarchar](50) NULL,
	[Gmina_31_12_1997] [nvarchar](50) NULL,
	[Rodzaj] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyUsers]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyUsers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](30) NOT NULL,
	[lastname] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[opolskie1973]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opolskie1973](
	[Wojewodztwo] [nvarchar](50) NULL,
	[Powiat] [nvarchar](50) NULL,
	[RodzajPowiatu] [nvarchar](50) NULL,
	[Miasto] [nvarchar](50) NULL,
	[Osiedle] [nvarchar](50) NULL,
	[Gmina1972] [nvarchar](50) NULL,
	[Siedziba] [nvarchar](50) NULL,
	[Gmina1I1975] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[opolskie75_98]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opolskie75_98](
	[Województwo] [nvarchar](50) NULL,
	[Gmina_01_01_1975] [nvarchar](50) NULL,
	[Gmina_01_06_1975] [nvarchar](50) NULL,
	[Gmina_30_10_1975] [nvarchar](50) NULL,
	[Gmina_01_01_1992] [nvarchar](50) NULL,
	[Gmina_01_01_1998] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Powiat]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Powiat](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
	[Rodzaj] [nvarchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[CzyZweryfikowane] [bit] NOT NULL,
	[CzyDataPowstania] [bit] NOT NULL,
 CONSTRAINT [PK_Powiat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowiatWojewodztwo]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowiatWojewodztwo](
	[IDPowiat] [numeric](18, 0) NOT NULL,
	[StartDatePowiat] [date] NOT NULL,
	[IDWojewodztwo] [numeric](18, 0) NOT NULL,
	[StartDateWojewodztwo] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[CzyZweryfikowane] [bit] NOT NULL,
 CONSTRAINT [PK_PowiatWojewodztwo] PRIMARY KEY CLUSTERED 
(
	[IDPowiat] ASC,
	[StartDatePowiat] ASC,
	[IDWojewodztwo] ASC,
	[StartDateWojewodztwo] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teryt2019]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teryt2019](
	[Wojewodztwo] [nvarchar](50) NULL,
	[Powiat] [nvarchar](50) NULL,
	[Nazwa] [nvarchar](50) NULL,
	[RodzajGminy] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teryt2019Powiaty]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teryt2019Powiaty](
	[Wojewodztwo] [nvarchar](50) NULL,
	[Powiat] [nvarchar](50) NULL,
	[RodzajPowiatu] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Toponim]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Toponim](
	[ID] [numeric](18, 0) NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
	[Rodzaj] [nvarchar](50) NULL,
	[StartDate] [nchar](10) NOT NULL,
	[EndDate] [nchar](10) NULL,
	[CzyZweryfikowane] [bit] NOT NULL,
	[CzyDataPowstania] [bit] NOT NULL,
 CONSTRAINT [PK_Toponim] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToponimGmina]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToponimGmina](
	[IDToponim] [numeric](18, 0) NOT NULL,
	[StartDateToponim] [nchar](10) NOT NULL,
	[IDGmina] [numeric](18, 0) NOT NULL,
	[StartDateGmina] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[CzyZweryfikowane] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[walbrzyskie75_98]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[walbrzyskie75_98](
	[Wojewodztwo] [nvarchar](50) NULL,
	[Gmina1975] [nvarchar](50) NULL,
	[Gmina_02_07_1976] [nvarchar](50) NULL,
	[Gmina_02_04_1991] [nvarchar](50) NULL,
	[Gmina_31_12_1997] [nvarchar](50) NULL,
	[RodzajGminy] [nvarchar](50) NULL,
	[Uwagi] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wojewodztwo]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wojewodztwo](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
	[Rodzaj] [nvarchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[CzyZweryfikowane] [bit] NOT NULL,
	[CzyDataPowstania] [bit] NOT NULL,
 CONSTRAINT [PK_Wojewodztwo_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wroclawskie1973]    Script Date: 09.03.2020 19:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wroclawskie1973](
	[Wojewodztwo] [nvarchar](50) NULL,
	[Powiat] [nvarchar](50) NULL,
	[Gmina] [nvarchar](50) NULL,
	[Solectwo] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 09.03.2020 19:52:43 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 09.03.2020 19:52:43 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 09.03.2020 19:52:43 ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_group_id_97559544]    Script Date: 09.03.2020 19:52:43 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_6a12ed8b]    Script Date: 09.03.2020 19:52:43 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_user_id_6a12ed8b] ON [dbo].[auth_user_groups]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_permission_id_1fbb5f2c]    Script Date: 09.03.2020 19:52:43 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_a95ead1b]    Script Date: 09.03.2020 19:52:43 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 09.03.2020 19:52:43 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 09.03.2020 19:52:43 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 09.03.2020 19:52:43 ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id]
GO
ALTER TABLE [dbo].[GminaPowiat]  WITH CHECK ADD  CONSTRAINT [FK_GminaPowiat_Gmina1] FOREIGN KEY([IDGmina], [StartDateGmina])
REFERENCES [dbo].[Gmina] ([ID], [StartDate])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GminaPowiat] CHECK CONSTRAINT [FK_GminaPowiat_Gmina1]
GO
ALTER TABLE [dbo].[GminaPowiat]  WITH CHECK ADD  CONSTRAINT [FK_GminaPowiat_Powiat] FOREIGN KEY([IDPowiat], [StartDatePowiat])
REFERENCES [dbo].[Powiat] ([ID], [StartDate])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GminaPowiat] CHECK CONSTRAINT [FK_GminaPowiat_Powiat]
GO
ALTER TABLE [dbo].[GminaWojewodztwo]  WITH CHECK ADD  CONSTRAINT [FK_GminaWojewodztwo_Wojewodztwo] FOREIGN KEY([IDWojewodztwo], [StartDateWojewodztwo])
REFERENCES [dbo].[Wojewodztwo] ([ID], [StartDate])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GminaWojewodztwo] CHECK CONSTRAINT [FK_GminaWojewodztwo_Wojewodztwo]
GO
ALTER TABLE [dbo].[PowiatWojewodztwo]  WITH CHECK ADD  CONSTRAINT [FK_PowiatWojewodztwo_Powiat1] FOREIGN KEY([IDPowiat], [StartDatePowiat])
REFERENCES [dbo].[Powiat] ([ID], [StartDate])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PowiatWojewodztwo] CHECK CONSTRAINT [FK_PowiatWojewodztwo_Powiat1]
GO
ALTER TABLE [dbo].[PowiatWojewodztwo]  WITH CHECK ADD  CONSTRAINT [FK_PowiatWojewodztwo_Wojewodztwo1] FOREIGN KEY([IDWojewodztwo], [StartDateWojewodztwo])
REFERENCES [dbo].[Wojewodztwo] ([ID], [StartDate])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PowiatWojewodztwo] CHECK CONSTRAINT [FK_PowiatWojewodztwo_Wojewodztwo1]
GO
ALTER TABLE [dbo].[ToponimGmina]  WITH CHECK ADD  CONSTRAINT [FK_MiastoGmina_Miasto/Wies1] FOREIGN KEY([IDToponim], [StartDateToponim])
REFERENCES [dbo].[Toponim] ([ID], [StartDate])
GO
ALTER TABLE [dbo].[ToponimGmina] CHECK CONSTRAINT [FK_MiastoGmina_Miasto/Wies1]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
USE [master]
GO
ALTER DATABASE [Inzynier] SET  READ_WRITE 
GO
