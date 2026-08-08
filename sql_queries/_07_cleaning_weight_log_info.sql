
CREATE TABLE weight_log_info_merged_clean AS
SELECT DISTINCT
    TRIM(id) as id,
    TO_TIMESTAMP(date, 'MM-DD-YYYY HH24:MI:SS') AS weight_date,
    weight_kg,
    weight_pounds,
    fat,
    bmi,
    is_manual_report,
    TRIM(log_id) as log_id
FROM weight_log_info_merged
ORDER BY id, weight_date


-- testing

SELECT *
FROM weight_log_info_merged_clean