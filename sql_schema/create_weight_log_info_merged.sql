CREATE TABLE weight_log_info_merged (
    id VARCHAR(50),
    date VARCHAR(255),
    weight_kg DECIMAL(12,8),
    weight_pounds DECIMAL(12,7),
    fat INT,
    bmi DECIMAL(11,8),
    is_manual_report BOOLEAN,
    log_id VARCHAR(50),

    PRIMARY KEY (id, log_id)
    
    );

COPY weight_log_info_merged
FROM 'C:\\Users\\Public\\Downloads\\weightLogInfo_merged.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8')