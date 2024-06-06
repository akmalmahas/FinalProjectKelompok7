CREATE FUNCTION IsValidEmail (@email VARCHAR(25))
RETURNS BIT
AS
BEGIN
    DECLARE @isValid BIT;
    SET @isValid = 0;

    IF @email LIKE '%_@__%_'
        SET @isValid = 1;

    RETURN @isValid;
END;