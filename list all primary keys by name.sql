SELECT
  sc.name AS 'Schema_Name',
  o.Name AS 'Table_Name',
  i.Name AS 'Index_Name',
  c.Name AS 'Column_Name',
  ic.key_ordinal,
  i.type_desc AS 'Index_Type'
FROM 
  sys.indexes i
  INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
  INNER JOIN sys.columns c ON ic.object_id = c.object_id and ic.column_id = c.column_id
  INNER JOIN sys.objects o ON i.object_id = o.object_id
  INNER JOIN sys.schemas sc ON o.schema_id = sc.schema_id
WHERE 
  i.is_primary_key = 1
ORDER BY o.Name, i.Name, ic.key_ordinal