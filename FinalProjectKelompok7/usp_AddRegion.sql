CREATE PROCEDURE AddRegion
    @name VARCHAR(25)
AS
BEGIN
    -- Menyisipkan data region baru ke dalam tabel
    INSERT INTO tbl_regions (name)
    VALUES (@name);

    -- Mengembalikan pesan keberhasilan atau kesalahan
    IF @@ROWCOUNT > 0
        SELECT 'Region added successfully.' AS Message;
    ELSE
        SELECT 'Failed to add region.' AS Message;
END;


EXEC AddRegion @name = 'Africa';

DBCC CHECKIDENT ('tbl_regions', RESEED, 0);

/*
INSERT INTO tbl_regions (name)
VALUES ('ASIA');

DELETE FROM tbl_regions
WHERE name = 'Africa';

Select * from tbl_regions;
*/
