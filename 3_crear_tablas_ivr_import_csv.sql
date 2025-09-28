CREATE TABLE ivr_calls (
    ivr_id VARCHAR(255),
    phone_number VARCHAR(255),
    ivr_result VARCHAR(255),
    vdn_label VARCHAR(255),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    total_duration INT,
    customer_segment VARCHAR(255),
    ivr_language VARCHAR(255),
    steps_module VARCHAR(255),
    module_aggregation VARCHAR(255),
    document_type VARCHAR(255),
    document_identification VARCHAR(255),
    customer_phone VARCHAR(255),
    billing_account_id VARCHAR(255)
);

CREATE TABLE ivr_modules (
    ivr_id VARCHAR(255),
    module_sequence INT,
    module_name VARCHAR(255),
    module_duration INT,
    module_result VARCHAR(255)
);

CREATE TABLE ivr_steps (
    ivr_id VARCHAR(255),
    module_sequence INT,
    step_sequence INT,
    step_name VARCHAR(255),
    step_result VARCHAR(255),
    step_description_error VARCHAR(255),
    document_type VARCHAR(50),
    document_identification VARCHAR(100),
    customer_phone VARCHAR(50),
    billing_account_id VARCHAR(50)
);