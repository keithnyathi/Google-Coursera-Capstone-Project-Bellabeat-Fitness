-- Question 
-- What percentage of the user's recorded time is spent sedentary vs active?

SELECT
    DISTINCT(id),
    AVG (ROUND((sedentary_minutes/((very_active_minutes + fairly_active_minutes + lightly_active_minutes
    + sedentary_minutes) * 1.0)), 2)  * 100 ) AS sedentary_active_ratio
FROM daily_activity_merged
GROUP BY
    DISTINCT(id)
ORDER BY    
    sedentary_active_ratio DESC


/*

   Summary
  
 🔍Methodology

    - Selected for distinct user ids in order to calculate the average sedentary to active ratio
 📊Key Metrics 
    - All users in the dataset spend more than 50% of the their time sedentary

 💡Data Interpretation & Business Takeaway
  -
  
  */
