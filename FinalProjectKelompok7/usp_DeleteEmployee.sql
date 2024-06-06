CREATE PROCEDURE DeleteEmployee
    @id int
AS
BEGIN
	BEGIN TRANSACTION;

    BEGIN TRY

     -- Hapus data dari tabel tbl_accounts
	 DELETE FROM tbl_accounts 
	 WHERE id = @id;

    -- Menghapus data dari tabel employees
    DELETE FROM tbl_employees
    WHERE id = @id;

	-- Commit transaction
    COMMIT TRANSACTION;

    -- Mengembalikan pesan keberhasilan
    SELECT 'Employee deleted successfully.' AS Message;
	END TRY
    BEGIN CATCH
        -- Rollback transaction jika terjadi kesalahan
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

--EXEC DELETE Employee
EXEC DeleteEmployee @id = '5';

SELECT * FROM tbl_employees;