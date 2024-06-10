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




--tr update 
CREATE TRIGGER trg_AfterUpdateEmployeeJob
ON tbl_employees
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	 -- Mengaktifkan penyisipan nilai eksplisit ke kolom identitas
    SET IDENTITY_INSERT tbl_job_histories ON;

    -- Menambahkan data ke tabel job_histories dengan status 'Hand Over' untuk setiap perubahan pada kolom job
    INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department)
    SELECT 
        d.id, 
        GETDATE(), -- Tanggal perubahan
        NULL, 
        'HAND OVER', 
        d.job, 
        d.department
    FROM 
        deleted d -- Data sebelum update
    JOIN 
        inserted i ON d.id = i.id -- Data setelah update
    WHERE 
        d.job <> i.job; -- Memeriksa apakah ada perubahan pada kolom job

	-- Menonaktifkan kembali penyisipan nilai eksplisit ke kolom identitas
    SET IDENTITY_INSERT tbl_job_histories OFF;
END;



DROP TRIGGER trg_AfterInsertEmployee;
DROP TRIGGER trg_AfterUpdateEmployeeJob;
