# Maternal & Child Health (MCH) Dashboard — Kenya County Analysis

# Project Overview

This project presents a multi-page analytical dashboard examining Maternal and Child Health (MCH)indicators across Kenya's 47 counties. Developed from the perspective of a Registered Nurse(KRCHN), it transforms raw health data into a strategic 'Triage Tool' to identify mortality drivers and service delivery gaps.

# The Clinical Challenge
While facility delivery rates average 69.74%, the national Maternal Mortality Ratio remains a challenge at 475.87. This dashboard investigates the 'Continuum of Care' by identifying that postnatal Care (48hrs) is a critical systems leak, averaging only 57.45% coverage

# Dashboard Features
National Triage(Page 1): Heatmap-style matrix for rapid spatial pattern recognition across all 47 counties.
Risk Correlation(Page 2): Statistical scatter plot analysis proving the link between Skilled Birth Attendance and Under-5 Mortality.
Service Gap Diagnosis(Page 3): Matrix heatmap pinpointing exactly where counties fail to retain mothers post-delivery.
Interactive Controls: Synchronized county slicers and page navigators for a seamless 'App-like' experience.
Clean and consistent risk color logic:
 🟢 Low Risk
 🟡 Medium Risk
 🔴 High Risk
 
# Analytical Focus Areas
-Primary Metric: Under-5 Mortality Rate (per 1,000 live births).
-Risk Level Classification: Triage-based segmentation (Low/ Medium/ High). 
-Top 10 High-Burden Counties: Focused ranking (Meru and Siaya).
-KPI Benchmarks: National Averages for Antenatal Care, Facility Delivery, and Postnatal Care.
-Geographic Risk Visualization (Heatmap)

# Technical Stack
-Data Preparation: Python (Pandas) for cleaning DHIS2-style health data.
-BI Layer: Power BI (DAX,Conditional Formatting, Ranking Logic).
-Clinical Context: Health Informatics integration using nursing protocols.
-Version Control: Git/GitHub.

# Key Insights
1. System Leakage: Postnatal care within 48 hours is the weakest link in the maternal care cycle.
2. Mortality Drivers: High mortality counties(eg., Meru at 89/1000) consistently show a correlation with lower skilled birth attendance.
3. Regional Inequality: A cluster of 18'High-Risk' counties accounts for the majority of the national mortality burden.
4. Risk classification improves interpretability for intervention planning.

# Repository Structure
mch-kenya-powerbi-dashboard/
|
|── notebooks/          → Data generation & preprocessing
|── dashboard/          → Power BI (.pbix) dashboard file
|── images/             → Dashboard screenshots
|── documentation/      → Extended project explanation
|── data/               → Cleaned dataset (if included)
|── README.md           → Project overview

# Business & Clinical Relevance
The project simulates real-world health informatics scenarios common in NGOs(AMREF,CHAI),Government Health Departments, and Public Health Research Institutions:
- Resource Prioritization: Uses 'Top 10 High-Burden' ranking to guide budget allocation.
- Intervention Planning: Segments counties into risk tiers to determine the type of clinical support needed
- Data Integrity: Demostrates the ability to clean and transform DHIS2-style datasets into decision-support visuals

# Professional Positioning
This project serves as a portfolio piece for roles in Health Informatics, Monitering & Evaluation(M&E), and Public Health Research. It demonstrates:
-Clinical Authority: Applying KRCHN insights to data interpretation.
-Technical Proficiency: Advanced Power BI visual design and risk-based segmentation.
-Strategic thinking: Translating raw data into a 'Triage Tool' for policymakers.
-Communicate analytical findings clearly

# How to Use
Clone: git clone
[ [https://github.com/brianmtepe/mch-kenya-powerbi-dashboard] ].git

Open: Launch the .pbix file in Power BI Desktop.
Interact: Use the county slicers to view specific regional performance.
