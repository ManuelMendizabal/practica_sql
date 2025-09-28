ALTER TABLE ivr_detail
 ADD COLUMN info_by_phone_lg BOOLEAN;

UPDATE ivr_detail detail
SET info_by_phone_lg =EXISTS(
  SELECT 1
  FROM ivr_steps steps
  WHERE steps.ivr_id = detail.calls_ivr_id
   AND steps.step_result='OK'
   AND steps.step_name='CUSTOMERINFOBYPHONE.TX'
);
