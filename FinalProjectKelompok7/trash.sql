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
