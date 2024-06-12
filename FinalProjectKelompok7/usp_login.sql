CREATE PROCEDURE Login
    @username_or_email VARCHAR(25),
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
    WHERE e.email = @username_or_email OR a.username = @username_or_email;

    IF @id IS NULL
    BEGIN
        -- Mengembalikan pesan kesalahan jika username atau email tidak ditemukan
        SELECT 'Invalid username/email or password.' AS Message;
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

    -- Memeriksa apakah OTP masih berlaku dan belum digunakan
    DECLARE @otp INT, @is_expired DATETIME, @is_used BIT;
    SELECT @otp, @is_expired, @is_used
    FROM tbl_accounts
    WHERE id = @id;

    IF @current_datetime > @is_expired OR @is_used = 1
    BEGIN
        -- Mengembalikan pesan kesalahan jika OTP sudah kadaluarsa atau sudah digunakan
        SELECT 'OTP is expired or already used. Please request a new OTP.' AS Message;
        RETURN;
    END

    -- Mengatur OTP sebagai digunakan
    UPDATE tbl_accounts
    SET is_used = 1
    WHERE id = @id;

    -- Mengembalikan pesan keberhasilan
    SELECT 'Login successful.' AS Message;
END;
GO

EXEC Login @username_or_email = 'akmal@gmail.com', @password = 'Akm4l@ja';