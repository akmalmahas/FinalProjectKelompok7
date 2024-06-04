CREATE PROCEDURE DeleteDepartment
    @id int
AS
BEGIN
    -- Menghapus data dari tabel departments
    DELETE FROM tbl_departments
    WHERE id = @id;
END;

--exec
EXEC DeleteDepartment @id = '2';

SELECT * FROM tbl_departments;