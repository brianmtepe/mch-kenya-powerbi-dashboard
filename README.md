## Maternal & Child Health (MCH) Dashboard — Kenya County Analysis

## Project Overview
This project presents a county-level analytical dashboard examining Maternal and Child Health (MCH) indicators across Kenya, with a primary focus on Under-5 Mortality Rates, risk distribution, and regional disparities.
The objective is to transform structured health data into an interactive decision-support tool that enables:
-Identification of high-risk counties
-Comparative regional performance analysis
-Mortality trend prioritization
-Policy-focused health insights
The dashboard is designed for use by health analysts, NGOs, policymakers, and development agencies.

## Analytical Focus Areas

Under-5 Mortality Rate (primary metric)
Risk Level Classification (Low / Medium / High)
County-Level Performance Distribution
Top 10 High-Burden Counties
KPI Summary Metrics (Averages & Comparative Benchmarks)
Geographic Risk Visualization (Heatmap)

## Dashboard Features

Interactive county selection slicer
Conditional formatting for risk categorization
Heatmap-style matrix for spatial pattern recognition
Dynamic Top 10 ranking visualization
KPI cards displaying average mortality indicators
Clean and consistent risk color logic:
 🟢 Low Risk
 🟡 Medium Risk
 🔴 High Risk

## Key Insights

A small cluster of counties accounts for disproportionately high under-5 mortality.
High-risk counties exhibit geographic concentration patterns.
Mortality levels vary significantly across counties, highlighting regional inequality.
Risk classification improves interpretability for intervention planning.

## Technical Stack

Data Preparation
-Python (Jupyter Notebooks)
-Pandas for transformation and cleaning
Business Intelligence
Power BI
 -DAX measures
 -Conditional formatting
 -Matrix heatmaps
 -Ranking logic (Top N filtering)
 -KPI card metrics

Version Control
 Git
 GitHub

## Repository Structure

mch-kenya-powerbi-dashboard/
|
|── notebooks/          → Data generation & preprocessing
|── dashboard/          → Power BI (.pbix) dashboard file
|── images/             → Dashboard screenshots
|── documentation/      → Extended project explanation
|── data/               → Cleaned dataset (if included)
|── README.md           → Project overview

## How to Reproduce the Project
Clone the repository:
 git clone
[ [https://github.com/brianmtepe/mch-kenya-powerbi-dashboard] ].git

Run notebooks inside the notebooks/ folder to generate the cleaned dataset.
Open the .pbix file located in the dashboard/ directory.
Load the cleaned dataset into Power BI.
Interact with filters and visuals to explore county-level insights.

## Business Relevance

This dashboard demonstrates:
-Data cleaning and transformation inside BI layer
-Risk-based categorization for public health interpretation
-Insight-driven visualization design
-Analytical prioritization using ranking logic
-Clear executive-level reporting structure

The project simulates real-world health analytics scenarios common in:
 Government health departments
 NGOs
 Public health research institutions
 Development programs

## Dashboard Preview

![Dashboard Overview](Images/MCH COUNTY DASHBOARD.png)

** Professional Positioning
This project demonstrates the ability to:
-Translate raw structured data into actionable insights
-Design clean and interpretable dashboards
-Apply conditional formatting strategically
-Build decision-support tools for policy contexts
-Communicate analytical findings clearly
