CREATE PROCEDURE EditJob
    @id VARCHAR(10),
    @title VARCHAR(35) = NULL,
    @min_salary INT = NULL,
	@max_salary INT = NULL
AS
BEGIN
    -- Memeriksa apakah ID yang diberikan valid
    IF EXISTS (SELECT 1 FROM tbl_jobs WHERE id = @id)
    BEGIN
            -- Memperbarui data di tabel Job
            UPDATE tbl_jobs
            SET title = COALESCE (@title, title),
                min_salary = COALESCE (@min_salary, min_salary),
				max_salary = COALESCE (@max_salary, max_salary)
            WHERE id = @id;

            -- Mengembalikan pesan keberhasilan
            SELECT 'Job updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        -- Mengembalikan pesan kesalahan jika ID tidak ditemukan
        SELECT 'Job with the specified ID does not exist.' AS Message;
    END
END;

