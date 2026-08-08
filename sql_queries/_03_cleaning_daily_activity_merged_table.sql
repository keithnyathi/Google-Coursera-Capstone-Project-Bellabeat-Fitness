CREATE TABLE daily_activity_merged_clean AS 
SELECT DISTINCT
    TRIM(id) as id,
    TO_DATE(activity_date, 'MM-DD-YYYY') as activity_date,
    total_steps,
    total_distance,
    tracker_distance,
    logged_activities_distance,
    very_active_distance,
    moderately_active_distance,
    light_active_distance,
    sedentary_active_distance,
    very_active_minutes,
    fairly_active_minutes,
    lightly_active_minutes,
    sedentary_minutes,
    calories
FROM daily_activity_merged
ORDER BY id,activity_date


SELECT *
FROM daily_activity_merged_clean