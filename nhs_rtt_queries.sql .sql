USE nhs_rtt_analysis;

-- Query 1: Which specialties have the most patients waiting?
SELECT 
    `Treatment Function Name`,
    SUM(`Total All`) AS total_patients_waiting
FROM 20260228_RTT_February
WHERE `RTT Part Description` = 'Incomplete Pathways'
GROUP BY `Treatment Function Name`
ORDER BY total_patients_waiting DESC
LIMIT 20;

-- Query 2: Which NHS providers have the most patients waiting?
SELECT 
    `Provider Org Name`,
    SUM(`Total All`) AS total_patients_waiting
FROM 20260228_RTT_February
WHERE `RTT Part Description` = 'Incomplete Pathways'
GROUP BY `Provider Org Name`
ORDER BY total_patients_waiting DESC
LIMIT 20;


-- Query 3: What is the breakdown of pathway types?
SELECT 
    `RTT Part Description`,
    COUNT(*) AS number_of_records,
    SUM(`Total All`) AS total_patients
FROM 20260228_RTT_February
GROUP BY `RTT Part Description`
ORDER BY total_patients DESC;

-- Query 4: Which commissioner regions have the most patients waiting?
SELECT 
    `Commissioner Parent Name`,
    SUM(`Total All`) AS total_waiting
FROM 20260228_RTT_February
WHERE `RTT Part Description` = 'Incomplete Pathways'
GROUP BY `Commissioner Parent Name`
ORDER BY total_waiting DESC
LIMIT 15;

-- Query 5: How many new RTT periods started in February 2026?
SELECT 
    SUM(`Total All`) AS new_rtt_periods_started
FROM 20260228_RTT_February
WHERE `RTT Part Description` = 'New RTT Periods - All Patients';

-- Query 6: Which specialty has the most patients waiting over 52 weeks?
SELECT 
    `Treatment Function Name`,
    SUM(`Gt 52 To 53 Weeks SUM 1`) AS waiting_over_52_weeks
FROM 20260228_RTT_February
WHERE `RTT Part Description` = 'Incomplete Pathways'
GROUP BY `Treatment Function Name`
ORDER BY waiting_over_52_weeks DESC
LIMIT 15;

-- Query 7: Admitted vs Non-Admitted completed pathways by specialty
SELECT 
    `Treatment Function Name`,
    `RTT Part Description`,
    SUM(`Total All`) AS total_patients
FROM 20260228_RTT_February
WHERE `RTT Part Description` IN (
    'Completed Pathways For Admitted Patients',
    'Completed Pathways For Non-Admitted Patients'
)
GROUP BY `Treatment Function Name`, `RTT Part Description`
ORDER BY `Treatment Function Name`, `RTT Part Description`;

-- Query 8: Which provider has the best performance within 18 weeks?
SELECT 
    `Provider Org Name`,
    SUM(`Gt 00 To 01 Weeks SUM 1` + `Gt 01 To 02 Weeks SUM 1` + 
        `Gt 02 To 03 Weeks SUM 1` + `Gt 03 To 04 Weeks SUM 1` +
        `Gt 04 To 05 Weeks SUM 1` + `Gt 05 To 06 Weeks SUM 1` +
        `Gt 06 To 07 Weeks SUM 1` + `Gt 07 To 08 Weeks SUM 1` +
        `Gt 08 To 09 Weeks SUM 1` + `Gt 09 To 10 Weeks SUM 1` +
        `Gt 10 To 11 Weeks SUM 1` + `Gt 11 To 12 Weeks SUM 1` +
        `Gt 12 To 13 Weeks SUM 1` + `Gt 13 To 14 Weeks SUM 1` +
        `Gt 14 To 15 Weeks SUM 1` + `Gt 15 To 16 Weeks SUM 1` +
        `Gt 16 To 17 Weeks SUM 1` + `Gt 17 To 18 Weeks SUM 1`
    ) AS seen_within_18_weeks
FROM 20260228_RTT_February
WHERE `RTT Part Description` IN (
    'Completed Pathways For Admitted Patients',
    'Completed Pathways For Non-Admitted Patients'
)
GROUP BY `Provider Org Name`
ORDER BY seen_within_18_weeks DESC
LIMIT 15;

-- Query 9: Which commissioner regions have the highest incomplete pathways?
SELECT 
    `Commissioner Parent Name`,
    `Commissioner Org Name`,
    SUM(`Total All`) AS incomplete_pathways_total
FROM 20260228_RTT_February
WHERE `RTT Part Description` = 'Incomplete Pathways'
GROUP BY `Commissioner Parent Name`, `Commissioner Org Name`
ORDER BY incomplete_pathways_total DESC
LIMIT 20;

-- Query 10: Which specialties have the most patients breaching the 18 week target?
SELECT 
    `Treatment Function Name`,
    SUM(`Total All`) AS total_waiting,
    SUM(`Gt 00 To 01 Weeks SUM 1` + `Gt 01 To 02 Weeks SUM 1` + 
        `Gt 02 To 03 Weeks SUM 1` + `Gt 03 To 04 Weeks SUM 1` +
        `Gt 04 To 05 Weeks SUM 1` + `Gt 05 To 06 Weeks SUM 1` +
        `Gt 06 To 07 Weeks SUM 1` + `Gt 07 To 08 Weeks SUM 1` +
        `Gt 08 To 09 Weeks SUM 1` + `Gt 09 To 10 Weeks SUM 1` +
        `Gt 10 To 11 Weeks SUM 1` + `Gt 11 To 12 Weeks SUM 1` +
        `Gt 12 To 13 Weeks SUM 1` + `Gt 13 To 14 Weeks SUM 1` +
        `Gt 14 To 15 Weeks SUM 1` + `Gt 15 To 16 Weeks SUM 1` +
        `Gt 16 To 17 Weeks SUM 1` + `Gt 17 To 18 Weeks SUM 1`
    ) AS within_18_weeks,
    SUM(`Total All`) - SUM(`Gt 00 To 01 Weeks SUM 1` + `Gt 01 To 02 Weeks SUM 1` + 
        `Gt 02 To 03 Weeks SUM 1` + `Gt 03 To 04 Weeks SUM 1` +
        `Gt 04 To 05 Weeks SUM 1` + `Gt 05 To 06 Weeks SUM 1` +
        `Gt 06 To 07 Weeks SUM 1` + `Gt 07 To 08 Weeks SUM 1` +
        `Gt 08 To 09 Weeks SUM 1` + `Gt 09 To 10 Weeks SUM 1` +
        `Gt 10 To 11 Weeks SUM 1` + `Gt 11 To 12 Weeks SUM 1` +
        `Gt 12 To 13 Weeks SUM 1` + `Gt 13 To 14 Weeks SUM 1` +
        `Gt 14 To 15 Weeks SUM 1` + `Gt 15 To 16 Weeks SUM 1` +
        `Gt 16 To 17 Weeks SUM 1` + `Gt 17 To 18 Weeks SUM 1`
    ) AS waiting_over_18_weeks
FROM 20260228_RTT_February
WHERE `RTT Part Description` = 'Incomplete Pathways'
GROUP BY `Treatment Function Name`
ORDER BY waiting_over_18_weeks DESC
LIMIT 20;