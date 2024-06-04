CREATE PROCEDURE EditProfile
	@id INT,
    @first_name VARCHAR(25),
    @last_name VARCHAR(25),
    @gender VARCHAR(10),
    @email VARCHAR(25),
    @phone VARCHAR(20),
    @username VARCHAR(25)
AS
BEGIN
    -- Memeriksa apakah ID yang diberikan valid
    IF EXISTS (SELECT 1 FROM tbl_accounts WHERE id = @id)
    BEGIN
            -- Memperbarui data di tabel Job
            UPDATE tbl_accounts
            SET username = COALESCE (@username, username)
            WHERE id = @id;

			UPDATE tbl_employees
            SET first_name = COALESCE (@first_name, first_name),
                last_name = COALESCE (@last_name, last_name),
				gender = COALESCE (@gender, gender),
				phone = COALESCE (@phone, phone),
				email = COALESCE (@email, email)
            WHERE id = @id;

            -- Mengembalikan pesan keberhasilan
            SELECT 'Profile updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        -- Mengembalikan pesan kesalahan jika ID tidak ditemukan
        SELECT 'Profile with the specified username does not exist.' AS Message;
    END
END;