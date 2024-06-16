USE db_employee;
GO

CREATE PROCEDURE AddCountry
    @id CHAR(3),
	@name VARCHAR(40),
	@region INT
AS
BEGIN
    -- Menambahkan data ke tabel Country
    INSERT INTO tbl_countries(id, name, region)
    VALUES (@id, @name, @region);
    
    -- Mengembalikan pesan keberhasilan
    SELECT 'Country added successfully.' AS Message;
END;

