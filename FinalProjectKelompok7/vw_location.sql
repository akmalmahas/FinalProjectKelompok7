CREATE VIEW vw_location
AS
SELECT Id, street_address, postal_code, city, state_province, country
FROM tbl_locations;