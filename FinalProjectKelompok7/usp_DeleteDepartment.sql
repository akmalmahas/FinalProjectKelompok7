CREATE PROCEDURE DeleteDepartment
    @id int
AS
BEGIN
    -- Menghapus data dari tabel departments
    DELETE FROM tbl_departments
    WHERE id = @id;
END;

