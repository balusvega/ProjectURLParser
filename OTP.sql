USE [DB_6193_lrcadb]
GO

SELECT [Id]
      ,[UserId]
      ,[OTP]
      ,[Token]
      ,[Timestamp]
      ,[Status]
  FROM [dbo].[OTPLog]
  order by 1 desc

GO


