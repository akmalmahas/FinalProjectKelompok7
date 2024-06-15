CREATE PROCEDURE EditPermission
    @id INT,
    @name VARCHAR(100)
AS
BEGIN
    -- Memeriksa apakah region dengan ID tersebut ada (Function)
    IF EXISTS (SELECT 1 FROM tbl_permissions WHERE id = @id)
    BEGIN
        -- Memperbarui data di tabel Region
        UPDATE tbl_permissions
        SET name = @name
        WHERE id = @id;
        
        -- Mengembalikan pesan keberhasilan
        SELECT 'Permissions updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        -- Mengembalikan pesan kesalahan jika ID tidak ditemukan
        SELECT 'Permissions with the specified ID does not exist.' AS Message;
    END
END;

