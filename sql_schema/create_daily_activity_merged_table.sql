
-- Create table to load the csv containing users' merged daily activity data

CREATE TABLE daily_activity_merged(
    id TEXT,
    activity_date VARCHAR(255),
    total_steps INT,
    total_distance DECIMAL(15,9),
    tracker_distance DECIMAL(15,9),
    logged_activities_distance DECIMAL(15,9),
    very_active_distance DECIMAL(15,9),
    moderately_active_distance DECIMAL(15,9),
    light_active_distance DECIMAL(15,9),
    sedentary_active_distance DECIMAL(15,9),
    very_active_minutes INT,
    fairly_active_minutes INT,
    lightly_active_minutes INT,
    sedentary_minutes INT,
    calories INT,

   PRIMARY KEY(id,activity_date)
);

COPY daily_activity_merged
FROM 'C:\\Users\\Public\\Downloads\\dailyActivity_merged.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8')

