CREATE PROCEDURE EditProfile
    @id INT,
    @first_name VARCHAR(25) = NULL,
    @last_name VARCHAR(25) = NULL,
    @gender VARCHAR(10) = NULL,
    @email VARCHAR(25) = NULL,
    @phone VARCHAR(20) = NULL,
    @username VARCHAR(25) = NULL
AS
BEGIN
    -- Validasi ID karyawan
    IF NOT EXISTS (SELECT 1 FROM tbl_employees WHERE id = @id)
    BEGIN
        THROW 70001, 'Employee ID does not exist.', 1;
        RETURN;
    END

    -- Validasi Gender
    IF @gender IS NOT NULL AND dbo.IsValidGender(@gender) = 0
    BEGIN
        THROW 70002, 'Gender should be either Male or Female.', 1;
        RETURN;
    END

    -- Validasi Email Format
    IF @email IS NOT NULL AND dbo.IsValidEmail(@email) = 0
    BEGIN
        THROW 70003, 'Invalid email format.', 1;
        RETURN;
    END

    -- Validasi Phone Number
    IF @phone IS NOT NULL AND dbo.IsValidPhoneNumber(@phone) = 0
    BEGIN
        THROW 70004, 'Phone number should only contain numbers.', 1;
        RETURN;
    END

    -- Memperbarui data di tabel tbl_employees
    UPDATE tbl_employees
    SET first_name = COALESCE(@first_name, first_name),
        last_name = COALESCE(@last_name, last_name),
        gender = COALESCE(@gender, gender),
        email = COALESCE(@email, email),
        phone = COALESCE(@phone, phone)
    WHERE id = @id;

    -- Memperbarui data di tabel tbl_accounts
    IF @username IS NOT NULL
    BEGIN
        UPDATE tbl_accounts
        SET username = @username
        WHERE id = @id;
    END

    -- Mengembalikan pesan keberhasilan
    SELECT 'Profile updated successfully.' AS Message;
END;


EXEC EditProfile @id =2, @username ='zidan1@gmail.com', @email='zidan1@gmail.com';
EXEC EditProfile @id =5, @username ='hanifuyee1', @email='nif@gmail.com';

SELECT * FROM tbl_accounts;
SELECT * FROM tbl_employees;