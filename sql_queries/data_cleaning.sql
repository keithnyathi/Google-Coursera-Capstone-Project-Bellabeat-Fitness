SELECT
    DISTINCT(TRIM(id)) AS cleaned_id,
    TO_DATE(activity_date, 'MM/DD/YYYY') as cleaned_date
FROM daily_activity_merged

