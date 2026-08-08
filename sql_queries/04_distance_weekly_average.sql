-- Question?
    -- What are the average distance covered by users and during which days of the week do they cover more distance


SELECT
    id,
    TO_CHAR(activity_date, 'Day') as day_of_week,
    EXTRACT(DOW from activity_date) as dow_num, 
    AVG(sedentary_active_distance + 
    light_active_distance + moderately_active_distance + very_active_distance) as average_distance

FROM daily_intensities_merged_clean
GROUP BY id, EXTRACT(DOW from activity_date),TO_CHAR(activity_date, 'Day') 
ORDER BY id,average_distance 
