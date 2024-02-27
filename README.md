# Employee-Incentives-and-Wellness-Project

![Cap 2024-02-21 17-55-44-625](https://github.com/MingyuTheAnalyst/Employee-Incentives-and-Wellness-Project/assets/88122148/307c2924-25a9-453f-9b9b-c598ea954a1f)

## Table of Contents

 - [Project Overview](#project-overview)
 - [Data Sources](#data-sources)
 - [Tools](#tools)
 - [Requirement Scenario](#requirement_scenario)
 - [Build a Database](#build_a_database)
 - [Connect Database to Power BI](#connect_database_to_power_bi)
 - [Build a Dashboard](#build_a_dashboard)
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

- Create a Join Table
	```SQL
	SELECT * FROM Absenteeism_at_work A
		LEFT JOIN compensation B
		ON A.ID = B.ID
		LEFT JOIN Reasons R
		ON A.Reason_for_absence = R.Number
	```	
	![Cap 2024-02-16 11-22-19-867](https://github.com/MingyuTheAnalyst/Employee-Incentives-and-Wellness-Project/assets/88122148/fa8a7e44-e832-4f0f-a8a0-e2b3fed10886)

 - Find the Healthiest Employees for the Bonus
	```SQL
	SELECT * FROM Absenteeism_at_work
		WHERE Social_drinker = 0 
			AND Social_smoker = 0
			AND Body_mass_index < 25
			AND Absenteeism_time_in_hours < (SELECT AVG(Absenteeism_time_in_hours) FROM Absenteeism_at_work)
	```
- Compensation Rate Increse for Non-Smokers / Budget 983,221 so 0.689 Increase per Hour / $1414.4 per Year
	```SQL
	SELECT COUNT(*) AS nonsmokers FROM Absenteeism_at_work
	WHERE Social_smoker = 0
	```

 - Optimize this Query
	```SQL
	SELECT
		A.ID,
		R.Reason,
		Body_mass_index,
		CASE WHEN Body_mass_index < 18.5 THEN 'Underweight'
			 WHEN Body_mass_index between 18.5 and 25 THEN 'Healthyweight'
			 WHEN Body_mass_index between 25 and 30 THEN 'Overweight'
			 WHEN Body_mass_index > 30 THEN 'Obese'
			 ELSE 'Unknown' END AS BMI_Category,
		CASE WHEN Month_of_absence IN (12,1,2) THEN 'Winter'
			 WHEN Month_of_absence IN (3,4,5) THEN 'Spring'
			 WHEN Month_of_absence IN (6,7,8) THEN 'Summer'
			 WHEN Month_of_absence IN (9,10,11) THEN 'Autumn'
			 ELSE 'Unknown' END AS Season_Names,
		Month_of_absence,
		Day_of_the_week,
		Transportation_expense,
		Education,
		Son,
		Social_drinker,
		Social_smoker,
		Pet,
		Disciplinary_failure,
		Age,
		Work_load_Average_day,
		Absenteeism_time_in_hours
	
	FROM Absenteeism_at_work A
		LEFT JOIN compensation B
		ON A.ID = B.ID
		LEFT JOIN Reasons R
		ON A.Reason_for_absence = R.Number
	```

### Connect Database to Power BI

- Connect to SQL server to Power BI included the SQL statement. The cleaned and transformed dataset is imported.

	![Cap 2024-02-16 15-41-35-741](https://github.com/MingyuTheAnalyst/Employee-Incentives-and-Wellness-Project/assets/88122148/ebcfe3e2-25e0-4694-98b4-f31ab7f5a25c)
	
 	![Cap 2024-02-16 15-54-42-410](https://github.com/MingyuTheAnalyst/Employee-Incentives-and-Wellness-Project/assets/88122148/34633315-f519-4700-afb5-045c83244812)


### Build a Dashboard

- Deliver key performance indicators (KPIs) for the average absenteeism hours and offer a smart narrative to summarize the dashboard. Utilizing seasonal filtering simplifies and clarifies the dashboard presentation.

	![Cap 2024-02-21 17-55-49-609](https://github.com/MingyuTheAnalyst/Employee-Incentives-and-Wellness-Project/assets/88122148/97211b45-6fcf-4596-845b-21fe314d678c)

- In the "Employee and Categories" segment, two key performance indicators (KPIs) are delivered, and the data is visualized using four donut charts. Filtering is made possible through the donut charts for each specific category.
  
	![Cap 2024-02-21 17-55-58-184](https://github.com/MingyuTheAnalyst/Employee-Incentives-and-Wellness-Project/assets/88122148/c8b8f64c-b2b7-4647-bb47-c41adb98faa7)

- In the "Time and Trends" section, visualization is achieved through two line charts. The chart on the left displays total absenteeism hours by month, while the one on the right shows average absenteeism hours by day of the week.

	![Cap 2024-02-21 17-56-09-765](https://github.com/MingyuTheAnalyst/Employee-Incentives-and-Wellness-Project/assets/88122148/b09d2d2e-bf2d-4a5d-bfa0-118ae1e58eb6)

- In the "Reasons and Comparisons" section, absenteeism reasons and total absence counts are represented in a table, while on the right, a scatter chart illustrates the correlation between average workload and transportation expense.

![Cap 2024-02-21 17-56-19-512](https://github.com/MingyuTheAnalyst/Employee-Incentives-and-Wellness-Project/assets/88122148/782d6d4c-525b-4a76-9cf6-601d10a0c741)


### Key Achievements

