USE db_employee;
GO

CREATE VIEW vw_country
AS
SELECT c.id, 
	c.Name, 
	r.name AS Region
FROM tbl_countries c
INNER JOIN tbl_regions r ON c.region = r.id;