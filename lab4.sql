--Q4.1
/'We cannot delete VA because it is connected to the fips which is a foreign key. VA records are in name and population therefore we cannot delete it'/
  
--Q4.2
/'We cannot insert the code because there is no valued fips that equals 80'/

--Q4.3
/'Yes, it is not perfect but it does the job'/

--4.5
/'Yes, great job'/

--4.6
SELECT n.name AS state_name, i.year, i.income
FROM Income i
JOIN Name n ON i.fips = n.fips
WHERE i.year = (SELECT MAX(year) FROM Income)
ORDER BY i.income DESC
LIMIT 1;
/'Yes, the SQL code works great'/

--4.7
/'Prompt: your prompt to calculate the VA population growth rate in the past five
years. The prompt did not work, the new prompt used was: Calculate the growth rate for each year of VA in the past 5 years, and it still did not work.'/
WITH VirginiaPop AS (
    SELECT p.year, p.pop
    FROM Population p
    JOIN Name n ON p.fips = n.fips
    WHERE n.name = 'Virginia' AND p.year BETWEEN YEAR(GETDATE()) - 6 AND YEAR(GETDATE()) - 1
    ORDER BY p.year
)
SELECT 
    Current.year AS Year,
    Current.pop AS Current_Population,
    Previous.pop AS Previous_Population,
    (Current.pop - Previous.pop) * 1.0 / Previous.pop * 100 AS Growth_Rate_Percent
FROM 
    VirginiaPop Current
JOIN 
    VirginiaPop Previous ON Current.year = Previous.year + 1
ORDER BY 
    Current.year;


/'It doesn't work'/

  
--4.8
/'No, not always because I have gotten wrong responses today no matter the prompt requested'/

  






