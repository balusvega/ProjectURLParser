Select tab.name, col.name, type.name, col.max_length from sys.objects tab, sys.columns col, sys.types type
where 
tab.object_id = col.object_id 
and
tab.type_desc = 'USER_TABLE'
and
col.system_type_id = type.system_type_id
and
col.user_type_id = type.user_type_id
order by tab.object_id, col.column_id