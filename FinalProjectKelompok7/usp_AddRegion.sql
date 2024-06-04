CREATE PROCEDURE AddRegion
    @name VARCHAR(25)
AS
BEGIN
    -- Menambahkan data ke tabel Region
    INSERT INTO tbl_regions (name)
    VALUES (@name);
    
    -- Mengembalikan id dari record yang baru ditambahkan
    SELECT SCOPE_IDENTITY() AS NewID;
END;

/*
INSERT INTO tbl_regions (name)
VALUES ('ASIA');

DELETE FROM tbl_regions
WHERE name = 'Africa';

Select * from tbl_regions;
*/

DECLARE @NewID INT;
EXEC AddRegion @name = 'Africa';
SELECT @NewID = SCOPE_IDENTITY();
SELECT @NewID AS IDBaru;

DBCC CHECKIDENT ('tbl_regions', RESEED, 0);