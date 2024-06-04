CREATE PROCEDURE DeleteRole
    @id INT
AS
BEGIN
    -- Menghapus data dari tabel Roles
    DELETE FROM tbl_roles
    WHERE id = @id;
END;

--DeleteRole
EXEC DeleteRole @id = 1;

SELECT * FROM tbl_roles