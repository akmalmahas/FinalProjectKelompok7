CREATE PROCEDURE DeleteEmployee
    @id int
AS
BEGIN
    -- Menghapus data dari tabel employees
    DELETE FROM tbl_employees
    WHERE id = @id;
END;

--EXEC DELETE Employee
EXEC DeleteEmployee @id = '3';

SELECT * FROM tbl_employees;