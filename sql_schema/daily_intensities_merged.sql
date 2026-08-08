CREATE TABLE IF NOT EXISTS daily_intensities_merged (
    id TEXT,
    activity_day VARCHAR(255),
    sendentary_minutes INT,
    lightly_active_minutes INT,
    fairly_active_minutes INT,
    very_active_minutes INT,
    sedentary_active_distance DECIMAL(15,9),
    light_active_distance DECIMAL(15,9),
    moderately_active_distance DECIMAL(15,9),
    very_active_distance DECIMAL(15,9)
);



COPY daily_intensities_merged
FROM  'C:\\Users\\Public\\Downloads\\dailyIntensities_merged.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8')