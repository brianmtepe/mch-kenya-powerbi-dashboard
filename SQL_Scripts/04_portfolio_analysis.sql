USE mch_analytics;
SELECT*
FROM vw_national_mch_summary; 

# TOP 10 UNDER-5 MORTALITY COUNTIES
SELECT 
county_name,
under_5_mortality_rate,
under_5_risk_level
FROM vw_county_mch_kpis
ORDER BY under_5_mortality_rate DESC
LIMIT 10;

# TOP 10 MATERNAL MORTALITY COUNTIES
SELECT 
county_name,
maternal_mortality_ratio,
maternal_risk_level
FROM vw_county_mch_kpis
ORDER BY maternal_mortality_ratio DESC
LIMIT 10;

# TOP 10 LARGEST POSTNATAL CARE GAPS
SELECT
county_name,
pnc_gap_pct,
post_natal_care_48_hours
FROM vw_county_mch_kpis 
ORDER BY pnc_gap_pct DESC
LIMIT 10;

# TOP 10 LARGEST FACILITY DELIVERY GAPS
SELECT
county_name,
facility_delivery_gap_pct,
facility_delivery_pct
FROM vw_county_mch_kpis
ORDER BY facility_delivery_gap_pct DESC
LIMIT 10;

# PRIORITY COUNTIES FOR INTERVENTION
SELECT 
county_name,
priority_segment,
service_gap_score,
maternal_risk_level,
under_5_risk_level,
maternal_mortality_ratio,
under_5_mortality_rate
FROM vw_county_risk_segmentation
WHERE priority_segment<> 'Monitor'
ORDER BY service_gap_score DESC;

# MATERNAL MORTALITY RANKING
SELECT 
county_name,
maternal_mortality_ratio,
RANK() OVER(
ORDER BY maternal_mortality_ratio DESC
)AS mortality_rank
FROM vw_county_mch_kpis;

# POWER BI REPORTING VIEW
SELECT*
FROM vw_powerbi_mch_model
LIMIT 20;








