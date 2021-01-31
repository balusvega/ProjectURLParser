USE [DB_6193_lrcadb]
GO

SELECT [PropertyID]
      ,a.[PersonID]
	  ,b.[PersonID]
	  ,b.PersonTypeID
	  ,b.Email+' '+b.FirstName+' '+b.LastName OwnerName
      ,a.[TrackingID]
      ,a.[PropertyNumber]
      ,a.[AddressPrefix]+' '+a.[AddressNumber]+' '+a.[StreetName]+' '+a.[StreetType]+' '+a.[StreetSuffix]+' - '+a.[Zip5]+'-'+a.[Zip4]+' - '+a.[City]+' - '+a.[County] PropertyTblAddress
	  ,b.[AddressPrefix]+' '+b.[AddressNumber]+' '+b.[StreetName]+' '+b.[StreetType]+' '+b.[StreetSuffix]+' - '+b.[Zip5]+'-'+b.[Zip4]+' - '+b.[City] PersonTblAddress
      ,a.[StatusID]
      ,a.[DataFix]
      ,a.[SecTrackingID]
  FROM [OLRR].[Property] a, [OLRR].[Person] b
  where a.PersonID = b.PersonID

GO


