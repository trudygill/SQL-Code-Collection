/* 
Created by: T.Gill
Created date: 06/21/2023
Description: CASE -- Challenge Task | We want to know and compare the various amounts of films we have per movie rating.
*/ 

SELECT
	SUM(CASE rating WHEN 'R' THEN 1 ELSE 0 END) AS r_rated,
	SUM(CASE rating WHEN 'PG' THEN 1 ELSE 0 END) AS pg_rated,
	SUM(CASE rating WHEN 'PG-13' THEN 1 ELSE 0 END) AS pg13_rated 
FROM film

SELECT DISTINCT rating FROM film