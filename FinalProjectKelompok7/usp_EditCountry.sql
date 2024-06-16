USE db_employee;
GO

CREATE PROCEDURE EditCountry
    @id CHAR(3),
    @name VARCHAR(40) = NULL,
    @region INT = NULL
AS
BEGIN
    -- Memeriksa apakah ID yang diberikan valid
    IF EXISTS (SELECT 1 FROM tbl_countries WHERE id = @id)
    BEGIN
            -- Memperbarui data di tabel Countries
            UPDATE tbl_countries
            SET name = COALESCE (@name, name),
                region = COALESCE (@region, region)
            WHERE id = @id;

            -- Mengembalikan pesan keberhasilan
            SELECT 'Country updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        -- Mengembalikan pesan kesalahan jika ID tidak ditemukan
        SELECT 'Country with the specified ID does not exist.' AS Message;
    END
END;

