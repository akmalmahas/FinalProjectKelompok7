USE db_employee;
GO

CREATE PROCEDURE AddRolesPermission
    @RoleId INT,
    @PermissionId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validasi Role ID
    IF NOT EXISTS (SELECT 1 FROM tbl_roles WHERE id = @RoleId)
    BEGIN
        THROW 50001, 'Role ID does not exist.', 1;
        RETURN;
    END

    -- Validasi Permission ID
    IF NOT EXISTS (SELECT 1 FROM tbl_permissions WHERE id = @PermissionId)
    BEGIN
        THROW 50002, 'Permission ID does not exist.', 1;
        RETURN;
    END

    -- Menambahkan data ke tabel roles_permissions
    INSERT INTO tbl_role_permissions (role, permission)
    VALUES (@RoleId, @PermissionId);

    -- Mengembalikan pesan keberhasilan
    SELECT 'Role permission added successfully.' AS Message;
END;
GO