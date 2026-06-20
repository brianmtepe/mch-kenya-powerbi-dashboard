CREATE DATABASE IF NOT EXISTS mch_analytics;
USE mch_analytics;

DROP TABLE IF EXISTS stg_mch_county_raw;
CREATE TABLE stg_mch_county_raw (
county VARCHAR (100),
skilled_birth_attendance_pct VARCHAR(20),
antenatal_4_visits_pct VARCHAR(20),
facility_delivery_pct VARCHAR(20),
post_natal_care_48_hours VARCHAR(20),
under_5_mortality_rate VARCHAR(20),
maternal_mortality_ratio VARCHAR(20),
maternal_risk_level VARCHAR(20),
under_5_risk_level VARCHAR(20)
);

SELECT COUNT(*) AS staged_rows
FROM stg_mch_county_raw;