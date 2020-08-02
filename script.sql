USE [Inzynier]
GO
/****** Object:  User [APIJSON]    Script Date: 02.08.2020 22:07:52 ******/
CREATE USER [APIJSON] FOR LOGIN [APIJSON] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dbreader]    Script Date: 02.08.2020 22:07:52 ******/
CREATE USER [dbreader] FOR LOGIN [dbreader] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [APIJSON]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [APIJSON]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dbreader]
GO
/****** Object:  Table [dbo].[Gmina]    Script Date: 02.08.2020 22:07:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gmina](
	[ID] [numeric](18, 0) NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
	[Rodzaj] [nvarchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[StartDateVerified] [bit] NOT NULL,
	[EndDateVerified] [bit] NOT NULL,
	[CzyDataPowstania] [bit] NOT NULL,
	[Opis] [nvarchar](max) NULL,
 CONSTRAINT [PK_Gmina_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GminaPowiat]    Script Date: 02.08.2020 22:07:52 ******/
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
	[EndDate] [date] NOT NULL,
	[StartDateVerified] [bit] NOT NULL,
	[EndDateVerified] [bit] NOT NULL,
	[Opis] [nvarchar](max) NULL,
 CONSTRAINT [PK_GminaPowiat] PRIMARY KEY CLUSTERED 
(
	[IDPowiat] ASC,
	[StartDatePowiat] ASC,
	[IDGmina] ASC,
	[StartDateGmina] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GminaRelacja]    Script Date: 02.08.2020 22:07:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GminaRelacja](
	[IDGmina_Old] [numeric](18, 0) NOT NULL,
	[Start_Date_Old] [date] NOT NULL,
	[IDGmina_New] [numeric](18, 0) NOT NULL,
	[Start_Date_New] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Typ] [nvarchar](max) NULL,
 CONSTRAINT [PK_GminaRelacja] PRIMARY KEY CLUSTERED 
(
	[IDGmina_Old] ASC,
	[Start_Date_Old] ASC,
	[IDGmina_New] ASC,
	[Start_Date_New] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GminaWojewodztwo]    Script Date: 02.08.2020 22:07:52 ******/
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
	[EndDate] [date] NOT NULL,
	[StartDateVerified] [bit] NOT NULL,
	[EndDateVerified] [bit] NOT NULL,
	[Opis] [nvarchar](max) NULL,
 CONSTRAINT [PK_GminaWojewodztwo] PRIMARY KEY CLUSTERED 
(
	[IDGmina] ASC,
	[StartDateGmina] ASC,
	[IDWojewodztwo] ASC,
	[StartDateWojewodztwo] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Powiat]    Script Date: 02.08.2020 22:07:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Powiat](
	[ID] [numeric](18, 0) NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
	[Rodzaj] [nvarchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[StartDateVerified] [bit] NOT NULL,
	[EndDateVerified] [bit] NOT NULL,
	[CzyDataPowstania] [bit] NOT NULL,
	[Opis] [nvarchar](max) NULL,
 CONSTRAINT [PK_Powiat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowiatWojewodztwo]    Script Date: 02.08.2020 22:07:52 ******/
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
	[EndDate] [date] NOT NULL,
	[StartDateVerified] [bit] NOT NULL,
	[EndDateVerified] [bit] NOT NULL,
	[Opis] [nvarchar](max) NULL,
 CONSTRAINT [PK_PowiatWojewodztwo] PRIMARY KEY CLUSTERED 
(
	[IDPowiat] ASC,
	[StartDatePowiat] ASC,
	[IDWojewodztwo] ASC,
	[StartDateWojewodztwo] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wojewodztwo]    Script Date: 02.08.2020 22:07:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wojewodztwo](
	[ID] [numeric](18, 0) NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
	[Rodzaj] [nvarchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[StartDateVerified] [bit] NOT NULL,
	[EndDateVerified] [bit] NOT NULL,
	[CzyDataPowstania] [bit] NOT NULL,
	[Opis] [nvarchar](max) NULL,
 CONSTRAINT [PK_Wojewodztwo_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
ALTER TABLE [dbo].[GminaRelacja]  WITH CHECK ADD  CONSTRAINT [FK_GminaRelacja_Gmina] FOREIGN KEY([IDGmina_Old], [Start_Date_Old])
REFERENCES [dbo].[Gmina] ([ID], [StartDate])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GminaRelacja] CHECK CONSTRAINT [FK_GminaRelacja_Gmina]
GO
ALTER TABLE [dbo].[GminaRelacja]  WITH CHECK ADD  CONSTRAINT [FK_GminaRelacja_Gmina1] FOREIGN KEY([IDGmina_New], [Start_Date_New])
REFERENCES [dbo].[Gmina] ([ID], [StartDate])
GO
ALTER TABLE [dbo].[GminaRelacja] CHECK CONSTRAINT [FK_GminaRelacja_Gmina1]
GO
ALTER TABLE [dbo].[GminaWojewodztwo]  WITH CHECK ADD  CONSTRAINT [FK_GminaWojewodztwo_Gmina] FOREIGN KEY([IDGmina], [StartDateGmina])
REFERENCES [dbo].[Gmina] ([ID], [StartDate])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GminaWojewodztwo] CHECK CONSTRAINT [FK_GminaWojewodztwo_Gmina]
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
