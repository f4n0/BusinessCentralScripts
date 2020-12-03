DECLARE @CostraintName NVARCHAR(100)

SET @CostraintName = 
'MDF_5EA3974024B7E94C58E8FD34A56041135A6E7C8ED3DD2175A52CEAAADA708FDF'

DECLARE @TableName NVARCHAR(100)

SET @TableName = (SELECT NAME
FROM sys.all_objects
WHERE  object_id = (SELECT parent_object_id
FROM sys.all_objects
WHERE  NAME = @CostraintName))


DECLARE @q nvarchar(max)
SET @q = 'ALTER TABLE ['+@tablename+'] 
            DROP CONSTRAINT ['+@CostraintName+'] '

EXEC(@q)
