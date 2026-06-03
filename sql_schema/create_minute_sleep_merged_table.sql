-- Create table to load the table containing users' merged minute sleep data.

CREATE TABLE minute_sleep_merged(
    id TEXT,
    date VARCHAR(50),
    value  INT,
    log_id TEXT,

    PRIMARY KEY
)