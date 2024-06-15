CREATE PROCEDURE EditRole
    @id INT,
    @name VARCHAR(100)
AS
BEGIN
    -- Memeriksa apakah role dengan ID tersebut ada (Function)
    IF EXISTS (SELECT 1 FROM tbl_roles WHERE id = @id)
    BEGIN
        -- Memperbarui data di tabel Roles
        UPDATE tbl_roles
        SET name = @name
        WHERE id = @id;
        
        -- Mengembalikan pesan keberhasilan
        SELECT 'Role updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        -- Mengembalikan pesan kesalahan jika ID tidak ditemukan
        SELECT 'Role with the specified ID does not exist.' AS Message;
    END
END;

