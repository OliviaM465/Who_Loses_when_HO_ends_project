ALTER DEFAULT PRIVILEGES IN SCHEMA team_2
GRANT All ON TABLES TO akziraabuova, oliverfurtak, zandebevec;


SELECT *
FROM DATA_HOME_OFFICE DHO; 

SELECT *
FROM DATA_COMMUTING DC;

-- erstellt eine Tabelle bei der wir uns nur die Anzahl der "total children" angucken. 
-- Die Daten in Commuting Data wurden sonst vervielfacht(gleiche Werte für 1, 2 etc Kinder)
CREATE TABLE home_office_commuting_combined AS
WITH joined_data AS 
(
SELECT *
FROM DATA_HOME_OFFICE DHO
WHERE DHO.sex != 'total')
SELECT JD."Region" ,
		JD."2019_HO%",
		dc.SEX,
		jd.AGE_CLASS,
		jd.CHILDREN,
		dc.EDUCATION_LEVEL,
		DC.URBANISATION_DEGREE,
		dc."0",
		dc."1-9",
		dc."1-14",
		dc."1+",
		dc."10-14",
		dc."15-19",
		dc."15-29",
		dc."20-29",
		dc."30-44",
		dc."30-59",
		dc."30+",
		dc."45-59",
		dc."60+"
FROM joined_data JD
JOIN DATA_COMMUTING DC 
  ON JD.AGE_CLASS = DC.AGE_CLASS
  AND JD.SEX = dc.SEX
  AND jd."Region" = dc."Region"
 WHERE jd."children" = 'total'
ORDER BY DC."Region", DC.URBANISATION_DEGREE, DC.EDUCATION_LEVEL , JD.CHILDREN, JD.SEX;

----------------------------------------------------------------------------------------------------------------------------------  
SELECT DISTINCT AGE_CLASS FROM DATA_HOME_OFFICE;
SELECT DISTINCT AGE_CLASS FROM DATA_COMMUTING;

SELECT DISTINCT SEX FROM DATA_HOME_OFFICE;
SELECT DISTINCT SEX FROM DATA_COMMUTING;

SELECT DISTINCT "Region" FROM DATA_HOME_OFFICE
ORDER BY "Region";
SELECT DISTINCT "Region" FROM DATA_COMMUTING
ORDER BY "Region";