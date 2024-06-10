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
        VALUES (@new_employee_id, @email, @password, @otp, DATEADD(MINUTE, 3, GETDATE()), 0);

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




EXECUTE AddEmployee @first_name = 'Johnyyyy', @last_name = 'Doe', @gender = 'Male', @email = 'johnyyyy@example.com',
                    @phone = '1234567890', @hire_date = '2024-06-10', @salary = 8000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'Password1!', @confirm_password = 'Password1!';

EXECUTE AddEmployee @first_name = 'Zidan', @last_name = 'Akmal', @gender = 'Male', @email = 'dan@gmail.com',
                    @phone = '1234567890', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'Z!d4nnnn', @confirm_password = 'Z!d4nnnn';

EXECUTE AddEmployee @first_name = 'Akmal', @last_name = 'Mahasna', @gender = 'Male', @email = 'akmal@gmail.com',
                    @phone = '088823212', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'Akm4l@ja', @confirm_password = 'Akm4l@ja';

EXECUTE AddEmployee @first_name = 'Ragil', @last_name = 'Ramadhan', @gender = 'Male', @email = 'ragil@gmail.com',
                    @phone = '088823219', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'Ra9!l0990', @confirm_password = 'Ra9!l0990';

EXECUTE AddEmployee @first_name = 'Fahri', @last_name = 'Hanif', @gender = 'Male', @email = 'hnf@gmail.com',
                    @phone = '0213232', @hire_date = '2024-12-11', @salary = 10000000, @manager = 1,
                    @job = 'Manager', @department = 5, @password = 'hanhan12', @confirm_password = 'hanhan12';

select * from  tbl_employees;
select * from tbl_accounts
select * from tbl_job_histories

select * from tbl_jobs
select * from tbl_departments

delete from tbl_job_histories where employee >=1;
delete from tbl_accounts where id >=1;
delete from tbl_employees where id >=1;

 
 DBCC CHECKIDENT ('tbl_employees', RESEED, 0);
 DBCC CHECKIDENT ('tbl_accounts', RESEED, 0);
 DBCC CHECKIDENT ('tbl_job_histories', RESEED, 0);








