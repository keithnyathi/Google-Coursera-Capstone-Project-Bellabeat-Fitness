-- Question
    -- Find the average daily user steps and segment them to aclasses according to their step count in order to find how mant users fall under
    -- very active , active and sedentary categories.

WITH base_table AS (
SELECT DISTINCT
    id,
    ROUND(AVG(step_total),0) as average_steps,
    CASE WHEN ROUND(AVG(step_total),0) >= 10_000 THEN 'very active user'
    WHEN ROUND(AVG(step_total),0) BETWEEN 7_000 AND 9_999 THEN 'active user'
    WHEN ROUND(AVG(step_total),0) BETWEEN 5_000 AND 6_999 THEN 'moderately active user'
    ELSE 'sedentary user'
    END AS user_class
FROM daily_steps_merged_clean
GROUP BY
    id
ORDER BY average_steps DESC
)

SELECT
    user_class,
    COUNT(user_class) as class_number,
    ROUND((COUNT(user_class) / 33.0),3) * 100 as class_pct
FROM base_table
GROUP BY
    user_class
ORDER BY class_number DESC


 /*

  Summary
  
 🔍Methodology

    - I classified average daily steps from the users according to their activity with less than 5000 steps being the lowest class(sedentary), 10000 and 
    above being the most active 
    - Used the preceeding table as a cte for the next table to then count how many users fall under each class for the total of 33 users
 💡
 Data Interpretation & Business Takeaway
  - 39% of users are active users i.e Their daily steps fall between 7000 and 9999 steps on average
  - 24% are sedentary users with thei steps averaging between 0 and just below 5000 steps
  - Very active users (those with average daily steps at or exceeding  10000) account for 21% of the dataset
  - Moderately active users, those with average daily steps between 5000 and 6999 makeup the lowest section in the dataset
  
  */