ALTER TABLE ivr_detail
ADD COLUMN info_by_dni_lg BOOLEAN;

UPDATE ivr_detail detail
 SET info_by_dni_lg=EXISTS (
   SELECT 1
   FROM ivr_steps stp
   WHERE stp.ivr_id= detail.calls_ivr_id
   AND stp.step_name='CUSTOMERINFOBYDNI.TX'
   AND stp.step_result = 'OK'
 );
