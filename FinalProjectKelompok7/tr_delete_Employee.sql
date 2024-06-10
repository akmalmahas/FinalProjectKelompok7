CREATE TRIGGER trg_AfterDeleteEmployee
ON tbl_employees
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Menambahkan data ke tabel job_histories dengan status 'Resign' untuk setiap penghapusan pada tabel employee
    INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department)
    SELECT 
        d.id, 
        GETDATE(), -- Tanggal penghapusan
        NULL, 
        'Resign', 
        d.job, 
        d.department
    FROM 
        deleted d; -- Data yang dihapus
END;