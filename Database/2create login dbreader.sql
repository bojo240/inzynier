USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [dbreader]    Script Date: 20.08.2020 23:54:10 ******/
CREATE LOGIN [dbreader] WITH PASSWORD=N'6pMGjYvuvKK8jrj5z/e8phBee689ue6sjHLgovBKXDM=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [dbreader] DISABLE
GO

