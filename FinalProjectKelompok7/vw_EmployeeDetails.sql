CREATE VIEW vw_EmployeeDetails AS
SELECT 
    e.id,
    CONCAT(e.first_name, ' ', e.last_name) AS fullname,
    e.gender,
    e.email, 
	e.hire_date, 
	e.salary,
	e.last_name AS manager_name,
	e.manager,
	e.job, 
	e.department,
	d.locations,
	jh.status
FROM tbl_employees e
INNER JOIN tbl_departments d ON e.department = d.id
INNER JOIN tbl_job_histories jh ON d.id = jh.department

SELECT * FROM vw_EmployeeDetail;