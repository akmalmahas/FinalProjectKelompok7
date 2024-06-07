CREATE VIEW vw_EmployeeDetails AS
SELECT 
    id,
    CONCAT(first_name, ' ', last_name) AS fullname,
    gender,
    email, 
	phone, 
	hire_date, 
	salary, 
	manager, 
	job, 
	department
FROM tbl_employees

SELECT * FROM vw_EmployeeDetails;