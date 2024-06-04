--add region
EXEC AddRegion @name = 'Africa';
EXEC AddRegion @name = 'Asia';
EXEC AddRegion @name = 'America';
EXEC AddRegion @name = 'Europe';

Select * from tbl_regions;


-- Reset AI
DBCC CHECKIDENT ('tbl_regions', RESEED, 3);


--Edit Region
EXEC EditRegion @id = 1, @name = 'Afrika';

SELECT * from tbl_regions;

--delete region

EXEC DeleteRegion @id = '4';


--Add Country
EXEC AddCountry @id = 'USA', @name = 'United States of America', @region = 1; 

SELECT * FROM tbl_countries;

--Edit Country
EXEC EditCountry @id ='USA', @name = 'United States of Americaaaaaa';
EXEC EditCountry @id ='USA', @region = 4;
EXEC EditCountry @id ='USA', @region = 10;

SELECT * FROM tbl_countries;

--Delete Country
EXEC DeleteCountry @id = 'USA';

SELECT * FROM tbl_countries;