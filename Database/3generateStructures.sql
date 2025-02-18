USE [Inzynier]
GO
/****** Object:  User [dbreader]    Script Date: 20.08.2020 23:52:40 ******/
CREATE USER [dbreader] FOR LOGIN [dbreader] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [APIJSON]    Script Date: 20.08.2020 23:52:40 ******/
CREATE USER [APIJSON] FOR LOGIN [APIJSON] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dbreader]
GO
ALTER ROLE [db_datareader] ADD MEMBER [APIJSON]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [APIJSON]
GO
/****** Object:  Table [dbo].[Gmina]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gmina](
	[ID] [numeric](18, 0) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[StartDateVerified] [bit] NOT NULL,
	[EndDateVerified] [bit] NOT NULL,
	[IsCreationDate] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Gmina_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GminaWojewodztwo]    Script Date: 20.08.2020 23:52:40 ******/
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
	[Description] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[Powiat]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Powiat](
	[ID] [numeric](18, 0) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[StartDateVerified] [bit] NOT NULL,
	[EndDateVerified] [bit] NOT NULL,
	[IsCreationDate] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Powiat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowiatWojewodztwo]    Script Date: 20.08.2020 23:52:40 ******/
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
	[Description] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[Wojewodztwo]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wojewodztwo](
	[ID] [numeric](18, 0) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[StartDateVerified] [bit] NOT NULL,
	[EndDateVerified] [bit] NOT NULL,
	[IsCreationDate] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Wojewodztwo_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[WojewodztwoRelacje]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create or alter view [dbo].[WojewodztwoRelacje] as 
select w.ID as Wojewodztwo_ID, w.Name as Wojewodztwo_Name, w.StartDate as Wojewodztwo_StartDate, w.EndDate 
as Wojewodztwo_EndDate, g.Description as DescriptionUnit, g.ID as IDUnit, g.Name as NameUnit, 
g.StartDate as StartDateUnit, g.EndDate as EndDateUnit, gw.StartDate, gw.EndDate
from wojewodztwo w
join GminaWojewodztwo gw on w.ID = gw.IDWojewodztwo and w.StartDate = gw.StartDateWojewodztwo
join gmina g on g.id = gw.IDGmina and g.StartDate = gw.StartDateGmina
union
select w.ID as Wojewodztwo_ID, w.Name as Wojewodztwo_Name, w.StartDate as Wojewodztwo_StartDate, w.EndDate 
as Wojewodztwo_EndDate, p.Description as DescriptionUnit, p.ID as IDUnit, p.Name as NameUnit, 
p.StartDate as StartDateUnit, p.EndDate as EndDateUnit, pw.StartDate, pw.EndDate
from wojewodztwo w
join PowiatWojewodztwo pw on w.ID = pw.IDWojewodztwo and w.StartDate = pw.StartDateWojewodztwo
join powiat p on p.id = pw.IDPowiat and p.StartDate = pw.StartDatePowiat;
GO
/****** Object:  Table [dbo].[GminaPowiat]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GminaPowiat](
	[IDGmina] [numeric](18, 0) NOT NULL,
	[StartDateGmina] [date] NOT NULL,
	[IDPowiat] [numeric](18, 0) NOT NULL,
	[StartDatePowiat] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[StartDateVerified] [bit] NOT NULL,
	[EndDateVerified] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_GminaPowiat] PRIMARY KEY CLUSTERED 
(
	[IDGmina] ASC,
	[StartDatePowiat] ASC,
	[IDPowiat] ASC,
	[StartDateGmina] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[GminaRelacje]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create or alter view [dbo].[GminaRelacje] as 
select g.ID as Gmina_ID, g.Name as Gmina_Name, g.StartDate as Gmina_StartDate, g.EndDate as Gmina_EndDate, 
p.Description as DescriptionUnit, p.ID as IDUnit, p.Name as NameUnit, p.StartDate as 
StartDateUnit, p.EndDate as EndDateUnit, gp.StartDate, gp.EndDate
from gmina g 
join gminapowiat gp on g.ID = gp.IDGmina and g.StartDate = gp.StartDateGmina 
join powiat p on p.id = gp.IDPowiat and p.StartDate = gp.StartDatePowiat 
union
select g.ID as Gmina_ID, g.Name as Gmina_Name, g.StartDate as Gmina_StartDate, g.EndDate as Gmina_EndDate, 
w.Description as DescriptionUnit, w.ID as IDUnit, w.Name as NameUnit, w.StartDate as 
StartDateUnit, w.EndDate as EndDateUnit, gw.StartDate, gw.EndDate
from gmina g 
join gminawojewodztwo gw on g.ID = gw.IDGmina and g.StartDate = gw.StartDateGmina 
join Wojewodztwo w on w.id = gw.IDWojewodztwo and w.StartDate = gw.StartDateWojewodztwo;


GO
/****** Object:  View [dbo].[GminaPowiatWojewodztwo]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[GminaPowiatWojewodztwo] AS
select	distinct
		g.id as Gmina_ID,
		g.Name as Gmina_Name,
		g.Type as Gmina_Type,
		g.StartDate as Gmina_StartDate,
		g.EndDate as Gmina_EndDate,
		g.StartDateVerified as Gmina_StartDateVerified,
		g.EndDateVerified as Gmina_EndDateVerified,
		g.IsCreationDate as Gmina_IsCreationDate,
		g.Description as Gmina_Description,
		gp.IDPowiat as GminaPowiat_IDPowiat,
		gp.StartDatePowiat as GminaPowiat_StartDatePowiat,
		gp.IDGmina as GminaPowiat_IDGmina,
		gp.StartDateGmina as GminaPowiat_StartDateGmina,
		gp.StartDate as GminaPowiat_StartDate,
		gp.EndDate as GminaPowiat_EndDate,
		gp.StartDateVerified as GminaPowiat_StartDateVerified,
		gp.EndDateVerified as GminaPowiat_EndDateVerified,
		gp.Description as GminaPowiat_Description,
		gw.IDGmina as GminaWojewodztwo_IDGmina, 
		gw.StartDateGmina as GminaWojewodztwo_StartDateGmina, 
		gw.IDWojewodztwo as GminaWojewodztwo_IDWojewodztwo,
		gw.StartDateWojewodztwo as GminaWojewodztwo_StartDateWojewodztwo,
		gw.StartDate as GminaWojewodztwo_StartDate,
		gw.EndDate as GminaWojewodztwo_EndDate,
		gw.StartDateVerified as GminaWojewodztwo_StartDateVerified,
		gw.EndDateVerified as GminaWojewodztwo_EndDateVerifief,
		gw.Description as GminaWojewodztwo_Description,
		p.ID as Powiat_ID,
		p.Name as Powiat_Name,
		p.Type as Powiat_Type,
		p.StartDate as Powiat_StartDate,
		p.EndDate as Powiat_EndDate,
		p.StartDateVerified as Powiat_StartDateVerified,
		p.EndDateVerified as Powiat_EndDateVerified,
		p.IsCreationDate as Powiat_IsCreationDate,
		p.Description as Powiat_Description,
		pw.IDPowiat as PowiatWojewodztwo_IDPowiat,
		pw.StartDatePowiat as PowiatWojewodztwo_StartDatePowiat,
		pw.IDWojewodztwo as PowiatWojewodztwo_IDWojewodztwo,
		pw.StartDateWojewodztwo as PowiatWojewodztwo_StartDateWojewodztwo,
		pw.StartDate as PowiatWojewodztwo_StartDate,
		pw.EndDate as PowiatWojewodztwo_EndDate,
		pw.StartDateVerified as PowiatWojewodztwo_StartDateVerified,
		pw.EndDateVerified as PowiatWojewodztwo_EndDateVerified,
		pw.Description as PowiatWojewodztwo_Description,
		w.id as Wojewodztwo_ID,
		w.Name as Wojewodztwo_Name,
		w.Type as Wojewodztwo_Type,
		w.StartDate as Wojewodztwo_StartDate,
		w.EndDate as Wojewodztwo_EndDate,
		w.StartDateVerified as Wojewodztwo_StartDateVerified,
		w.EndDateVerified as Wojewodztwo_EndDateVerified,
		w.IsCreationDate as Wojewodztwo_IsCreationDate,
		w.Description as Wojewodztwo_Description

from Wojewodztwo w
left join PowiatWojewodztwo pw on w.ID = pw.IDWojewodztwo and w.StartDate = pw.StartDateWojewodztwo
left join Powiat p on p.id = pw.IDPowiat and p.StartDate = pw.StartDatePowiat
left join GminaWojewodztwo gw on w.ID = gw.IDWojewodztwo and w.StartDate = gw.StartDateWojewodztwo
left join GminaPowiat gp on p.ID = gp.IDPowiat and p.StartDate = gp.StartDatePowiat
join gmina g on g.ID = gw.IDGmina and g.StartDate = gw.StartDateGmina or g.ID = gp.IDGmina and g.StartDate = gp.StartDateGmina
GO
/****** Object:  View [dbo].[PowiatRelacje]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create or alter view [dbo].[PowiatRelacje] as 
select p.ID as Powiat_ID, p.Name as Powiat_Name, p.StartDate as Powiat_StartDate, p.EndDate as 
Powiat_EndDate, g.Description as DescriptionUnit, g.ID as IDUnit, g.Name as NameUnit, g.StartDate as 
StartDateUnit, g.EndDate as EndDateUnit, gp.StartDate, gp.EndDate
from powiat p
join gminapowiat gp on p.ID = gp.IDPowiat and p.StartDate = gp.StartDatePowiat
join gmina g on g.id = gp.IDGmina and g.StartDate = gp.StartDateGmina
union
select p.ID as Powiat_ID, p.Name as Powiat_Name, p.StartDate as Powiat_StartDate, p.EndDate as 
Powiat_EndDate, w.Description as DescriptionUnit, w.ID as IDUnit, w.Name as NameUnit, w.StartDate as 
StartDateUnit, w.EndDate as EndDateUnit, pw.StartDate, pw.EndDate
from powiat p
join powiatwojewodztwo pw on p.ID = pw.IDPowiat and p.StartDate = pw.StartDatePowiat
join Wojewodztwo w on w.id = pw.IDWojewodztwo and w.StartDate = pw.StartDateWojewodztwo;
GO
/****** Object:  Table [dbo].[GminaRelacja]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GminaRelacja](
	[IDGmina_1] [numeric](18, 0) NOT NULL,
	[Start_Date_1] [date] NOT NULL,
	[IDGmina_2] [numeric](18, 0) NOT NULL,
	[Start_Date_2] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_GminaRelacja] PRIMARY KEY CLUSTERED 
(
	[IDGmina_1] ASC,
	[Start_Date_1] ASC,
	[IDGmina_2] ASC,
	[Start_Date_2] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[GminaGmina]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create or alter view [dbo].[GminaGmina] as
select 
g.id as IDGmina1, g.Name as Name1, g.Description as Description1, g.StartDate as StartDate1, g.Description as Opis1,
g2.id as IDGmina2, g2.Name as Name2, g2.Description as Description2, g2.StartDate as StartDate2, g2.Description as Opis2,
gr.StartDate, gr.EndDate, gr.Description
from GminaRelacja gr
join gmina g on g.ID = gr.IDGmina_1 and g.StartDate = gr.Start_Date_1
join gmina g2 on g2.ID = gr.IDGmina_2 and g2.StartDate = gr.Start_Date_2;
 
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
ALTER TABLE [dbo].[GminaRelacja]  WITH NOCHECK ADD  CONSTRAINT [FK_GminaRelacja_Gmina] FOREIGN KEY([IDGmina_1], [Start_Date_1])
REFERENCES [dbo].[Gmina] ([ID], [StartDate])
GO
ALTER TABLE [dbo].[GminaRelacja] NOCHECK CONSTRAINT [FK_GminaRelacja_Gmina]
GO
ALTER TABLE [dbo].[GminaRelacja]  WITH NOCHECK ADD  CONSTRAINT [FK_GminaRelacja_Gmina1] FOREIGN KEY([IDGmina_2], [Start_Date_2])
REFERENCES [dbo].[Gmina] ([ID], [StartDate])
GO
ALTER TABLE [dbo].[GminaRelacja] NOCHECK CONSTRAINT [FK_GminaRelacja_Gmina1]
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
USE [master]
GO
ALTER DATABASE [Inzynier] SET  READ_WRITE 
GO
