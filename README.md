# Traffic Accident Analysis
Analysis of traffic accident patterns, injury severity, road conditions, and contributing factors using SQL and Power BI
## Project Overview
This project analyzes traffic accident data to identify patterns in crash occurrences, injury severity, road conditions, lighting conditions, weather conditions, and factors contributing to crashes. The analysis focuses on identifying patterns that can provide insight into accident severity and the conditions associated with higher crash and injury occurrences.
## Dataset
The dataset contains 209,306 records and 24 columns, covering traffic accidents recorded between 2013 and 2025.
The dataset includes information on crash dates, weather conditions, lighting conditions, road surface conditions, road defects, crash types, contributing causes, injuries, fatalities, and other accident-related characteristics.
### Data Quality
- Original records: 209,306
- Duplicate records identified: 31
- Records after duplicate removal: 209,275
- Columns: 24
- Date range: 2013–2025
## Analytical Questions
1. Which weather condition has the highest total injuries?
2. Which lighting condition has the highest and lowest incapacitating injuries?
3. Which road surface condition has the highest number of crashes, and what is the most common primary contributory cause within that condition?
4. What is the most common first crash type?
5. Which month has the highest and lowest occurrence of the most common crash type?
## Tools Used
- MySQL — data cleaning and exploratory data analysis
- Power BI — data visualization and dashboard development
## Data Cleaning
The data was cleaned and prepared using SQL before analysis.
### Key preparation steps included:
- Inspecting the dataset structure and data quality
- Checking for duplicate records
- Identifying and removing duplicate records
- Reviewing unknown values across relevant categorical columns
- Reviewing and preparing date fields
- Validating the cleaned dataset before conducting the analysis
After duplicate removal, the dataset contained 209,275 records.
## Exploratory Data Analysis
SQL was used to aggregate and investigate the dataset according to the analytical questions. The analysis examined injury totals, incapacitating injuries, crash frequency, road surface conditions, primary contributory causes, first crash types, and monthly crash patterns.
## Key Findings
- Approximately 80,000 injuries were recorded in the dataset.
- Approximately 8,000 incapacitating injuries were recorded.
- The dataset recorded 339 fatalities.
- Dry road surface had the highest number of crashes.
- Among crashes occurring on dry roads, Unable to Determine was the most common primary contributory cause, accounting for approximately 42,000 crashes.
- Clear weather accounted for the highest proportion of recorded injuries, representing approximately 80.27% of recorded injuries.
- Daylight recorded the highest number of incapacitating injuries, with 4,557 cases.
- The most common crash type analyzed was No Injury / Drive Away.
- For this crash type, October recorded the highest number of crashes at approximately 11,000, while April recorded the lowest at 8,463.##
## Dashboard
The final dashboard was developed in Power BI to present the results of the analysis visually and make the major patterns and findings easier to interpret.
"Traffic Accident Dashboard" (traffic-accident-dashboard.png)
## Project Files
#### Data Cleaning SQL
Contains the SQL queries used to inspect, clean, and prepare the dataset for analysis.
#### Exploratory Data Analysis SQL
Contains the SQL queries used to investigate the analytical questions and derive the project's findings.
#### Power BI Dashboard
Contains the completed Power BI dashboard used to visualize the analysis.
#### Dashboard Screenshot
A preview of the completed Power BI dashboard.
## Outcome
The analysis provided an overview of traffic accident patterns across different environmental, roadway, crash, and injury-related factors. The project demonstrates an end-to-end workflow involving data quality assessment, SQL-based cleaning, exploratory analysis, and Power BI visualization.
