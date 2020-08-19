/*
   środa, 19 sierpnia 202019:58:28
   User: 
   Server: DESKTOP-BQPOPVS
   Database: Inzynier
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Powiat
	(
	ID numeric(18, 0) NOT NULL IDENTITY (1, 1),
	Nazwa nvarchar(50) NOT NULL,
	Rodzaj nvarchar(50) NULL,
	StartDate date NOT NULL,
	EndDate date NOT NULL,
	StartDateVerified bit NOT NULL,
	EndDateVerified bit NOT NULL,
	CzyDataPowstania bit NOT NULL,
	Opis nvarchar(MAX) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Powiat SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Powiat ON
GO
IF EXISTS(SELECT * FROM dbo.Powiat)
	 EXEC('INSERT INTO dbo.Tmp_Powiat (ID, Nazwa, Rodzaj, StartDate, EndDate, StartDateVerified, EndDateVerified, CzyDataPowstania, Opis)
		SELECT ID, Nazwa, Rodzaj, StartDate, EndDate, StartDateVerified, EndDateVerified, CzyDataPowstania, Opis FROM dbo.Powiat WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Powiat OFF
GO
ALTER TABLE dbo.GminaPowiat
	DROP CONSTRAINT FK_GminaPowiat_Powiat
GO
ALTER TABLE dbo.PowiatWojewodztwo
	DROP CONSTRAINT FK_PowiatWojewodztwo_Powiat1
GO
DROP TABLE dbo.Powiat
GO
EXECUTE sp_rename N'dbo.Tmp_Powiat', N'Powiat', 'OBJECT' 
GO
ALTER TABLE dbo.Powiat ADD CONSTRAINT
	PK_Powiat PRIMARY KEY CLUSTERED 
	(
	ID,
	StartDate
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Powiat', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Powiat', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Powiat', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.PowiatWojewodztwo ADD CONSTRAINT
	FK_PowiatWojewodztwo_Powiat1 FOREIGN KEY
	(
	IDPowiat,
	StartDatePowiat
	) REFERENCES dbo.Powiat
	(
	ID,
	StartDate
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.PowiatWojewodztwo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.PowiatWojewodztwo', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.PowiatWojewodztwo', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.PowiatWojewodztwo', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.GminaPowiat ADD CONSTRAINT
	FK_GminaPowiat_Powiat FOREIGN KEY
	(
	IDPowiat,
	StartDatePowiat
	) REFERENCES dbo.Powiat
	(
	ID,
	StartDate
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.GminaPowiat SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.GminaPowiat', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.GminaPowiat', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.GminaPowiat', 'Object', 'CONTROL') as Contr_Per 