USE db_employee;
GO

CREATE PROCEDURE AddRole
    @name VARCHAR(100)
AS
BEGIN
    INSERT INTO tbl_roles(name)
    VALUES (@name);
END;

