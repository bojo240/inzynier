USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [APIJSON]    Script Date: 20.08.2020 23:53:52 ******/
CREATE LOGIN [APIJSON] WITH PASSWORD=N'7N9efdQDVkSSW0BjcosIv8rQ2yfVCwift/M3rq6KLNE=', DEFAULT_DATABASE=[Inzynier], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [APIJSON] DISABLE
GO

