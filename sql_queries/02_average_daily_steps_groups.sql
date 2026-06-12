WITH steps_table AS(
SELECT
    COUNT(DISTINCT(id)) as users,
    AVG(total_steps) AS average_steps
FROM daily_activity_merged
)

SELECT
    users,
    CASE
        WHEN average_steps < 5000 THEN 'Sedentary'
        WHEN average_steps BETWEEN 7500 AND 9999 THEN 'Moderately Active'
        ELSE 'Active'
    END AS step_group
FROM steps_table
GROUP BY
    step_group, users