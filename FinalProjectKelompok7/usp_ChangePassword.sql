CREATE PROCEDURE ChangePassword
    @email VARCHAR(25),
	@password VARCHAR(225),
    @new_password VARCHAR(225),
    @confirm_password VARCHAR(225)
AS
BEGIN
    -- Memeriksa apakah ID yang diberikan valid
    IF EXISTS (SELECT 1 FROM tbl_employees WHERE email = @email)
    BEGIN
            -- Memperbarui data di tabel Job
            UPDATE tbl_employees
            SET email = COALESCE (@email, email)
            WHERE email = @email;

			UPDATE tbl_accounts
            SET password = @password
            WHERE id = @email;

            -- Mengembalikan pesan keberhasilan
            SELECT 'Password updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        -- Mengembalikan pesan kesalahan jika ID tidak ditemukan
        SELECT 'Account with the specified email does not exist.' AS Message;
    END
END;