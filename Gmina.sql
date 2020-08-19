/*
   środa, 19 sierpnia 202019:58:00
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
CREATE TABLE dbo.Tmp_Gmina
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
ALTER TABLE dbo.Tmp_Gmina SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Gmina ON
GO
IF EXISTS(SELECT * FROM dbo.Gmina)
	 EXEC('INSERT INTO dbo.Tmp_Gmina (ID, Nazwa, Rodzaj, StartDate, EndDate, StartDateVerified, EndDateVerified, CzyDataPowstania, Opis)
		SELECT ID, Nazwa, Rodzaj, StartDate, EndDate, StartDateVerified, EndDateVerified, CzyDataPowstania, Opis FROM dbo.Gmina WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Gmina OFF
GO
ALTER TABLE dbo.GminaPowiat
	DROP CONSTRAINT FK_GminaPowiat_Gmina1
GO
ALTER TABLE dbo.GminaRelacja
	DROP CONSTRAINT FK_GminaRelacja_Gmina
GO
ALTER TABLE dbo.GminaRelacja
	DROP CONSTRAINT FK_GminaRelacja_Gmina1
GO
ALTER TABLE dbo.GminaWojewodztwo
	DROP CONSTRAINT FK_GminaWojewodztwo_Gmina
GO
DROP TABLE dbo.Gmina
GO
EXECUTE sp_rename N'dbo.Tmp_Gmina', N'Gmina', 'OBJECT' 
GO
ALTER TABLE dbo.Gmina ADD CONSTRAINT
	PK_Gmina_1 PRIMARY KEY CLUSTERED 
	(
	ID,
	StartDate
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Gmina', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Gmina', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Gmina', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.GminaWojewodztwo ADD CONSTRAINT
	FK_GminaWojewodztwo_Gmina FOREIGN KEY
	(
	IDGmina,
	StartDateGmina
	) REFERENCES dbo.Gmina
	(
	ID,
	StartDate
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.GminaWojewodztwo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.GminaWojewodztwo', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.GminaWojewodztwo', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.GminaWojewodztwo', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.GminaRelacja ADD CONSTRAINT
	FK_GminaRelacja_Gmina FOREIGN KEY
	(
	IDGmina_Old,
	Start_Date_Old
	) REFERENCES dbo.Gmina
	(
	ID,
	StartDate
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.GminaRelacja ADD CONSTRAINT
	FK_GminaRelacja_Gmina1 FOREIGN KEY
	(
	IDGmina_New,
	Start_Date_New
	) REFERENCES dbo.Gmina
	(
	ID,
	StartDate
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.GminaRelacja SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.GminaRelacja', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.GminaRelacja', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.GminaRelacja', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.GminaPowiat ADD CONSTRAINT
	FK_GminaPowiat_Gmina1 FOREIGN KEY
	(
	IDGmina,
	StartDateGmina
	) REFERENCES dbo.Gmina
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