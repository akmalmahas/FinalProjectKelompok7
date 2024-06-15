CREATE PROCEDURE ChangePassword
    @email VARCHAR(25),
    @password VARCHAR(225),
    @new_password VARCHAR(225),
    @confirm_password VARCHAR(225)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id INT;
    DECLARE @currentpassword VARCHAR(225);

    -- Memeriksa apakah email ada di tabel tbl_employees
    SELECT @id = id
    FROM tbl_employees
    WHERE email = @email;

    IF @id IS NULL
    BEGIN
        -- Mengembalikan pesan kesalahan jika email tidak ditemukan
        SELECT 'Account with the specified email does not exist.' AS Message;
        RETURN;
    END

    -- Memeriksa apakah password lama cocok
    SELECT @currentpassword = password
    FROM tbl_accounts
    WHERE id = @id;

    IF @currentpassword <> @password
    BEGIN
        -- Mengembalikan pesan kesalahan jika password lama tidak cocok
        SELECT 'Old password does not match.' AS Message;
        RETURN;
    END

    -- Memeriksa apakah password baru sesuai dengan konfirmasi password
    IF @new_password <> @confirm_password
    BEGIN
        -- Mengembalikan pesan kesalahan jika password baru dan konfirmasi password tidak cocok
        SELECT 'New password and confirm password do not match.' AS Message;
        RETURN;
    END

    -- Validasi Password Policy untuk password baru
    IF dbo.IsValidPasswordPolicy(@new_password) = 0
    BEGIN
        -- Mengembalikan pesan kesalahan jika password baru tidak valid
        SELECT 'New password does not meet the required policy.' AS Message;
        RETURN;
    END

    -- Memperbarui password di tabel tbl_accounts
    UPDATE tbl_accounts
    SET password = @new_password
    WHERE id = @id;

    -- Mengembalikan pesan keberhasilan
    SELECT 'Password updated successfully.' AS Message;
END;
GO


