USE nhs_rtt_analysis;

-- Query 1: Which specialties have the most patients waiting?
SELECT 
    `Treatment Function Name`,
    SUM(`Total All`) AS total_patients_waiting
FROM `20260228_RTT_February`
WHERE `RTT Part Description` = 'Incomplete Pathways'
AND `Treatment Function Name` != 'Total'
GROUP BY `Treatment Function Name`
ORDER BY total_patients_waiting DESC
LIMIT 20;

-- Query 2: Which NHS providers have the most patients waiting?
SELECT 
    `Provider Org Name`,
    SUM(`Total All`) AS total_patients_waiting
FROM `20260228_RTT_February`
WHERE `RTT Part Description` = 'Incomplete Pathways'
AND `Treatment Function Name` != 'Total'
GROUP BY `Provider Org Name`
ORDER BY total_patients_waiting DESC
LIMIT 20;

-- Query 3: What is the breakdown of pathway types?
SELECT 
    `RTT Part Description`,
    COUNT(*) AS number_of_records,
    SUM(`Total All`) AS total_patients
FROM `20260228_RTT_February`
WHERE `Treatment Function Name` != 'Total'
GROUP BY `RTT Part Description`
ORDER BY total_patients DESC;

-- Query 4: Which commissioner regions have the most patients waiting?
SELECT 
    `Commissioner Parent Name`,
    SUM(`Total All`) AS total_waiting
FROM `20260228_RTT_February`
WHERE `RTT Part Description` = 'Incomplete Pathways'
AND `Treatment Function Name` != 'Total'
GROUP BY `Commissioner Parent Name`
ORDER BY total_waiting DESC
LIMIT 15;

-- Query 5: How many new RTT periods started in February 2026?
SELECT 
    SUM(`Total All`) AS new_rtt_periods_started
FROM `20260228_RTT_February`
WHERE `RTT Part Description` = 'New RTT Periods - All Patients'
AND `Treatment Function Name` != 'Total';

-- Query 6: Which specialty has the most patients waiting over 52 weeks?
SELECT 
    `Treatment Function Name`,
    SUM(
        `Gt 52 To 53 Weeks SUM 1` + `Gt 53 To 54 Weeks SUM 1` + `Gt 54 To 55 Weeks SUM 1` +
        `Gt 55 To 56 Weeks SUM 1` + `Gt 56 To 57 Weeks SUM 1` + `Gt 57 To 58 Weeks SUM 1` +
        `Gt 58 To 59 Weeks SUM 1` + `Gt 59 To 60 Weeks SUM 1` + `Gt 60 To 61 Weeks SUM 1` +
        `Gt 61 To 62 Weeks SUM 1` + `Gt 62 To 63 Weeks SUM 1` + `Gt 63 To 64 Weeks SUM 1` +
        `Gt 64 To 65 Weeks SUM 1` + `Gt 65 To 66 Weeks SUM 1` + `Gt 66 To 67 Weeks SUM 1` +
        `Gt 67 To 68 Weeks SUM 1` + `Gt 68 To 69 Weeks SUM 1` + `Gt 69 To 70 Weeks SUM 1` +
        `Gt 70 To 71 Weeks SUM 1` + `Gt 71 To 72 Weeks SUM 1` + `Gt 72 To 73 Weeks SUM 1` +
        `Gt 73 To 74 Weeks SUM 1` + `Gt 74 To 75 Weeks SUM 1` + `Gt 75 To 76 Weeks SUM 1` +
        `Gt 76 To 77 Weeks SUM 1` + `Gt 77 To 78 Weeks SUM 1` + `Gt 78 To 79 Weeks SUM 1` +
        `Gt 79 To 80 Weeks SUM 1` + `Gt 80 To 81 Weeks SUM 1` + `Gt 81 To 82 Weeks SUM 1` +
        `Gt 82 To 83 Weeks SUM 1` + `Gt 83 To 84 Weeks SUM 1` + `Gt 84 To 85 Weeks SUM 1` +
        `Gt 85 To 86 Weeks SUM 1` + `Gt 86 To 87 Weeks SUM 1` + `Gt 87 To 88 Weeks SUM 1` +
        `Gt 88 To 89 Weeks SUM 1` + `Gt 89 To 90 Weeks SUM 1` + `Gt 90 To 91 Weeks SUM 1` +
        `Gt 91 To 92 Weeks SUM 1` + `Gt 92 To 93 Weeks SUM 1` + `Gt 93 To 94 Weeks SUM 1` +
        `Gt 94 To 95 Weeks SUM 1` + `Gt 95 To 96 Weeks SUM 1` + `Gt 96 To 97 Weeks SUM 1` +
        `Gt 97 To 98 Weeks SUM 1` + `Gt 98 To 99 Weeks SUM 1` + `Gt 99 To 100 Weeks SUM 1` +
        `Gt 100 To 101 Weeks SUM 1` + `Gt 101 To 102 Weeks SUM 1` + `Gt 102 To 103 Weeks SUM 1` +
        `Gt 103 To 104 Weeks SUM 1` + `Gt 104 Weeks SUM 1`
    ) AS waiting_52_weeks_or_more
