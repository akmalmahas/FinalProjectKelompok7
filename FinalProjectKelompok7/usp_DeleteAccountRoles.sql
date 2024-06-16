use db_employee;
go

CREATE PROCEDURE DeleteAccountRoles
    @AccountRoleId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validasi Account Role ID
    IF NOT EXISTS (SELECT 1 FROM tbl_account_roles WHERE id = @AccountRoleId)
    BEGIN
        THROW 50001, 'Account Role ID does not exist.', 1;
        RETURN;
    END

    -- Hapus data dari tabel account_roles
    DELETE FROM tbl_account_roles
    WHERE id = @AccountRoleId;

    -- Mengembalikan pesan keberhasilan
    SELECT 'Account role deleted successfully.' AS Message;
END;
