CREATE PROCEDURE AddJob
    @id VARCHAR(10),
	@title VARCHAR(35),
	@min_salary INT,
	@max_salary INT
AS
BEGIN
    -- Menambahkan data ke tabel Job
    INSERT INTO tbl_jobs(id, title, min_salary, max_salary)
    VALUES (@id, @title, @min_salary, @max_salary);
    
    -- Mengembalikan pesan keberhasilan
    SELECT 'Job added successfully.' AS Message;
END;

EXEC AddJob @id = 'Engineer', @title = 'Software Engineer', @min_salary = 2500000, @max_salary = 10000000;
EXEC AddJob @id = 'Manager', @title = 'Project Manager', @min_salary = 5000000, @max_salary = 18000000; 

SELECT * FROM tbl_jobs;