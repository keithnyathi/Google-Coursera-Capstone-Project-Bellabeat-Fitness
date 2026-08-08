CREATE TABLE daily_calories_merged_clean AS
SELECT DISTINCT
    TRIM(id) as id,
    TO_DATE(activity_day, 'MM-DD-YYYY') as activity_date,
    calories
FROM daily_calories_merged
ORDER BY id,activity_date 


-- testing 
SELECT * 
FROM daily_calories_merged_clean