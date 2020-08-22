USE [Inzynier]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [APIJSON]    Script Date: 20.08.2020 23:53:52 ******/
CREATE LOGIN [APIJSON] WITH PASSWORD='APIJSON', DEFAULT_DATABASE=[Inzynier], DEFAULT_LANGUAGE=[polish], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

--ALTER LOGIN [APIJSON] DISABLE
--GO

