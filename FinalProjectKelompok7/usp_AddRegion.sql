USE db_employee;
GO

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

