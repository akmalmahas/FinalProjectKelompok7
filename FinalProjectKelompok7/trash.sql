--add region
EXEC AddRegion @name = 'Africa';
EXEC AddRegion @name = 'Asia';
EXEC AddRegion @name = 'America';
EXEC AddRegion @name = 'Europe';

Select * from tbl_regions;

DELETE FROM tbl_regions
WHERE name = 'Africa';


-- Reset AI
DBCC CHECKIDENT ('tbl_regions', RESEED, 0);


--Edit Region
EXEC EditRegion @id = 1, @name = 'Afrika';

SELECT * from tbl_regions;
