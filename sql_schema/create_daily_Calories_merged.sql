-- Create the table and load the csv containing the daily calories entries

CREATE TABLE IF NOT EXISTS daily_calories_merged (
    id TEXT,
    activity_day VARCHAR(255),
    calories INT
);


COPY daily_calories_merged
FROM 'C:\\Users\\Public\\Downloads\\dailyCalories_merged.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8')

