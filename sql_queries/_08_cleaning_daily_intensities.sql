
CREATE TABLE daily_intensities_merged_clean AS
SELECT DISTINCT
    TRIM(id) as id,
    TO_DATE(activity_day, 'MM-DD-YYYY') AS activity_date,
    sendentary_minutes,
    lightly_active_minutes,
    fairly_active_minutes,
    very_active_minutes,
    sedentary_active_distance,
    light_active_distance,
    moderately_active_distance,
    very_active_distance
FROM daily_intensities_merged
ORDER BY id, activity_date


-- testing

SELECT *
FROM daily_intensities_merged_clean