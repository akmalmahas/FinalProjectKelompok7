use db_employee;
go

CREATE PROCEDURE DeleteRole
    @id INT
AS
BEGIN
    -- Menghapus data dari tabel Roles
    DELETE FROM tbl_roles
    WHERE id = @id;
END;

