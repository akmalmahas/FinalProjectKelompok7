CREATE PROCEDURE ForgotPassword
    @Email VARCHAR(25),
    @NewPassword VARCHAR(255),
    @ConfirmPassword VARCHAR(255),
    @OTP INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Id INT;
    DECLARE @StoredOTP INT;
    DECLARE @IsExpired DATETIME;
    DECLARE @IsUsed BIT;

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

    -- Memeriksa apakah OTP cocok dan belum kadaluarsa atau belum digunakan
    SELECT @StoredOTP = otp, @IsExpired = is_expired, @IsUsed = is_used
    FROM tbl_accounts
    WHERE id = @Id;

    IF @StoredOTP <> @OTP
    BEGIN
        -- Mengembalikan pesan kesalahan jika OTP tidak cocok
        SELECT 'Invalid OTP.' AS Message;
        RETURN;
    END

    IF GETDATE() > @IsExpired OR @IsUsed = 1
    BEGIN
        -- Mengembalikan pesan kesalahan jika OTP sudah kadaluarsa atau sudah digunakan
        SELECT 'OTP is expired or already used. Please request a new OTP.' AS Message;
        RETURN;
    END

    -- Validasi Password Baru
    IF dbo.IsValidPasswordPolicy(@NewPassword) = 0
    BEGIN
        -- Mengembalikan pesan kesalahan jika password baru tidak memenuhi kebijakan
        SELECT 'New password does not meet the required policy.' AS Message;
        RETURN;
    END

    -- Memeriksa apakah password baru sesuai dengan konfirmasi password
    IF @NewPassword <> @ConfirmPassword
    BEGIN
        -- Mengembalikan pesan kesalahan jika password baru dan konfirmasi password tidak cocok
        SELECT 'New password and confirm password do not match.' AS Message;
        RETURN;
    END

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Memperbarui password di tabel tbl_accounts
        UPDATE tbl_accounts
        SET password = @NewPassword, is_used = 1
        WHERE id = @Id;

        -- Commit transaction
        COMMIT TRANSACTION;

        -- Mengembalikan pesan keberhasilan
        SELECT 'Password updated successfully.' AS Message;
    END TRY
    BEGIN CATCH
        -- Rollback transaction jika terjadi kesalahan
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

EXEC ForgotPassword @Email = 'akmal@gmail.com', @NewPassword = 'Akmal900!', @ConfirmPassword = 'Akmal900!', @OTP = 9620;