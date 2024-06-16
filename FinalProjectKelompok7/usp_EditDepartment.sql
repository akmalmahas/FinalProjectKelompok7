USE db_employee;
GO

CREATE PROCEDURE EditDepartment
    @id INT,
    @name VARCHAR(30)= NULL,
	@locations INT =NULL
AS
BEGIN
    -- Memeriksa apakah region dengan ID tersebut ada 
    IF EXISTS (SELECT 1 FROM tbl_departments WHERE id = @id)
    BEGIN
        -- Memperbarui data di tabel Departments
        UPDATE tbl_departments
        SET 
			name = COALESCE (@name, name),
			locations = COALESCE (@locations, locations)
        WHERE id = @id;
        
        -- Mengembalikan pesan keberhasilan
        SELECT 'Department updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        -- Mengembalikan pesan kesalahan jika ID tidak ditemukan
        SELECT 'Department with the specified ID does not exist.' AS Message;
    END
END;


