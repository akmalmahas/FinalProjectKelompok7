CREATE PROCEDURE AddPermission
    @name VARCHAR(100)
AS
BEGIN
    INSERT INTO tbl_permissions (name)
    VALUES (@name);
END;

