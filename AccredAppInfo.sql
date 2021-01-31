USE [DB_6193_lrcadb]
GO

SELECT [AccreditationApplicationID] AppID
      ,[ApplicationTypeID] AppTypeID
      ,[AccreditationCategoryCode] AccrCatCode
	  ,[AssignedAccreditationNumber] AccrNum
      ,[AssignedAccreditationExpirationDate] AccrExpDate
      ,[ReferenceTableName] RefTableNm
      ,[ReferenceID] RefID
      ,a.[FirstName]
      ,a.[LastName]
      ,[ServiceProviderName]
      ,a.[EmailID] ApplicantEmailID
	  ,b.[EmailID] CreatedByEmailID
	  ,a.[CreatedBy] UserID
      ,[IsRenewal]
	  ,[Status]
      ,[StatusDate]
      ,a.[IsActive]
      ,[ApplicationSignedBy]
      ,[TitleOfSignatory]
      ,[SDATNumber]
  FROM [dbo].[AccreditationApplication] a,
  [dbo].[User] b
  where a.createdBy = b.UserID 
  --and AssignedAccreditationNumber is Not NULL
  order by AccreditationApplicationID desc

GO


