use db_employee;
go

CREATE FUNCTION IsValidPassword (@password VARCHAR(255), @confirm_password VARCHAR(255))
RETURNS BIT
AS
BEGIN
    DECLARE @isValid BIT;
    SET @isValid = 0;

    IF @password = @confirm_password
        SET @isValid = 1;

    RETURN @isValid;
END;