CREATE VIEW vw_Department
AS
SELECT d.id,
	d.name,
	CONCAT(l.street_address, ', ', l.city) AS location
FROM tbl_departments d
INNER JOIN tbl_locations l ON d.locations = l.id;

SELECT * FROM vw_Department;