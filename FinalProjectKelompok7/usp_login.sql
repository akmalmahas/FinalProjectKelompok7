CREATE PROCEDURE [dbo].[Login]
    @username VARCHAR(25),
    @password VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id INT;
    DECLARE @stored_password VARCHAR(255);
    DECLARE @current_datetime DATETIME;

    SET @current_datetime = GETDATE();

    -- Mencari ID karyawan berdasarkan username atau email
    SELECT @id = e.id
    FROM tbl_employees e
    INNER JOIN tbl_accounts a ON e.id = a.id
    WHERE CONCAT(e.first_name,'',e.last_name) = @username OR a.username = @username;

    IF @id IS NULL
    BEGIN
        -- Mengembalikan pesan kesalahan jika username atau email tidak ditemukan
        SELECT 'Invalid username or password.' AS Message;
        RETURN;
    END

    -- Memeriksa apakah password cocok
    SELECT @stored_password = password
    FROM tbl_accounts
    WHERE id = @id;

    IF @stored_password <> @password
    BEGIN
        -- Mengembalikan pesan kesalahan jika password tidak cocok
        SELECT 'Invalid username/email or password.' AS Message;
        RETURN;
    END

    -- Mengembalikan pesan keberhasilan
    SELECT 'Login successful.' AS Message;

    -- Mengaktifkan EXECUTE AS USER setelah login berhasil
    DECLARE @login_user VARCHAR(50);
    SELECT @login_user = username FROM tbl_accounts WHERE id = @id; -- Ambil username atau identitas yang sesuai

    EXECUTE AS USER = @login_user; -- Aktifkan EXECUTE AS untuk user yang login
END;
GO

EXEC Login @username = 'SANTIPIA', @password = 'PiaS4nt!';

exec GenerateOTP @Email = 'pia@gmail.com';

select * from tbl_employees



