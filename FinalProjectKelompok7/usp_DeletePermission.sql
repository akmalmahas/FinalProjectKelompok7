CREATE PROCEDURE DeletePermission
    @id INT
AS
BEGIN
    -- Menghapus data dari tabel Permissions
    DELETE FROM tbl_permissions
    WHERE id = @id;
END;

--DeletePermission
EXEC DeletePermission @id = 1;

SELect* from tbl_permissions