EXEC AddRegion @name = 'Africa';

Select * from tbl_regions;

DELETE FROM tbl_regions
WHERE name = 'Africa';

DBCC CHECKIDENT ('tbl_regions', RESEED, 0);
