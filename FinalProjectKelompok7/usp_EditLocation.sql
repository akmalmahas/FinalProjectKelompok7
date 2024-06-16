USE db_employee;
GO

CREATE PROCEDURE EditLocation
	@id int,
    @street_address varchar (40)= NULL,
	@postal_code Varchar (12)= NULL,
	@city varchar (30)= NULL,
	@state_province Varchar (25)= NULL,
	@country CHAR (3)= NULL
AS
BEGIN
    -- Memeriksa apakah ID yang diberikan valid
    IF EXISTS (SELECT 1 FROM tbl_locations WHERE id = @id)
    BEGIN
            -- Memperbarui data di tabel locations
            UPDATE tbl_locations
            SET 
				street_address = COALESCE (@street_address, street_address),
                postal_code = COALESCE (@postal_code, postal_code),
				city = COALESCE (@city, city),
				state_province = COALESCE (@state_province, state_province),
				country = COALESCE (@country, country)
            WHERE id = @Id;

            -- Mengembalikan pesan keberhasilan
            SELECT 'Location updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        -- Mengembalikan pesan kesalahan jika ID tidak ditemukan
        SELECT 'Location with the specified ID does not exist.' AS Message;
    END
END;

