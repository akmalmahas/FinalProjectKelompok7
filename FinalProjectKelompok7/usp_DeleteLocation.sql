CREATE PROCEDURE DeleteLocation
    @id int
AS
BEGIN
    -- Menghapus data dari tabel Country
    DELETE FROM tbl_locations
    WHERE id = @id;
END;

