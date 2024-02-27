--- Create a Join Table

SELECT * FROM Absenteeism_at_work A
	LEFT JOIN compensation B
	ON A.ID = B.ID
	LEFT JOIN Reasons R
	ON A.Reason_for_absence = R.Number

--- Find the Healthiest Employees for the Bonus

SELECT * FROM Absenteeism_at_work
	WHERE Social_drinker = 0 
		AND Social_smoker = 0
		AND Body_mass_index < 25
		AND Absenteeism_time_in_hours < (SELECT AVG(Absenteeism_time_in_hours) FROM Absenteeism_at_work)

--- Compensation Rate Increse for Non-Smokers / Budget 983,221 so 0.689 Increase per Hour / $1414.4 per Year

SELECT COUNT(*) AS nonsmokers FROM Absenteeism_at_work
WHERE Social_smoker = 0

--- Optimize this Query

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
