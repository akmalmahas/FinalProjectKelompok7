use db_employee;
go

CREATE TRIGGER trg_AfterDeleteEmployeeJob
ON tbl_employees
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Memperbarui data di tabel job_histories dengan status 'RESIGN' untuk setiap penghapusan pada tabel employees
    UPDATE tbl_job_histories
    SET 
		start_date = hire_date,
        end_date = GETDATE(), -- Tanggal penghapusan data karyawan
        status = 'RESIGN'
    FROM 
        deleted d
    WHERE 
        tbl_job_histories.employee = d.id
        AND tbl_job_histories.end_date IS NULL; -- Memperbarui entri aktif
END;
