# Employee-Incentives-and-Wellness-Project

# Nashville-Housing-Data

## Table of Contents

 - [Project Overview](#project-overview)
 - [Data Sources](#data-sources)
 - [Tools](#tools)
 - [Data Cleaning](#data-cleaning)
 - [Key Achievements](#key-achievements)

### Project Overview




### Data Sources

- Source: https://github.com/Gaelim/work_incentive_program

### Tools

- Excel - Data Cleaning
- SQL(SQL Server) - Data Exploration, Data Cleaning, Database
- Power BI - Data analysis and visualizaiton

### Requirement Scenario

HR requested to data analysis team:
- Provide a list of heathy individual & low absenteeism for our healthy bonus program - Total budget $1,000 USD
- Caculate a wage increase or annual compensation for non-smokers for (Insurance budget of $983,221 for all non-smokers)
- Create a dashboard for HR to understand absenteeism at work based on approved wireframe.


### Build a Database
 
 - Using SQL server, created the database named "work" and imported the flat files(.csv) into "work" database.

  ![Cap 2024-02-16 11-23-19-318](https://github.com/MingyuTheAnalyst/Employee-Incentives-and-Wellness-Project/assets/88122148/c2616dd8-e8d7-4818-9d44-494c7c9c5e16)

### Develope SQL Query

```SQL
--- CREATE A JOIN TABLE

SELECT * FROM Absenteeism_at_work A
	LEFT JOIN compensation B
	ON A.ID = B.ID
	LEFT JOIN Reasons R
	ON A.Reason_for_absence = R.Number
```
  ![Cap 2024-02-16 11-22-19-867](https://github.com/MingyuTheAnalyst/Employee-Incentives-and-Wellness-Project/assets/88122148/fa8a7e44-e832-4f0f-a8a0-e2b3fed10886)


### Perform Analysis

### Connect Database to Power BI

### Build a Dashboard

### Key Achievements

