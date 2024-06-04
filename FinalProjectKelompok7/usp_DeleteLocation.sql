CREATE PROCEDURE Deletelocation
    @id int
AS
BEGIN
    -- Menghapus data dari tabel Country
    DELETE FROM tbl_locations
    WHERE id = @id;
END;

--exec
EXEC Deletelocation @id = '1';

SELECT * FROM tbl_locations;