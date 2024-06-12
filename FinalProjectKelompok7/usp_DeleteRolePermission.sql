CREATE PROCEDURE DeleteRolesPermission
    @RolesPermissionId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validasi RolesPermissionId
    IF NOT EXISTS (SELECT 1 FROM roles_permissions WHERE id = @RolesPermissionId)
    BEGIN
        THROW 50001, 'RolesPermission ID does not exist.', 1;
        RETURN;
    END

    -- Menghapus data dari tabel roles_permissions
    DELETE FROM roles_permissions
    WHERE id = @RolesPermissionId;

    -- Mengembalikan pesan keberhasilan
    SELECT 'Role permission deleted successfully.' AS Message;
END;
GO