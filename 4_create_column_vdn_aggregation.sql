ALTER TABLE ivr_detail
ADD COLUMN vdn_aggregation VARCHAR(20);

UPDATE ivr_detail
SET vdn_aggregation = CASE
  WHEN calls_vdn_label LIKE 'ATC%' THEN 'FRONT'
  WHEN calls_vdn_label LIKE 'TECH%' THEN 'TECH'
  WHEN calls_vdn_label = 'ABSORPTION' THEN 'ABSORPTION'
  ELSE 'OTHERS'
END