ALTER TABLE ivr_detail
 ADD COLUMN repeated_phone_24H BOOLEAN,
 ADD COLUMN cause_recall_phone_24H BOOLEAN ;

UPDATE ivr_detail detail
SET repeated_phone_24H=EXISTS(
  SELECT 1 
  FROM ivr_calls calls
  WHERE 
    calls.phone_number= detail.calls_phone_number
    AND calls.start_date 
    BETWEEN detail.calls_start_date - interval '1 day'
      AND detail.calls_start_date
      AND calls.ivr_id<>detail.calls_ivr_id
),
 cause_recall_phone_24H= EXISTS(
   SELECT 1 
   FROM ivr_calls c
   WHERE 
    c.phone_number = detail.calls_phone_number
    AND c.start_date 
      BETWEEN detail.calls_start_date
      AND detail.calls_start_date + INTERVAL '1 day'
      AND c.ivr_id <> detail.calls_ivr_id
);
