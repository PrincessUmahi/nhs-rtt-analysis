NHS Referral to Treatment (RTT) Waiting Times Analysis
SQL Data Analysis Project | February 2026 | National (England-wide)
Project Overview
This project analyses the complete NHS England Referral to Treatment (RTT) waiting times dataset for February 2026, covering all integrated care board regions and provider trusts across England. Using MySQL and SQL querying, I explored waiting list pressures across specialties, providers, and regions — connecting my background in public health and NHS community engagement to practical data analysis skills.
Data Source: NHS England Consultant-led RTT Waiting Times — Full CSV data file, February 2026
Scale: 181,233 data rows · 43 commissioner regions · 514 provider trusts
Tools: MySQL · DBeaver
Skills: SQL · Large Dataset Handling · Health Data Analysis · Data Cleaning

Note on data quality: The NHS England raw dataset contains a built-in summary "Total" row (treatment function code C_999) alongside individual specialty rows. All queries explicitly exclude this using AND \Treatment Function Name` != 'Total'` to ensure accurate, non-duplicated results. Empty week-band cells are treated as zero. Identifying and handling this was a key part of the data cleaning process.


Key Findings

7,156,212 patients were on incomplete pathways (still waiting) across NHS England in February 2026
37.59% breach rate against the 18-week standard — roughly 2 in 5 patients waiting beyond 18 weeks (2,675,387 patients)
124,280 patients had been waiting 52 weeks or more
1,728,233 new RTT pathways started in February 2026
Trauma and Orthopaedic had the highest waiting list with 837,743 patients — and the most 18-week breaches (354,990) and the most 52-week-plus waiters (23,056)
NHS Greater Manchester was the most pressured region with 405,873 patients waiting
Mid and South Essex NHS Foundation Trust had the largest provider waiting list with 176,895 patients


Questions Answered
#Question1Which treatment specialties have the most patients currently waiting?2Which NHS providers have the highest total waiting patients?3What is the breakdown of pathway types across the dataset?4Which commissioner regions have the most patients waiting?5How many new RTT periods started in February 2026?6Which specialties have the most patients waiting 52 weeks or more?7How do admitted vs non-admitted completed pathways compare by specialty?8Which provider has the best performance within 18 weeks?9Which commissioner regions have the highest incomplete pathways?10Which specialties have the most patients breaching the 18-week target?

The Insight
The national backlog is concentrated in high-volume surgical and procedural specialties. Trauma & Orthopaedic, ENT, Gynaecology and Ophthalmology together account for the bulk of both the total waiting list and the 18-week breaches — this is primarily a volume and capacity problem in elective surgical pathways, not a single-specialty anomaly.
Long waits of 52 weeks or more (124,280 patients nationally) are spread across many specialties rather than concentrated in one, led by Trauma & Orthopaedic (23,056), ENT (15,490) and Gynaecology (13,160). This points to system-wide elective capacity pressure rather than an isolated bottleneck, which matters for how capacity and workforce are prioritised nationally.

Repository Structure
nhs-rtt-analysis/
├── nhs_rtt_queries.sql
├── README.md
└── results/
    ├── query1_specialties_most_waiting.csv
    ├── query2_providers_most_waiting.csv
    ├── query3_pathway_breakdown.csv
    ├── query4_commissioner_regions.csv
    ├── query5_new_rtt_periods.csv
    ├── query6_over_52_weeks.csv
    ├── query7_admitted_vs_nonadmitted.csv
    ├── query8_best_performance.csv
    ├── query9_commissioner_incomplete.csv
    └── query10_18_week_breach.csv

Why This Project
I worked directly with people affected by NHS waiting times during my time as a Community Engagement Practitioner at North London NHS Foundation Trust. I have seen first-hand how delays in treatment affect people's lives. This project combines that real-world context with my public health training and data skills to ask meaningful questions of real, national NHS data.

About Me
Adaeze (Princess) Umahi
Data Analyst | MPH — Epidemiology, Biostatistics & Data Science (University of Glasgow) | MBBS
SQL · Python · R · Power BI · Tableau · Microsoft Dynamics 365
Google Data Analytics Certified | Code First Girls & DataCamp — SQL, Python, AI & Machine Learning | Data Analyst with Python (DataCamp) | Machine Learning Fundamentals (DataCamp)
Building a portfolio at the intersection of health data, business intelligence and real-world analytical impact.
LinkedIn | GitHub
