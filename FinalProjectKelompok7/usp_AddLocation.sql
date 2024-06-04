CREATE PROCEDURE AddLocation
    @street_address varchar (40),
	@postal_code Varchar (12),
	@city varchar (30),
	@state_province Varchar (25),
	@country CHAR (3)
AS
BEGIN
    -- Menambahkan data ke tabel Location
    INSERT INTO tbl_locations (street_address, postal_code, city, state_province, country)
    VALUES (@street_address, @postal_code, @city, @state_province, @country);
    
    -- Mengembalikan pesan keberhasilan
    SELECT 'Location added successfully.' AS Message;
END;

EXEC AddLocation @street_address= 'Jalan Perjuangan 1', @postal_code='13200', @city = 'Brooklyn', @state_province = 'New York' , @country='USA'; 

SELECT * FROM tbl_locations;
