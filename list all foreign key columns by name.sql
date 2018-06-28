SELECT
  fk.constraint_object_id as 'object_id',
  sp.name as 'parent_schema_name',
  tp.name as 'parent_table_name',
  cp.name as 'parent_column_name',
  sr.name as 'parent_schema_name',
  tr.name as 'referenced_table_name',
  cr.name as 'referenced_column_name'
FROM
  sys.foreign_key_columns fk
  inner join sys.tables tp on fk.parent_object_id = tp.object_id
  inner join sys.tables tr on fk.referenced_object_id = tr.object_id
  inner join sys.schemas sp on tp.schema_id = sp.schema_id
  inner join sys.schemas sr on tr.schema_id = sr.schema_id
  inner join sys.columns cp on fk.parent_column_id = cp.column_id and fk.parent_object_id = cp.object_id
  inner join sys.columns cr on fk.referenced_column_id = cr.column_id and fk.referenced_object_id = cr.object_id
