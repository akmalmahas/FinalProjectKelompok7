CREATE PROCEDURE Register
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
    @password NVARCHAR(100),
    @confirm_password NVARCHAR(100)
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

	-- Validasi Manager
    IF @manager IS NOT NULL AND NOT EXISTS (SELECT 1 FROM tbl_employees WHERE id = @manager)
    BEGIN
        THROW 50005, 'Manager ID does not exist.', 1;
        RETURN;
    END


    -- Validasi Confirm Password
    IF dbo.IsValidPassword(@password, @confirm_password) = 0
    BEGIN
        THROW 50004, 'Password and Confirm Password do not match.', 1;
        RETURN;
    END

    -- Menambahkan data ke tabel Employees
    INSERT INTO tbl_employees (first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department)
    VALUES (@first_name, @last_name, @gender, @email, @phone, @hire_date, @salary, @manager, @job, @department);

    -- Mengembalikan pesan keberhasilan
    SELECT 'Employee added successfully.' AS Message;
END;

EXECUTE Register @first_name = 'Johnyyyy', @last_name = 'Doe', @gender = 'Male', @email = 'johnyyyy@example.com',
                    @phone = '1234567890', @hire_date = '2024-06-10', @salary = 50000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE Register @first_name = 'Zidan', @last_name = 'Akmal', @gender = 'Male', @email = 'dan@gmail.com',
                    @phone = '1234567890', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

select * from  tbl_employees;
select * from tbl_jobs
select * from tbl_departments
select * from tbl_job_histories

delete from tbl_employees where id =4;
 









