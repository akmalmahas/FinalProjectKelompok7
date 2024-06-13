CREATE VIEW vw_EmployeeDetails AS
SELECT 
    e.id AS employee_id,
    a.username,
    CONCAT(e.first_name, ' ', e.last_name) AS fullname,
    e.gender,
    e.hire_date,
    e.salary,
    e.manager AS manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    e.job,
    d.name AS department_name,
	r.name AS role_name,
    l.street_address AS location_name,
    jh.status AS latest_status
FROM tbl_employees e
LEFT JOIN tbl_accounts a ON e.id = a.id
LEFT JOIN tbl_employees m ON e.manager = m.id
LEFT JOIN tbl_departments d ON e.department = d.id
LEFT JOIN tbl_locations l ON d.locations = l.id
LEFT JOIN tbl_job_histories jh ON e.id = jh.employee
LEFT JOIN tbl_account_roles ar ON a.id = ar.account
LEFT JOIN tbl_roles r ON ar.role = r.id
WHERE 
    jh.start_date = (
        SELECT MAX(jh2.start_date)
        FROM tbl_job_histories jh2
        WHERE jh2.employee = e.id
    );

SELECT * FROM vw_EmployeeDetails;