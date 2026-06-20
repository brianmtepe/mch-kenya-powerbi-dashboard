USE mch_analytics;
# COUNTY COUNT
SELECT COUNT(*) AS county_count
FROM stg_mch_county_raw;

# DUPLICATE COUNTIES
SELECT county, 
 COUNT(*) AS row_count
FROM stg_mch_county_raw
GROUP BY county
HAVING COUNT(*)>1;

# MISSING VALUES
SELECT * 
FROM stg_mch_county_raw
WHERE county IS NULL
OR skilled_birth_attendance_pct IS NULL
OR antenatal_4_visits_pct IS NULL
OR facility_delivery_pct IS NULL
OR post_natal_care_48_hours IS NULL
OR under_5_mortality_rate IS NULL
OR maternal_mortality_ratio IS NULL
OR maternal_risk_level IS NULL
OR under_5_risk_level IS NULL;

# PERCENTAGE VALIDATION
SELECT *
FROM stg_mch_county_raw
WHERE CAST(skilled_birth_attendance_pct AS DECIMAL(5,2)) NOT BETWEEN 0 AND 100
OR CAST(antenatal_4_visits_pct AS DECIMAL (5,2)) NOT BETWEEN 0 AND 100
OR CAST(facility_delivery_pct AS DECIMAL(5,2)) NOT BETWEEN 0 AND 100
OR CAST(post_natal_care_48_hours AS DECIMAL(5,2)) NOT BETWEEN 0 AND 100; 



