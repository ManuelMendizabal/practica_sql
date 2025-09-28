ALTER TABLE ivr_detail
ADD COLUMN billing_account_id VARCHAR(50);

UPDATE ivr_detail detail
SET billing_account_id = sub.billing_account_id
FROM (
  SELECT 
    ivr_id,
    MAX(billing_account_id) AS billing_account_id
  FROM ivr_steps steps
  GROUP BY ivr_id
) sub
WHERE detail.calls_ivr_id = sub.ivr_id;
