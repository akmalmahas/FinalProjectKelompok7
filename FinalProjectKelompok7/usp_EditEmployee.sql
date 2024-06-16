USE db_employee;
GO

CREATE PROCEDURE EditEmployee
    @id INT,
    @first_name VARCHAR(25) = NULL,
    @last_name VARCHAR(25) = NULL,
    @gender VARCHAR(10) = NULL,
    @email VARCHAR(25) = NULL,
    @phone VARCHAR(20) = NULL,
    @hire_date DATE = NULL,
    @salary INT = NULL,
    @manager INT = NULL,
    @job VARCHAR(10) = NULL,
    @department INT= NULL

AS
BEGIN
    -- Validasi ID employee
    IF NOT EXISTS (SELECT 1 FROM tbl_employees WHERE id = @id)
    BEGIN
        THROW 60001, 'Employee ID does not exist.', 1;
        RETURN;
    END

    -- Validasi Gender
    IF @gender IS NOT NULL AND dbo.IsValidGender(@gender) = 0
    BEGIN
        THROW 60002, 'Gender should be either Male or Female.', 1;
        RETURN;
    END

    -- Validasi Email Format
    IF @email IS NOT  NULL AND dbo.IsValidEmail(@email) = 0
    BEGIN
        THROW 60003, 'Invalid email format.', 1;
        RETURN;
    END

    -- Validasi Phone Number
    IF @phone IS NOT NULL AND dbo.IsValidPhoneNumber(@phone) = 0
    BEGIN
        THROW 60004, 'Phone number should only contain numbers.', 1;
        RETURN;
    END

    -- Validasi Manager
    IF @manager IS NOT NULL AND NOT EXISTS (SELECT 1 FROM tbl_employees WHERE id = @manager)
    BEGIN
        THROW 60006, 'Manager ID does not exist.', 1;
        RETURN;
    END

	-- Validasi Salary
	IF @salary IS NOT NULL
    BEGIN
        DECLARE @min_salary INT, @max_salary INT;
        SELECT @min_salary = min_salary, @max_salary = max_salary FROM tbl_jobs WHERE id = COALESCE(@job, (SELECT job FROM tbl_employees WHERE id = @id));
        IF @salary < @min_salary OR @salary > @max_salary
        BEGIN
            THROW 60007, 'Salary should be between the job''s min_salary and max_salary.', 1;
            RETURN;
        END
    END

    -- Memperbarui data di tabel Employees
    UPDATE tbl_employees
    SET 
		first_name = COALESCE(@first_name, first_name),
        last_name = COALESCE(@last_name, last_name),
        gender = COALESCE(@gender, gender),
        email = COALESCE(@email, email),
        phone = COALESCE(@phone, phone),
        hire_date = COALESCE(@hire_date, hire_date),
        salary = COALESCE(@salary, salary),
        manager = COALESCE(@manager, manager),
        job = COALESCE(@job, job),
        department = COALESCE(@department, department)
    WHERE id = @id;

    -- Mengembalikan pesan keberhasilan
    SELECT 'Employee updated successfully.' AS Message;
END;

