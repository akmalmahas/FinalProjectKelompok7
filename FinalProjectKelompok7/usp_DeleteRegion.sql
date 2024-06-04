CREATE PROCEDURE DeleteRegion
    @id VARCHAR(25)
AS
BEGIN
    -- Menghapus data dari tabel Region
    DELETE FROM tbl_regions
    WHERE id = @id;
END;

--exec
EXEC DeleteRegion @id = '4';
