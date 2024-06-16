use db_employee;
go

CREATE PROCEDURE DeleteJob
    @id VARCHAR(10)
AS
BEGIN
    -- Menghapus data dari tabel Job
    DELETE FROM tbl_jobs
    WHERE id = @id;
END;

