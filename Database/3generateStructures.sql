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
/****** Object:  Table [dbo].[Powiat]    Script Date: 20.08.2020 23:52:40 ******/
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
/****** Object:  Table [dbo].[Wojewodztwo]    Script Date: 20.08.2020 23:52:40 ******/
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
/****** Object:  View [dbo].[zawartosc_wojewodztw]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[zawartosc_wojewodztw] as 
select w.ID as IDWojewodztwa, w.Nazwa as NazwaWojewodztwa, w.StartDate as StartDateWojewodztwa, w.EndDate as 
EndDateWojewodztwa, g.Rodzaj as RodzajJednostki, g.ID as IDJednostki, g.Nazwa as NazwaJednostki, g.StartDate as 
StartDateJednostki, g.EndDate as EndDateJednostki, gw.StartDate as StartDateRelacji, gw.EndDate as 
EndDateRelacji
from wojewodztwo w
join GminaWojewodztwo gw on w.ID = gw.IDWojewodztwo and w.StartDate = gw.StartDateWojewodztwo
join gmina g on g.id = gw.IDGmina and g.StartDate = gw.StartDateGmina
union
select w.ID as IDWojewodztwa, w.Nazwa as NazwaWojewodztwa, w.StartDate as StartDateWojewodztwa, w.EndDate as 
EndDateWojewodztwa, p.Rodzaj as RodzajJednostki, p.ID as IDJednostki, p.Nazwa as NazwaJednostki, p.StartDate as 
StartDateJednostki, p.EndDate as EndDateJednostki, pw.StartDate as StartDateRelacji, pw.EndDate as 
EndDateRelacji
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
/****** Object:  View [dbo].[APIprzynaleznoscGmin]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[APIprzynaleznoscGmin] as 
select g.ID as IDGminy, g.Nazwa as NazwaGminy, g.StartDate as StartDateGminy, g.EndDate as EndDateGminy, 
p.Rodzaj as RodzajJednostki, p.ID as IDJednostki, p.Nazwa as NazwaJednostki, p.StartDate as 
StartDateJednostki, p.EndDate as EndDateJednostki, gp.StartDate as StartDateRelacji, gp.EndDate as 
EndDateRelacji 
from gmina g 
join gminapowiat gp on g.ID = gp.IDGmina and g.StartDate = gp.StartDateGmina 
join powiat p on p.id = gp.IDPowiat and p.StartDate = gp.StartDatePowiat 
union
select g.ID as IDGminy, g.Nazwa as NazwaGminy, g.StartDate as StartDateGminy, g.EndDate as EndDateGminy, 
w.Rodzaj as RodzajJednostki, w.ID as IDJednostki, w.Nazwa as NazwaJednostki, w.StartDate as 
StartDateJednostki, w.EndDate as EndDateJednostki, gw.StartDate as StartDateRelacji, gw.EndDate as 
EndDateRelacji 
from gmina g 
join gminawojewodztwo gw on g.ID = gw.IDGmina and g.StartDate = gw.StartDateGmina 
join Wojewodztwo w on w.id = gw.IDWojewodztwo and w.StartDate = gw.StartDateWojewodztwo;
GO
/****** Object:  View [dbo].[WSZYSTKO]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[WSZYSTKO] AS
select	distinct
		g.id as Gmina_ID,
		g.Nazwa as Gmina_Nazwa,
		g.Rodzaj as Gmina_Rodzaj,
		g.StartDate as Gmina_StartDate,
		g.EndDate as Gmina_EndDate,
		g.StartDateVerified as Gmina_StartDateVerified,
		g.EndDateVerified as Gmina_EndDateVerified,
		g.CzyDataPowstania as Gmina_CzyDataPowstania,
		g.opis as Gmina_Opis,
		gp.IDPowiat as GminaPowiat_IDPowiat,
		gp.StartDatePowiat as GminaPowiat_StartDatePowiat,
		gp.IDGmina as GminaPowiat_IDGmina,
		gp.StartDateGmina as GminaPowiat_StartDateGmina,
		gp.StartDate as GminaPowiat_StartDate,
		gp.EndDate as GminaPowiat_EndDate,
		gp.StartDateVerified as GminaPowiat_StartDateVerified,
		gp.EndDateVerified as GminaPowiat_EndDateVerified,
		gp.Opis as GminaPowiat_Opis,
		gw.IDGmina as GminaWojewodztwo_IDGmina, 
		gw.StartDateGmina as GminaWojewodztwo_StartDateGmina, 
		gw.IDWojewodztwo as GminaWojewodztwo_IDWojewodztow,
		gw.StartDateWojewodztwo as GminaWojewodztwo_StartDateWojewodztwo,
		gw.StartDate as GminaWojewodztwo_StartDate,
		gw.EndDate as GminaWojewodztwo_EndDate,
		gw.StartDateVerified as GminaWojewodztwo_StartDateVerified,
		gw.EndDateVerified as GminaWojewodztwo_EndDateVerifief,
		gw.Opis as GminaWojewodztwo_Opis,
		p.ID as Powiat_ID,
		p.Nazwa as Powiat_Nazwa,
		p.Rodzaj as Powiat_Rodzaj,
		p.StartDate as Powiat_StartDate,
		p.EndDate as Powiat_EndDate,
		p.StartDateVerified as Powiat_StartDateVerified,
		p.EndDateVerified as Powiat_EndDateVerified,
		p.CzyDataPowstania as Powiat_CzyDataPowstania,
		p.Opis as Powiat_Opis,
		pw.IDPowiat as PowiatWojewodztwo_IDPowiat,
		pw.StartDatePowiat as PowiatWojewodztwo_StartDatePowiat,
		pw.IDWojewodztwo as PowiatWojewodztwo_IDWojewodztwo,
		pw.StartDateWojewodztwo as PowiatWojewodztwo_StartDateWojewodztwo,
		pw.StartDate as PowiatWojewodztwo_StartDate,
		pw.EndDate as PowiatWojewodztwo_EndDate,
		pw.StartDateVerified as PowiatWojewodztwo_StartDateVerified,
		pw.EndDateVerified as PowiatWojewodztwo_EndDateVerified,
		pw.Opis as PowiatWojewodztwo_Opis,
		w.id as Wojewodztwo_ID,
		w.Nazwa as Wojewodztwo_Nazwa,
		w.Rodzaj as Wojewodztwo_Rodzaj,
		w.StartDate as Wojewodztwo_StartDate,
		w.EndDate as Wojewodztwo_EndDate,
		w.StartDateVerified as Wojewodztwo_StartDateVerified,
		w.EndDateVerified as Wojewodztwo_EndDateVerified,
		w.CzyDataPowstania as Wojewodztwo_CzyDataPowstania,
		w.Opis as Wojewodztwo_Opis

from Wojewodztwo w
left join PowiatWojewodztwo pw on w.ID = pw.IDWojewodztwo and w.StartDate = pw.StartDateWojewodztwo
left join Powiat p on p.id = pw.IDPowiat and p.StartDate = pw.StartDatePowiat
left join GminaWojewodztwo gw on w.ID = gw.IDWojewodztwo and w.StartDate = gw.StartDateWojewodztwo
left join GminaPowiat gp on p.ID = gp.IDPowiat and p.StartDate = gp.StartDatePowiat
join gmina g on g.ID = gw.IDGmina and g.StartDate = gw.StartDateGmina or g.ID = gp.IDGmina and g.StartDate = gp.StartDateGmina
GO
/****** Object:  View [dbo].[ZawartoscPrzynaleznoscPowiatow]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[ZawartoscPrzynaleznoscPowiatow] as 
select p.ID as IDPowiatu, p.Nazwa as NazwaPowiatu, p.StartDate as StartDatePowiatu, p.EndDate as 
EndDatePowiatu, g.Rodzaj as RodzajJednostki, g.ID as IDJednostki, g.Nazwa as NazwaJednostki, g.StartDate as 
StartDateJednostki, g.EndDate as EndDateJednostki, gp.StartDate as StartDateRelacji, gp.EndDate as 
EndDateRelacji
from powiat p
join gminapowiat gp on p.ID = gp.IDPowiat and p.StartDate = gp.StartDatePowiat
join gmina g on g.id = gp.IDGmina and g.StartDate = gp.StartDateGmina
union
select p.ID as IDPowiatu, p.Nazwa as NazwaPowiatu, p.StartDate as StartDatePowiatu, p.EndDate as 
EndDatePowiatu, w.Rodzaj as RodzajJednostki, w.ID as IDJednostki, w.Nazwa as NazwaJednostki, w.StartDate as 
StartDateJednostki, w.EndDate as EndDateJednostki, pw.StartDate as StartDateRelacji, pw.EndDate as 
EndDateRelacji
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
/****** Object:  View [dbo].[gminaRelacje]    Script Date: 20.08.2020 23:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[gminaRelacje] as
select 
g.id as IDGmina1, g.nazwa as Nazwa1, g.Rodzaj as Rodzaj1, g.StartDate as StartDate1, g.Opis as Opis1,
g2.id as IDGmina2, g2.nazwa as Nazwa2, g2.Rodzaj as Rodzaj2, g2.StartDate as StartDate2, g2.Opis as Opis2,
gr.StartDate, gr.EndDate, gr.Typ
from GminaRelacja gr
join gmina g on g.ID = gr.IDGmina_Old and g.StartDate = gr.Start_Date_Old
join gmina g2 on g2.ID = gr.IDGmina_New and g2.StartDate = gr.Start_Date_New;
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
ALTER TABLE [dbo].[GminaRelacja]  WITH NOCHECK ADD  CONSTRAINT [FK_GminaRelacja_Gmina] FOREIGN KEY([IDGmina_Old], [Start_Date_Old])
REFERENCES [dbo].[Gmina] ([ID], [StartDate])
GO
ALTER TABLE [dbo].[GminaRelacja] NOCHECK CONSTRAINT [FK_GminaRelacja_Gmina]
GO
ALTER TABLE [dbo].[GminaRelacja]  WITH NOCHECK ADD  CONSTRAINT [FK_GminaRelacja_Gmina1] FOREIGN KEY([IDGmina_New], [Start_Date_New])
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
