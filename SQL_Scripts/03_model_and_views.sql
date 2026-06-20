USE mch_analytics;
DROP TABLE IF EXISTS dim_county;
CREATE TABLE dim_county(
county_key INT AUTO_INCREMENT PRIMARY KEY,
county_name VARCHAR(100) NOT NULL UNIQUE
);
# LOAD COUNTIES
INSERT INTO dim_county(county_name)
SELECT DISTINCT TRIM(county)
FROM stg_mch_county_raw
WHERE county IS NOT NULL;
# VALIDATE
SELECT*
FROM dim_county;
SELECT COUNT(*) AS county_count
FROM dim_county;

# FACT TABLE
DROP TABLE IF EXISTS fact_mch_county_kpi;
CREATE TABLE fact_mch_county_kpi(
county_key INT NOT NULL,
skilled_birth_attendance_pct DECIMAL(5,2),
antenatal_4_visits_pct DECIMAL(5,2),
facility_delivery_pct DECIMAL(5,2),
post_natal_care_48_hours DECIMAL(5,2),
under_5_mortality_rate DECIMAL(6,2),
maternal_mortality_ratio DECIMAL(7,2),
maternal_risk_level VARCHAR(20),
under_5_risk_level VARCHAR(20),
PRIMARY KEY (county_key),
FOREIGN KEY (county_key)
REFERENCES dim_county(county_key)
);
INSERT INTO fact_mch_county_kpi(
county_key,
skilled_birth_attendance_pct,
antenatal_4_visits_pct,
facility_delivery_pct,
post_natal_care_48_hours,
under_5_mortality_rate,
maternal_mortality_ratio,
maternal_risk_level,
under_5_risk_level
)
SELECT
c.county_key,
CAST(r.skilled_birth_attendance_pct AS DECIMAL(5,2)),
CAST(r.antenatal_4_visits_pct AS DECIMAL(5,2)),
CAST(r.facility_delivery_pct AS DECIMAL(5,2)),
CAST(r.post_natal_care_48_hours AS DECIMAL(5,2)),
CAST(r.under_5_mortality_rate AS DECIMAL(6,2)),
CAST(r.maternal_mortality_ratio AS DECIMAL(7,2)),
TRIM(r.maternal_risk_level),
TRIM(r.under_5_risk_level)
FROM stg_mch_county_raw r
INNER JOIN dim_county c
ON TRIM(r.county)=c.county_name;
SELECT*
FROM fact_mch_county_kpi
LIMIT 10;
SELECT COUNT(*) AS facts_records
FROM fact_mch_county_kpi;

# COUNTY KPI VIEW
CREATE OR REPLACE VIEW vw_county_mch_kpis AS 
SELECT 
c.county_name,
f.skilled_birth_attendance_pct,
f.antenatal_4_visits_pct,
f.facility_delivery_pct,
f.post_natal_care_48_hours,
(100-f.facility_delivery_pct) AS facility_delivery_gap_pct,
(100-f.antenatal_4_visits_pct) AS anc_gap_pct,
(100-f.post_natal_care_48_hours) AS pnc_gap_pct,
f.under_5_mortality_rate,
f.maternal_mortality_ratio,
f.maternal_risk_level,
f.under_5_risk_level
FROM fact_mch_county_kpi f
INNER JOIN dim_county c
ON f.county_key=c.county_key;
SELECT*
FROM vw_county_mch_kpis
LIMIT 10;

# NATIONAL SUMMARY VIEW
CREATE OR REPLACE VIEW vw_national_mch_summary AS 
SELECT
COUNT(*) AS county_count,
ROUND(AVG(skilled_birth_attendance_pct),2) AS avg_skilled_birth_attendance_pct,
ROUND(AVG(antenatal_4_visits_pct),2) AS avg_anc_4_visits_pct,
ROUND(AVG(facility_delivery_pct),2) AS avg_facility_delivery_pct,
ROUND(AVG(post_natal_care_48_hours),2) AS avg_pnc_48_hours_pct,
ROUND(AVG(under_5_mortality_rate),2) AS avg_under5_mortality_rate,
ROUND(AVG(maternal_mortality_ratio),2) AS avg_maternal_mortality_ratio
FROM fact_mch_county_kpi;
SELECT*
FROM vw_national_mch_summary;

# RISK SEGMENTATION VIEWS
CREATE OR REPLACE VIEW vw_county_risk_segmentation AS 
SELECT
county_name,
skilled_birth_attendance_pct,
antenatal_4_visits_pct,
facility_delivery_pct,
post_natal_care_48_hours,
facility_delivery_gap_pct,
anc_gap_pct,
pnc_gap_pct,
under_5_mortality_rate,
maternal_mortality_ratio,
maternal_risk_level,
under_5_risk_level,
ROUND(
(
facility_delivery_gap_pct +
anc_gap_pct +
pnc_gap_pct
)/3,2) AS service_gap_score,
CASE 
WHEN maternal_risk_level='High'
AND under_5_risk_level='High'
THEN 'Dual Mortality Risk'
WHEN maternal_risk_level='High'
THEN 'Maternal Mortality Risk'
WHEN under_5_risk_level='High'
THEN 'Under-5 Mortality Risk'
WHEN (facility_delivery_gap_pct+
anc_gap_pct+
pnc_gap_pct
)/3>=35
THEN 'Service Coverage Gap'
ELSE 'Monitor'
END AS priority_segment
FROM vw_county_mch_kpis;
SELECT*
FROM vw_county_risk_segmentation
LIMIT 10;

# POWER BI REPORTING VIEW
CREATE OR REPLACE VIEW vw_powerbi_mch_model AS 
SELECT 
county_name,
skilled_birth_attendance_pct,
antenatal_4_visits_pct,
facility_delivery_pct,
post_natal_care_48_hours,
facility_delivery_gap_pct,
anc_gap_pct,
pnc_gap_pct,
under_5_mortality_rate,
maternal_mortality_ratio,
maternal_risk_level,
under_5_risk_level,
service_gap_score,
priority_segment
FROM vw_county_risk_segmentation;
SELECT*
FROM vw_powerbi_mch_model
LIMIT 10;




