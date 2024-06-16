use db_employee;
go

CREATE VIEW vw_Role AS
SELECT 
	id, 
	name
FROM tbl_roles;