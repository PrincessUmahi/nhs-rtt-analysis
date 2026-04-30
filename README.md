# NHS Referral to Treatment (RTT) Waiting Times Analysis
### SQL Data Analysis Project | February 2026

## Project Overview
This project analyses publicly available NHS England Referral to Treatment (RTT) 
waiting times data for February 2026. Using MySQL and SQL querying, I explored 
waiting list pressures across specialties, providers, and regions — connecting 
my background in public health and NHS community engagement to practical 
data science skills.

**Data Source:** NHS England RTT Waiting Times Statistics 2025-26  
**Tool:** MySQL via DBeaver  
**Skills:** SQL, Database Design, Health Data Analysis

---

## Key Findings

- **70,091 patients** were on incomplete pathways (still waiting) in February 2026
- **General Surgery** had the highest waiting list with **17,309 patients**
- **Gynaecology** had the most patients breaching the 18-week NHS target — **6,688 patients**
- **35,074 new patients** joined the waiting list in February 2026
- **NHS Lancashire and South Cumbria** was the most pressured region with **127,224 patients** waiting
- **Buckshaw Hospital** had the best performance, treating **10,222 patients** within 18 weeks

---

## Questions Answered

| # | Question |
|---|----------|
| 1 | Which treatment specialties have the most patients currently waiting? |
| 2 | Which NHS providers have the highest total waiting patients? |
| 3 | What is the breakdown of pathway types across the dataset? |
| 4 | Which commissioner regions have the most patients waiting? |
| 5 | How many new RTT periods started in February 2026? |
| 6 | Which specialty has the most patients waiting over 52 weeks? |
| 7 | How do admitted vs non-admitted completed pathways compare by specialty? |
| 8 | Which provider has the best performance within 18 weeks? |
| 9 | Which commissioner regions have the highest incomplete pathways? |
| 10 | Which specialties have the most patients breaching the 18-week target? |

---

## Repository Structure

nhs-rtt-analysis/
│
├── nhs_rtt_queries.sql       ← All 10 SQL queries
│
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

---

## Why This Project

I worked directly with people affected by NHS waiting times during my time as a 
Community Engagement Practitioner at North London NHS Foundation Trust. I have 
seen first-hand how delays in treatment affect people's lives. This project 
combines that real-world context with my public health training and growing 
data skills to ask meaningful questions of real NHS data.

---

## About Me

**Adaeze (Princess) Umahi**  
Medical Doctor | MPH (University of Glasgow) | Aspiring Data Scientist  
Currently completing the Code First Girls CFGdegree Data Science programme  

[LinkedIn](https://www.linkedin.com/in/adaezeumahi/) | 
[GitHub](https://github.com/PrincessUmahi)
