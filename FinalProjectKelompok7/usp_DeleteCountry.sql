use db_employee;
go

CREATE PROCEDURE DeleteCountry
    @id CHAR(3)
AS
BEGIN
    -- Menghapus data dari tabel Country
    DELETE FROM tbl_countries
    WHERE id = @id;
END;

