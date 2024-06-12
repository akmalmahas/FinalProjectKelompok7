CREATE PROCEDURE EditRolesPermission
    @RolesPermissionId INT,
    @RoleId INT = NULL,
    @PermissionId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Validasi RolesPermissionId
    IF NOT EXISTS (SELECT 1 FROM roles_permissions WHERE id = @RolesPermissionId)
    BEGIN
        THROW 50001, 'RolesPermission ID does not exist.', 1;
        RETURN;
    END

    -- Validasi Role ID jika diberikan
    IF @RoleId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM roles WHERE id = @RoleId)
    BEGIN
        THROW 50002, 'Role ID does not exist.', 1;
        RETURN;
    END

    -- Validasi Permission ID jika diberikan
    IF @PermissionId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM permissions WHERE id = @PermissionId)
    BEGIN
        THROW 50003, 'Permission ID does not exist.', 1;
        RETURN;
    END

    -- Update data di tabel roles_permissions
    UPDATE roles_permissions
    SET role_id = COALESCE(@RoleId, role_id),
        permission_id = COALESCE(@PermissionId, permission_id)
    WHERE id = @RolesPermissionId;

    -- Mengembalikan pesan keberhasilan
    SELECT 'Role permission updated successfully.' AS Message;
END;
GO