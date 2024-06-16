use db_employee;
go

CREATE PROCEDURE DeleteRolesPermission
    @RolesPermissionId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validasi RolesPermissionId
    IF NOT EXISTS (SELECT 1 FROM tbl_role_permissions WHERE id = @RolesPermissionId)
    BEGIN
        THROW 50001, 'RolesPermission ID does not exist.', 1;
        RETURN;
    END

    -- Menghapus data dari tabel roles_permissions
    DELETE FROM tbl_role_permissions
    WHERE id = @RolesPermissionId;

    -- Mengembalikan pesan keberhasilan
    SELECT 'Role permission deleted successfully.' AS Message;
END;
GO