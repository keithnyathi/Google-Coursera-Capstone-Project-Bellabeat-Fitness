-- Question 
    -- What days are most users active on, what days are they least active on average
    -- How many users are most active on which days and least active on which days and does that tally with the previous group average

WITH base_table AS (
SELECT
    id,
    TO_CHAR(activity_date,'Day') as day_of_week,
    EXTRACT(DOW from activity_date) as dow_num,
    ROUND(AVG(step_total),2) as step_average,
    ROW_NUMBER() OVER(PARTITION BY id ORDER BY ROUND(AVG(step_total),2) DESC ) as max_rank,
    ROW_NUMBER() OVER(PARTITION BY id ORDER BY ROUND(AVG(step_total),2) ASC) as min_rank
FROM daily_steps_merged_clean
WHERE step_total IS NOT NULL
GROUP BY    id,day_of_week, dow_num

)
SELECT
    day_of_week,
    COUNT(CASE WHEN max_rank = 1 THEN 1 END) AS users_most_active,
    COUNT(CASE WHEN min_rank = 1 THEN 1 END) AS users_least_active
FROM base_table
GROUP BY day_of_week, dow_num
ORDER BY dow_num 

 /*

  Summary
  
🔍 Methodology

 - Created a CTE (base_table) to calculate each user’s average step count by day of the week, applying dual window functions (ROW_NUMBER()) to rank their most active (max_rank = 1) and least active (min_rank = 1) days.

 - Aggregated the results to count the distribution of peak vs. rest days across the entire user base, validating whether individual behavior aligns with aggregate group averages.

📊 Data Interpretation

 - Tuesday is the Clear Activity Peak: Aligned with the group average trend, 
   Tuesday sees the highest concentration of peak user activity (8 users reach their maximum steps, while only 2 hit their minimum). 
   This confirms Tuesday's high group average is driven by broad user participation rather than single-user outliers.

 - Thursday & Sunday are Core Rest Days: Thursday records the highest count of inactive users (8 users at minimum steps), followed closely by Sunday (7 users).

 - The Saturday Polarizing Effect: Saturday exhibits a split persona—7 users reach their peak step counts, while 3 hit their lowest.
 This indicates distinct user archetypes (active "weekend warriors" vs. sedentary weekend resters).

🗃️ Business Takeaways & Recommendations

 - In-App Engagement & Push Notifications: 
   Schedule motivational prompts or step challenges on Thursday mornings and Sunday afternoons to encourage movement when user engagement naturally slumps.

 - Feature Tailoring: 
   Leverage Tuesday as the primary day for introducing new workout challenges or feature announcements, as user activity and app interaction are at their highest. 
*/