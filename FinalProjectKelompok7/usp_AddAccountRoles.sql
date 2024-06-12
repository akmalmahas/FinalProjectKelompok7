CREATE PROCEDURE AddAccountRoles
    @AccountId INT,
    @RoleId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validasi Account ID
    IF NOT EXISTS (SELECT 1 FROM tbl_accounts WHERE id = @AccountId)
    BEGIN
        THROW 50001, 'Account ID does not exist.', 1;
        RETURN;
    END

    -- Validasi Role ID
    IF NOT EXISTS (SELECT 1 FROM tbl_roles WHERE id = @RoleId)
    BEGIN
        THROW 50002, 'Role ID does not exist.', 1;
        RETURN;
    END

    -- Cek apakah entri sudah ada sebelumnya
    IF EXISTS (SELECT 1 FROM tbl_account_roles WHERE account = @AccountId AND role = @RoleId)
    BEGIN
        THROW 50003, 'Account already has the specified role.', 1;
        RETURN;
    END

    -- Tambahkan entri ke tabel account_roles
    INSERT INTO tbl_account_roles (account, role)
    VALUES (@AccountId, @RoleId);

    -- Mengembalikan pesan keberhasilan
    SELECT 'Account role added successfully.' AS Message;
END;
