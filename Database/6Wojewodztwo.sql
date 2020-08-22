/*
   środa, 19 sierpnia 202019:58:50
   User: 
   Server: DESKTOP-BQPOPVS
   Database: Inzynier
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
USE [Inzynier]
GO
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
CREATE TABLE dbo.Tmp_Wojewodztwo
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
ALTER TABLE dbo.Tmp_Wojewodztwo SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Wojewodztwo ON
GO
IF EXISTS(SELECT * FROM dbo.Wojewodztwo)
	 EXEC('INSERT INTO dbo.Tmp_Wojewodztwo (ID, Nazwa, Rodzaj, StartDate, EndDate, StartDateVerified, EndDateVerified, CzyDataPowstania, Opis)
		SELECT ID, Nazwa, Rodzaj, StartDate, EndDate, StartDateVerified, EndDateVerified, CzyDataPowstania, Opis FROM dbo.Wojewodztwo WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Wojewodztwo OFF
GO
ALTER TABLE dbo.GminaWojewodztwo
	DROP CONSTRAINT FK_GminaWojewodztwo_Wojewodztwo
GO
ALTER TABLE dbo.PowiatWojewodztwo
	DROP CONSTRAINT FK_PowiatWojewodztwo_Wojewodztwo1
GO
DROP TABLE dbo.Wojewodztwo
GO
EXECUTE sp_rename N'dbo.Tmp_Wojewodztwo', N'Wojewodztwo', 'OBJECT' 
GO
ALTER TABLE dbo.Wojewodztwo ADD CONSTRAINT
	PK_Wojewodztwo_1 PRIMARY KEY CLUSTERED 
	(
	ID,
	StartDate
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Wojewodztwo', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Wojewodztwo', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Wojewodztwo', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.PowiatWojewodztwo ADD CONSTRAINT
	FK_PowiatWojewodztwo_Wojewodztwo1 FOREIGN KEY
	(
	IDWojewodztwo,
	StartDateWojewodztwo
	) REFERENCES dbo.Wojewodztwo
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
ALTER TABLE dbo.GminaWojewodztwo ADD CONSTRAINT
	FK_GminaWojewodztwo_Wojewodztwo FOREIGN KEY
	(
	IDWojewodztwo,
	StartDateWojewodztwo
	) REFERENCES dbo.Wojewodztwo
	(
	ID,
	StartDate
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.GminaWojewodztwo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.GminaWojewodztwo', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.GminaWojewodztwo', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.GminaWojewodztwo', 'Object', 'CONTROL') as Contr_Per 