
declare  @secret varchar(max) = '9T27GMnvQhdWlONeDVQz5uj4z0HcJUgVpcBMKbi1vdvNGEjgfv/s2XlDnMuaV9SSDDultZkL0srA7R24n/j6uQ=='
select 
UserID, [FirstName], [LastName], 
dbo.fn_DECRYPT(@secret, convert(varbinary(max),[Password],1)) Pwd,
dbo.fn_DECRYPT(@secret, [TempPassword]) TempPwd,
dbo.fn_DECRYPT(@secret, convert(varbinary(max),[SSN],1)) SSN,
dbo.fn_DECRYPT(@secret, convert(varbinary(max),[BirthDate],1)) DOB
from [dbo].[User]
order by UserID desc

