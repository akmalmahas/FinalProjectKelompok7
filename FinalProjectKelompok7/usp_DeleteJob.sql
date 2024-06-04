CREATE PROCEDURE DeleteJob
    @id VARCHAR(10)
AS
BEGIN
    -- Menghapus data dari tabel Job
    DELETE FROM tbl_jobs
    WHERE id = @id;
END;

--exec
EXEC DeleteJob @id = 'Engineer';

SELECT * FROM tbl_jobs;

