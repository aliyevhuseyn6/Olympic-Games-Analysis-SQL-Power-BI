SELECT 
    ID,
	Name AS 'Athlete Name',-- renaming column for making it more clear
	CASE WHEN Sex = 'M' THEN 'Male'
	     ELSE 'Female' 
	END AS Sex, -- better categorizing for filters and visualization
	Age, 
	CASE WHEN Age < 18 THEN 'Under 18'
	     WHEN Age BETWEEN 18 AND 25 THEN '18-25'
		 WHEN Age BETWEEN 25 AND 30 THEN '25-30'
		 WHEN Age > 30 THEN 'Over 30'
	END AS 'Age Grouping', -- creating new column for the grouping of age data for better perception and visualization
	Height,
	Weight,
	NOC AS 'National Code', -- renaming column for making it more clear
	LEFT(Games, CHARINDEX(' ', Games)-1) AS 'Year', -- splitting column to extract Year, based on space
	RIGHT(Games, CHARINDEX(' ', REVERSE(Games))-1) AS 'Season', -- splitting column to extract Season, based on space
	Sport,
	Event,
	CASE WHEN Medal = 'NA' THEN 'Not Registered'
	     ELSE Medal
	END AS Medal -- replacing NA values with 'Not Registered' tag
FROM olympic_games.dbo.athletes_event_results
WHERE RIGHT(Games, CHARINDEX(' ',REVERSE(Games))-1) = 'Summer' -- filtering data only related to Summer season