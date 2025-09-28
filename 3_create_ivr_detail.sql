CREATE TABLE ivr_detail AS
SELECT
    calls.ivr_id AS calls_ivr_id,
    calls.phone_number AS calls_phone_number,
    calls.ivr_result AS calls_ivr_result,
    calls.vdn_label AS calls_vdn_label,
    calls.start_date AS calls_start_date,
    TO_CHAR(calls.start_date, 'YYYYMMDD')::INT AS calls_start_date_ts,
    calls.end_date AS calls_end_date,
    TO_CHAR(calls.end_date, 'YYYYMMDD')::INT AS calls_end_date_ts,
    calls.total_duration AS calls_total_duration,
    calls.customer_segment AS calls_customer_segment,
    calls.ivr_language AS calls_ivr_language,
    calls.steps_module AS calls_steps_module,
    calls.module_aggregation AS calls_module_aggregation,
    modules.module_sequence AS module_sequence,
    modules.module_name AS module_name,
    modules.module_duration AS module_duration,
    modules.module_result AS module_result,
    steps.step_sequence AS step_sequence,
    steps.step_name AS step_name,
    steps.step_result AS step_result,
    steps.step_description_error AS step_description_error,
    calls.document_type AS document_type,
    calls.document_identification AS document_identification,
    calls.customer_phone AS customer_phone,
    calls.billing_account_id AS billing_account_id
FROM ivr_calls calls
LEFT JOIN ivr_modules modules
    ON calls.ivr_id = modules.ivr_id
LEFT JOIN ivr_steps steps
    ON modules.ivr_id = steps.ivr_id
   AND modules.module_sequence = steps.module_sequence;