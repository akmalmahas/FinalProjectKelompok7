USE db_employee;
GO

CREATE PROCEDURE EditAccountRoles
    @AccountRoleId INT,
    @NewAccountId INT = NULL,
    @NewRoleId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Validasi Account Role ID
    IF NOT EXISTS (SELECT 1 FROM tbl_account_roles WHERE id = @AccountRoleId)
    BEGIN
        THROW 50001, 'Account Role ID does not exist.', 1;
        RETURN;
    END

    -- Validasi New Account ID jika diberikan
    IF @NewAccountId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM tbl_accounts WHERE id = @NewAccountId)
    BEGIN
        THROW 50002, 'New Account ID does not exist.', 1;
        RETURN;
    END

    -- Validasi New Role ID jika diberikan
    IF @NewRoleId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM tbl_roles WHERE id = @NewRoleId)
    BEGIN
        THROW 50003, 'New Role ID does not exist.', 1;
        RETURN;
    END

    -- Update data di tabel account_roles
    UPDATE tbl_account_roles
    SET account = COALESCE(@NewAccountId, account),
        role = COALESCE(@NewRoleId, role)
    WHERE id = @AccountRoleId;

    -- Mengembalikan pesan keberhasilan
    SELECT 'Account role updated successfully.' AS Message;
END;
