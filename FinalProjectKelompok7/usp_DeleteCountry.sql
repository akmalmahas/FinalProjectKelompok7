CREATE PROCEDURE DeleteCountry
    @id CHAR(3)
AS
BEGIN
    -- Menghapus data dari tabel Country
    DELETE FROM tbl_countries
    WHERE id = @id;
END;

--exec
EXEC DeleteCountry @id = 'USA';

SELECT * FROM tbl_countries;

