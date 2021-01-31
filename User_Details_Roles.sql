USE [DB_6193_lrcadb]
GO
declare  @secret varchar(max) = '9T27GMnvQhdWlONeDVQz5uj4z0HcJUgVpcBMKbi1vdvNGEjgfv/s2XlDnMuaV9SSDDultZkL0srA7R24n/j6uQ=='
SELECT a.[UserRoleID] UniqueID
      ,a.[UserID]
	  ,a.[RoleID]
	  ,b.RoleName
	  ,c.EmailID
	  ,(c.[FirstName])+' - '+(c.[LastName]) 'Fnm - Lnm'
	  ,dbo.fn_DECRYPT(@secret, convert(varbinary(max),[Password],1)) Pwd
	  ,dbo.fn_DECRYPT(@secret, [TempPassword]) TempPwd
	  ,dbo.fn_DECRYPT(@secret, convert(varbinary(max),[SSN],1)) SSN
	  ,dbo.fn_DECRYPT(@secret, convert(varbinary(max),[BirthDate],1)) DOB
	  ,d.ServiceProviderID
	  ,e.ServiceProviderName
      ,[TerminationDate]
      ,a.[IsActive]
  FROM [dbo].[UserRole] a, [dbo].[Role] b, [dbo].[User] c, [dbo].[ServiceProviderUserAffiliation] d, [dbo].[ServiceProvider] e
  where a.RoleID = b.RoleID and a.UserID = c.UserID and c.UserID = d.UserID and d.ServiceProviderID = e.ServiceProviderID
  order by UserID desc
GO