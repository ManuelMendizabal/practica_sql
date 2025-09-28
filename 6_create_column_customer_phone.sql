ALTER TABLE ivr_detail
ADD COLUMN customer_phone VARCHAR(30);

UPDATE ivr_detail detail
SET customer_phone=sub.customer_phone
FROM (
  SELECT 
    ivr_id,
    MAX(customer_phone) AS customer_phone
  FROM ivr_steps steps
  GROUP BY ivr_id
) sub
WHERE detail.calls_ivr_id = sub.ivr_id;