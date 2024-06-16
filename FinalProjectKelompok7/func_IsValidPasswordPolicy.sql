use db_employee;
go

CREATE FUNCTION dbo.IsValidPasswordPolicy (@password NVARCHAR(255))
RETURNS BIT
AS
BEGIN
    DECLARE @result BIT
    DECLARE @length INT
    DECLARE @hasUpperCase BIT
    DECLARE @hasLowerCase BIT
    DECLARE @hasDigit BIT
    DECLARE @hasSymbol BIT

    -- Check length
    SET @length = LEN(@password)
    IF @length < 8
    BEGIN
        SET @result = 0
        RETURN @result
    END

    -- Check for uppercase letter
    SET @hasUpperCase = CASE WHEN @password COLLATE Latin1_General_BIN LIKE '%[A-Z]%' THEN 1 ELSE 0 END

    -- Check for lowercase letter
    SET @hasLowerCase = CASE WHEN @password COLLATE Latin1_General_BIN LIKE '%[a-z]%' THEN 1 ELSE 0 END

    -- Check for digit
    SET @hasDigit = CASE WHEN @password COLLATE Latin1_General_BIN LIKE '%[0-9]%' THEN 1 ELSE 0 END

    -- Check for symbol
    SET @hasSymbol = CASE WHEN @password COLLATE Latin1_General_BIN LIKE '%[^a-zA-Z0-9]%' THEN 1 ELSE 0 END

    -- Combine results
    IF @hasUpperCase = 1 AND @hasLowerCase = 1 AND @hasDigit = 1 AND @hasSymbol = 1
    BEGIN
        SET @result = 1
    END
    ELSE
    BEGIN
        SET @result = 0
    END

    RETURN @result
END