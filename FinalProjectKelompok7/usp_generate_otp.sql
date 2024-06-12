CREATE PROCEDURE GenerateOTP
    @Email VARCHAR(25)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Id INT;
    DECLARE @OTP INT;

    -- Mencari ID karyawan berdasarkan email
    SELECT @Id = e.id
    FROM tbl_employees e
    INNER JOIN tbl_accounts a ON e.id = a.id
    WHERE e.email = @Email;

    IF @Id IS NULL
    BEGIN
        -- Mengembalikan pesan kesalahan jika email tidak ditemukan
        SELECT 'Account with the specified email does not exist.' AS Message;
        RETURN;
    END

    -- Menghasilkan OTP acak antara 1000 dan 9999
    SET @OTP = CAST((RAND() * 9000) + 1000 AS INT);

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Menyimpan OTP baru di tabel tbl_accounts
        UPDATE tbl_accounts
        SET otp = @OTP, is_used = 0, is_expired = DATEADD(MINUTE, 10, GETDATE())
        WHERE id = @Id;

        -- Commit transaction
        COMMIT TRANSACTION;

        -- Mengembalikan pesan sukses beserta OTP yang dihasilkan
        SELECT 'OTP generated successfully. OTP: ' + CAST(@OTP AS VARCHAR(4)) AS Message;
    END TRY
    BEGIN CATCH
        -- Rollback transaction jika terjadi kesalahan
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

EXEC GenerateOTP @Email = 'akmal@gmail.com';