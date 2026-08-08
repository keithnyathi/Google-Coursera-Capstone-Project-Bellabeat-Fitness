-- Question?
    -- find the average weekly steps for the users in the data set, which days are they most active?


SELECT
    TO_CHAR(activity_date,'Day') as week,
    ROUND(AVG(step_total),2) as step_average
FROM daily_steps_merged_clean
WHERE step_total IS NOT NULL 
GROUP BY
    TO_CHAR(activity_date,'Day')
ORDER BY
    step_average DESC


 /*

  Summary
  
 🔍Methodology

    - I averaged the daily steps from all users in order to get a macro level understanding of the behavior of users during the week
    - I extracted the week data from the dates in order to do the comparison

 Data Interpretation & Business Takeaway
  - One thing to note is that since htese are averages/means...users who are very active likely inflate the averages
  -- and users who have very low activity will drga down the average.
  -- Saturdays, Tuesdays are visibly more active days from the user data
  -- Users maintain a 7400 - 7800 step count range during the week liekly to due to those days being work days
  -- Sunday is a rest day in  most cultures and therefore most users are seldom very active during this day.
  */
