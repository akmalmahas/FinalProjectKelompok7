use db_employee;
go

CREATE TRIGGER trg_AfterInsertEmployee
ON tbl_employees
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Mengaktifkan penyisipan nilai eksplisit ke kolom identitas
    SET IDENTITY_INSERT tbl_job_histories ON;

    -- Menambahkan data ke tabel job_histories dengan status 'Active'
    INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department)
    SELECT 
        id, 
        hire_date, 
        NULL, 
        'Active', 
        job, 
        department
    FROM 
        inserted;

    -- Menonaktifkan kembali penyisipan nilai eksplisit ke kolom identitas
    SET IDENTITY_INSERT tbl_job_histories OFF;
END;