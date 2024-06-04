CREATE PROCEDURE AddDepartment
	@name VARCHAR(30),
	@locations INT
AS
BEGIN
    -- Menambahkan data ke tabel Departments
    INSERT INTO tbl_departments(name, locations)
    VALUES (@name, @locations);
    
    -- Mengembalikan pesan keberhasilan
    SELECT 'Department added successfully.' AS Message;
END;

EXEC AddDepartment @name = 'Engineering', @locations = 1; 

SELECT * FROM tbl_departments;
