CREATE TABLE daily_steps_merged_clean AS
SELECT DISTINCT
    TRIM(id) as id,
    TO_DATE(activity_day, 'MM-DD-YYYY') AS activity_date,
    step_total
FROM daily_steps_merged
ORDER BY id, activity_date

-- Testing

SELECT *
FROM daily_steps_merged_clean