CREATE PROCEDURE AddRole
    @name VARCHAR(100)
AS
BEGIN
    INSERT INTO tbl_roles(name)
    VALUES (@name);
END;

--AddRoles
EXEC AddRole  @name = 'db_owner';

SELECT * FROM tbl_roles