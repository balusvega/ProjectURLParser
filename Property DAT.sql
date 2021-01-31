USE [DB_6193_lrcadb]
GO

SELECT [DATID]
      ,a.[PropertyNumber]
	  ,b.[PropertyNumber]
      ,a.[ConstructionYear]
	  ,e.BuildDate
	  ,d.[PersonID]
	  ,d.PersonTypeID
	  ,convert(varchar(max), d.UserID)+' - '+d.UserName 'UserID-Nm'
	  ,d.FirstName+' '+d.MiddleName+' '+d.LastName+' '+d.Suffix OwnerName
	  ,a.[AddressPrefix]+' '+a.[AddressNumber]+' '+a.[StreetName]+' '+a.[StreetType]+' '+a.[StreetSuffix]+' - '+a.[Zip5]+'-'+a.[Zip4]+' - '+a.[City] 'DAT-TblAddress'
	  ,b.[AddressPrefix]+' '+b.[AddressNumber]+' '+b.[StreetName]+' '+b.[StreetType]+' '+b.[StreetSuffix]+' - '+b.[Zip5]+'-'+b.[Zip4]+' - '+b.[City]+' - '+b.[County] PropertyTblAddress
	  ,e.PropertyNumber+' - '+e.UnitIdentification Unit
	  ,e.InspectionCertificateNumber InspCert#
      ,a.[CountyName]+' - '+c.CountyName County
      ,a.[StatusID]
  FROM [OLRR].[DAT] a, [OLRR].[Property] b, [OLRR].[County] c, [OLRR].[Person] d, [OLRR].[PropertyUnit] e
  where a.PropertyNumber = b.PropertyNumber AND b.PersonID = d.PersonID AND a.CountyName = c.CountyCode AND a.PropertyNumber = e.PropertyNumber
  order by PersonID desc
GO


