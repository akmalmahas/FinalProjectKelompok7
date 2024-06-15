CREATE PROCEDURE DeleteRegion
    @id INT
AS
BEGIN
    -- Menghapus data dari tabel Region
    DELETE FROM tbl_regions
    WHERE id = @id;
END;

