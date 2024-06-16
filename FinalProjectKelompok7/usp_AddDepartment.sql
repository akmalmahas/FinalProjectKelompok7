USE db_employee;
GO

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


