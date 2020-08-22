USE [Inzynier]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [dbreader]    Script Date: 20.08.2020 23:54:10 ******/
CREATE LOGIN [dbreader] WITH PASSWORD='dbreader', DEFAULT_DATABASE=[Inzynier], DEFAULT_LANGUAGE=[polish], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

--ALTER LOGIN [dbreader] DISABLE
--GO

