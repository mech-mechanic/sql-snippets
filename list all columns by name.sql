SELECT
  sc.name AS 'Schema_Name',
  t.Name AS 'Table_Name',
  c.Name AS 'Column_Name'
FROM 
  sys.tables t 
  INNER JOIN sys.schemas sc ON t.schema_id = sc.schema_id
  INNER JOIN sys.columns c ON t.object_id = c.object_id
ORDER BY sc.Name, t.Name, c.column_id