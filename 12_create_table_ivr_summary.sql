CREATE TABLE ivr_summary AS
SELECT DISTINCT ON (detail.calls_ivr_id)
  detail.calls_ivr_id AS ivr_id,
  detail.calls_phone_number AS phone_number,
  detail.calls_ivr_result AS ivr_result,
  detail.vdn_aggregation::VARCHAR(255) AS vdn_aggregation,
  detail.calls_start_date AS start_date,
  detail.calls_end_date AS end_date,
  detail.calls_total_duration AS total_duration,
  detail.calls_ivr_language AS ivr_language,
  detail.calls_customer_segment AS customer_segment,
  detail.calls_steps_module AS steps_module,
  detail.calls_module_aggregation AS module_aggregation,
  detail.document_type AS document_type,
  detail.document_identification AS document_identification,
  detail.customer_phone AS customer_phone,
  detail.billing_account_id AS billing_account_id,
  detail.masiva_lg AS masiva_lg,
  detail.info_by_phone_lg AS info_by_phone_lg,
  detail.info_by_dni_lg AS info_by_dni_lg,
  detail.repeated_phone_24H AS repeated_phone_24H,
  detail.cause_recall_phone_24H AS cause_recall_phone_24H
FROM ivr_detail detail
ORDER BY detail.calls_ivr_id, detail.calls_start_date DESC;