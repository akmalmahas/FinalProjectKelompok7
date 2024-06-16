use db_employee;
go

CREATE TRIGGER trg_AfterUpdateEmployeeJob
ON tbl_employees
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Memperbarui data di tabel job_histories dengan status 'HAND OVER' untuk setiap perubahan pada kolom job
    UPDATE tbl_job_histories
    SET 
        start_date = GETDATE(), -- Tanggal mulai pekerjaan baru
        end_date = NULL, 
        status = 'HAND OVER',
        job = i.job,
        department = i.department
    FROM 
        deleted d
    JOIN 
        inserted i ON d.id = i.id
    WHERE 
        d.job <> i.job -- Memeriksa apakah ada perubahan pada kolom job
        AND tbl_job_histories.employee = d.id
        AND tbl_job_histories.end_date IS NULL; -- Memperbarui entri aktif
END;
