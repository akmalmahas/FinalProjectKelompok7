CREATE PROCEDURE EditRegion
    @id INT,
    @name VARCHAR(25)
AS
BEGIN
    -- Memperbarui nama region berdasarkan ID
    UPDATE tbl_regions
    SET name = @name
    WHERE id = @id;

    -- Mengembalikan pesan keberhasilan
    IF @@ROWCOUNT > 0
        SELECT 'Region updated successfully.' AS Message;
    ELSE
        SELECT 'Region with the specified ID does not exist.' AS Message;
END;


