-- Create table to load the table containing users' merged minute sleep data.

CREATE TABLE sleep_day_merged (
    id TEXT,
    sleep_day VARCHAR(255),
    total_sleep_records  INT,
    total_minutes_asleep INT,
    total_time_in_bed INT,

    PRIMARY KEY (id, sleep_day)
);

COPY sleep_day_merged
FROM 'C:\\Users\\Public\\Downloads\\sleepDay_merged.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8' )

DROP TABLE sleep_day_merged