SELECT *
FROM data_commuting


CREATE TABLE new_commuting AS
SELECT
    "0",
    "1-14",
    "15-29",
    "30-44",
    "30+",
    "45-59",
    "60+",
    education_level,
    urbanisation_degree,
    age_class,
    "Region"
    sex
FROM data_commuting;



SELECT * 
FROM new_commuting;

DELETE FROM new_commuting
WHERE "Region" IN (
    'Euro_area_19_countries_2015-2022',
    'European_Union_29_countries_from_2013-2020',
    'European_Union_27_countries_from_2020'
);

SELECT *
FROM new_commuting;


-- let's see the commuting time 0 by eudcation level and urbanisation degree

SELECT
    education_level,
    urbanisation_degree,
    SUM("0") AS sum_commuting_0
FROM new_commuting
WHERE education_level <> 'All ISCED 2011 levels'
  AND urbanisation_degree <> 'Total'
  AND urbanisation_degree <> 'No response'
GROUP BY education_level, urbanisation_degree
ORDER BY education_level, urbanisation_degree;

-- looks like for ISCED 0-2 there is no big difference between urbnisation level. For ISCED 3-4 Rural aread, for ISCED 5-8 in cities the highest response. 
-- which mean for people with the lowest el there is not much difference, for poeple with secondory education have more 0 commuting minutes in rural areas, and people with higher education in cities


-- now let's have a look at those with more than 60+ commuting time 
SELECT
    education_level,
    urbanisation_degree,
    SUM("60+") AS sum_commuting_60
FROM new_commuting
WHERE education_level <> 'All ISCED 2011 levels'
  AND urbanisation_degree <> 'Total'
  AND urbanisation_degree <> 'No response'
GROUP BY education_level, urbanisation_degree
ORDER BY education_level, urbanisation_degree;

-- the same. while those living in the cities across all education level have more people commuting for more than 60 min
-- those with 3-4 level: 67,477, from rural: 16,606
-- 5-8 level, across all urbanisatio level: 73,444, from rural 8.734 
-- there more people commuting for more 60 min from rural areas with 3-4 education level than all the other education level. 






