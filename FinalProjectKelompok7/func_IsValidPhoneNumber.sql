CREATE FUNCTION IsValidPhoneNumber (@phone VARCHAR(20))
RETURNS BIT
AS
BEGIN
    DECLARE @isValid BIT;
    SET @isValid = 0;

    IF ISNUMERIC(@phone) = 1
        SET @isValid = 1;

    RETURN @isValid;
END;