use db_employee;
go

CREATE VIEW vw_Permission AS
SELECT 
	id, 
	name
FROM tbl_permissions;