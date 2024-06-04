CREATE PROCEDURE AddCountry
    @id CHAR(3),
	@name VARCHAR(40),
	@region INT
AS
BEGIN
    -- Menambahkan data ke tabel Region
    INSERT INTO tbl_countries(id, name, region)
    VALUES (@id, @name, @region);
    
    -- Mengembalikan pesan keberhasilan
    SELECT 'Country added successfully.' AS Message;
END;

EXEC AddCountry @id = 'USA', @name = 'United States of America', @region = 1; 

SELECT * FROM tbl_countries;