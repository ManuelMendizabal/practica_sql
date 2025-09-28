ALTER TABLE ivr_detail
ADD COLUMN masiva_lg BOOLEAN ;

UPDATE ivr_detail detail
SET masiva_lg= EXISTS(
 SELECT 1
 FROM ivr_modules m
 WHERE m.ivr_id=detail.calls_ivr_id
   AND m.module_name = 'AVERIA_MASIVA'
);
