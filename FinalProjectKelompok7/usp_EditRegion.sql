CREATE PROCEDURE EditRegion
    @id INT,
    @name VARCHAR(25)
AS
BEGIN
    -- Memeriksa apakah region dengan ID tersebut ada (Function)
    IF EXISTS (SELECT 1 FROM tbl_regions WHERE id = @id)
    BEGIN
        -- Memperbarui data di tabel Region
        UPDATE tbl_regions
        SET name = @name
        WHERE id = @id;
        
        -- Mengembalikan pesan keberhasilan
        SELECT 'Region updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        -- Mengembalikan pesan kesalahan jika ID tidak ditemukan
        SELECT 'Region with the specified ID does not exist.' AS Message;
    END
END;


EXEC EditRegion @id = 1, @name = 'Afrika';

SELECT * from tbl_regions;