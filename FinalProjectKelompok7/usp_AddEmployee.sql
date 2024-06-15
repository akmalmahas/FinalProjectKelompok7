CREATE PROCEDURE AddEmployee
    @first_name VARCHAR(25),
    @last_name VARCHAR(25),
    @gender VARCHAR(10),
    @email VARCHAR(25),
    @phone VARCHAR(20),
    @hire_date DATE,
    @salary INT,
    @manager INT,
    @job VARCHAR(10),
    @department INT,
    @password VARCHAR(255),
    @confirm_password VARCHAR(255)
AS
BEGIN
    -- Validasi Gender
    IF dbo.IsValidGender(@gender) = 0
    BEGIN
        THROW 50001, 'Gender should be either Male or Female.', 1;
        RETURN;
    END

    -- Validasi Email Format
    IF dbo.IsValidEmail(@email) = 0
    BEGIN
        THROW 50002, 'Invalid email format.', 1;
        RETURN;
    END

    -- Validasi Phone Number
    IF dbo.IsValidPhoneNumber(@phone) = 0
    BEGIN
        THROW 50003, 'Phone number should only contain numbers.', 1;
        RETURN;
    END

	-- Validasi Password Policy
	IF dbo.IsValidPasswordPolicy(@password) = 0
	BEGIN
		THROW 50007, 'Password does not meet the required policy.', 1;
		RETURN;
	END

    -- Validasi Confirm Password
    IF dbo.IsValidPassword(@password, @confirm_password) = 0
    BEGIN
        THROW 50004, 'Password and Confirm Password do not match.', 1;
        RETURN;
    END

    -- Validasi Manager
    IF @manager IS NOT NULL AND NOT EXISTS (SELECT 1 FROM tbl_employees WHERE id = @manager)
    BEGIN
        THROW 50005, 'Manager ID does not exist.', 1;
        RETURN;
    END

    -- Validasi Salary
    DECLARE @min_salary INT, @max_salary INT;
    SELECT @min_salary = min_salary, @max_salary = max_salary FROM tbl_jobs WHERE id = @job;
    IF @salary < @min_salary OR @salary > @max_salary
    BEGIN
        THROW 50006, 'Salary should be between the job''s min_salary and max_salary.', 1;
        RETURN;
    END

	-- Generate random OTP
	DECLARE @otp INT;
    SET @otp = (CAST((RAND() * 10000) AS INT) % 9000) + 1000; -- Generate random number between 1000 and 9999

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Menambahkan data ke tabel Employees
        INSERT INTO tbl_employees (first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department)
        VALUES (@first_name, @last_name, @gender, @email, @phone, @hire_date, @salary, @manager, @job, @department);

        -- Ambil ID yang baru saja dimasukkan
        DECLARE @new_employee_id INT;
        SET @new_employee_id = SCOPE_IDENTITY();

        -- Mengizinkan penyisipan nilai eksplisit ke kolom identitas di tabel tbl_accounts
        SET IDENTITY_INSERT tbl_accounts ON;

        -- Menambahkan data ke tabel Accounts
        INSERT INTO tbl_accounts (id, username, password, otp, is_expired, is_used)
        VALUES (@new_employee_id, CONCAT(@first_name,'',@last_name), @password, @otp, DATEADD(MINUTE, 3, GETDATE()), 0);

        -- Menonaktifkan kembali penyisipan nilai eksplisit ke kolom identitas
        SET IDENTITY_INSERT tbl_accounts OFF;

        -- Commit transaction
        COMMIT TRANSACTION;

        -- Mengembalikan pesan keberhasilan
        SELECT 'Employee and account added successfully.' AS Message;
    END TRY
    BEGIN CATCH
        -- Rollback transaction jika terjadi kesalahan
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;










