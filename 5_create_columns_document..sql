ALTER TABLE ivr_detail
ADD COLUMN document_type VARCHAR(50),
ADD COLUMN document_identification VARCHAR(150);

UPDATE ivr_detail detail
SET document_type = sub.document_type,
  document_identification = sub.document_identification
FROM (
  SELECT 
    ivr_id,
    MAX(document_type) AS document_type,
    MAX(document_identification) AS document_identification
  FROM ivr_steps steps
  GROUP BY ivr_id
) sub
WHERE detail.calls_ivr_id = sub.ivr_id;
