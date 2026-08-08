
CREATE TABLE sleep_day_merged_clean AS
SELECT DISTINCT
    TRIM(id) as id,
    TO_TIMESTAMP(sleep_day, 'MM-DD-YYYY HH24:MI:SS') AS sleep_day,
    total_sleep_records,
    total_minutes_asleep,
    total_time_in_bed
FROM sleep_day_merged
ORDER BY id, sleep_day


--Testing

SELECT *
FROM sleep_day_merged_clean