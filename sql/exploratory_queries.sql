SELECT name, platform, year
FROM vgsales_cleaned
GROUP BY name, platform, year
HAVING COUNT(*) > 1;

/*Reason: I wanted to find any duplicate entries where the title and platform were the same, so I could fix them in the Calc file and in the DB. Certain games share a title and platform, however come out in different years, so those have also been cleared.*/ 

DELETE FROM vgsales_cleaned
WHERE id = 4147;

--Reason: Delete a duplicate item

DELETE FROM vgsales_cleaned
WHERE id = 16130;

--Reason: Delete a duplicate item

UPDATE vgsales_cleaned
SET "eu_sales" = 0.24, "global_sales" = 2.57
WHERE id = 604;

--Reason: Update the sales data for id item 604
