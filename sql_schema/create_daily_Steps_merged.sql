CREATE TABLE IF NOT EXISTS daily_steps_merged (
    id TEXT,
    activity_day VARCHAR(255),
    step_total INT

);

COPY daily_steps_merged
FROM  'C:\\Users\\Public\\Downloads\\dailySteps_merged.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8')