FROM `20260228_RTT_February`
WHERE `RTT Part Description` = 'Incomplete Pathways'
AND `Treatment Function Name` != 'Total'
GROUP BY `Treatment Function Name`
ORDER BY waiting_52_weeks_or_more DESC
LIMIT 20;

Query 6: Single National Number
SELECT 
    SUM(
        `Gt 52 To 53 Weeks SUM 1` + `Gt 53 To 54 Weeks SUM 1` + `Gt 54 To 55 Weeks SUM 1` +
        `Gt 55 To 56 Weeks SUM 1` + `Gt 56 To 57 Weeks SUM 1` + `Gt 57 To 58 Weeks SUM 1` +
        `Gt 58 To 59 Weeks SUM 1` + `Gt 59 To 60 Weeks SUM 1` + `Gt 60 To 61 Weeks SUM 1` +
        `Gt 61 To 62 Weeks SUM 1` + `Gt 62 To 63 Weeks SUM 1` + `Gt 63 To 64 Weeks SUM 1` +
        `Gt 64 To 65 Weeks SUM 1` + `Gt 65 To 66 Weeks SUM 1` + `Gt 66 To 67 Weeks SUM 1` +
        `Gt 67 To 68 Weeks SUM 1` + `Gt 68 To 69 Weeks SUM 1` + `Gt 69 To 70 Weeks SUM 1` +
        `Gt 70 To 71 Weeks SUM 1` + `Gt 71 To 72 Weeks SUM 1` + `Gt 72 To 73 Weeks SUM 1` +
        `Gt 73 To 74 Weeks SUM 1` + `Gt 74 To 75 Weeks SUM 1` + `Gt 75 To 76 Weeks SUM 1` +
        `Gt 76 To 77 Weeks SUM 1` + `Gt 77 To 78 Weeks SUM 1` + `Gt 78 To 79 Weeks SUM 1` +
        `Gt 79 To 80 Weeks SUM 1` + `Gt 80 To 81 Weeks SUM 1` + `Gt 81 To 82 Weeks SUM 1` +
        `Gt 82 To 83 Weeks SUM 1` + `Gt 83 To 84 Weeks SUM 1` + `Gt 84 To 85 Weeks SUM 1` +
        `Gt 85 To 86 Weeks SUM 1` + `Gt 86 To 87 Weeks SUM 1` + `Gt 87 To 88 Weeks SUM 1` +
        `Gt 88 To 89 Weeks SUM 1` + `Gt 89 To 90 Weeks SUM 1` + `Gt 90 To 91 Weeks SUM 1` +
        `Gt 91 To 92 Weeks SUM 1` + `Gt 92 To 93 Weeks SUM 1` + `Gt 93 To 94 Weeks SUM 1` +
        `Gt 94 To 95 Weeks SUM 1` + `Gt 95 To 96 Weeks SUM 1` + `Gt 96 To 97 Weeks SUM 1` +
        `Gt 97 To 98 Weeks SUM 1` + `Gt 98 To 99 Weeks SUM 1` + `Gt 99 To 100 Weeks SUM 1` +
        `Gt 100 To 101 Weeks SUM 1` + `Gt 101 To 102 Weeks SUM 1` + `Gt 102 To 103 Weeks SUM 1` +
        `Gt 103 To 104 Weeks SUM 1` + `Gt 104 Weeks SUM 1`
    ) AS national_52_weeks_or_more
FROM `20260228_RTT_February`
WHERE `RTT Part Description` = 'Incomplete Pathways'
AND `Treatment Function Name` != 'Total';

-- Query 7: Admitted vs Non-Admitted completed pathways by specialty
SELECT 
    `Treatment Function Name`,
    `RTT Part Description`,
    SUM(`Total All`) AS total_patients
FROM `20260228_RTT_February`
WHERE `RTT Part Description` IN (
    'Completed Pathways For Admitted Patients',
    'Completed Pathways For Non-Admitted Patients'
)
AND `Treatment Function Name` != 'Total'
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
FROM `20260228_RTT_February`
WHERE `RTT Part Description` IN (
    'Completed Pathways For Admitted Patients',
    'Completed Pathways For Non-Admitted Patients'
)
AND `Treatment Function Name` != 'Total'
GROUP BY `Provider Org Name`
ORDER BY seen_within_18_weeks DESC
LIMIT 15;

-- Query 9: Which commissioner regions have the highest incomplete pathways?
SELECT 
    `Commissioner Parent Name`,
    `Commissioner Org Name`,
    SUM(`Total All`) AS incomplete_pathways_total
FROM `20260228_RTT_February`
WHERE `RTT Part Description` = 'Incomplete Pathways'
AND `Treatment Function Name` != 'Total'
GROUP BY `Commissioner Parent Name`, `Commissioner Org Name`
ORDER BY incomplete_pathways_total DESC
LIMIT 20;

-- Query 10: Which specialties have the most patients breaching the 18-week target?
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
FROM `20260228_RTT_February`
WHERE `RTT Part Description` = 'Incomplete Pathways'
AND `Treatment Function Name` != 'Total'
GROUP BY `Treatment Function Name`
ORDER BY waiting_over_18_weeks DESC
LIMIT 20;
