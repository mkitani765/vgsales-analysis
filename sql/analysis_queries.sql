SELECT name, global_sales
FROM vgsales_cleaned
WHERE "global_sales" > 10
ORDER BY global_sales DESC
LIMIT 10;

/*Reason: To see the top 10 best selling games according to the dataset, looking for trends and patterns. This query shows me that the first 5 of the top selling games are Nintendo exclusives which are also published by Nintendo.*/

SELECT name, global_sales
FROM vgsales_cleaned
WHERE "global_sales" > 10
AND "jp_sales" > 5
ORDER BY global_sales DESC
LIMIT 10;

SELECT name, global_sales
FROM vgsales_cleaned
WHERE "global_sales" > 10
AND "na_sales" > 5
ORDER BY global_sales DESC
LIMIT 10;

/*Reason: I decided to look at the differences in preference between the top 10 games in Japan and North America, since those are two places I have experience with. I wanted to see what games were most popular in either region, and if there was significant crossover or not. While I did find that there was some crossover, most of Japan’s top selling titles were different Pokemon games.*/

SELECT DISTINCT publisher, global_sales
FROM vgsales_cleaned
WHERE "global_sales" >=
	(SELECT AVG(global_sales)
	FROM vgsales_cleaned)
GROUP BY publisher
ORDER BY "global_sales" DESC
LIMIT 10;

SELECT DISTINCT publisher, global_sales
FROM vgsales_cleaned
WHERE "global_sales" >= 10
GROUP BY publisher
ORDER BY "global_sales" DESC
LIMIT 10;

/*Reason: These two queries were done to check the relative success of the top 10 publishers when going by overall global sales versus the average.*/

SELECT platform, SUM(global_sales) AS totalsales
FROM vgsales_cleaned
GROUP BY platform
ORDER BY totalsales DESC;

SELECT platform, SUM(global_sales) AS totalsales
FROM vgsales_cleaned
WHERE year < 2005 AND year > 1991
GROUP BY platform
ORDER BY totalsales DESC;



/*Reason: To view which platforms had the highest overall unit sales during my childhood to see which other people preferred when compared to my personal preferences at the time.*/
