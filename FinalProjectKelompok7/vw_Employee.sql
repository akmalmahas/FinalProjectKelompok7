CREATE VIEW vw_Employee AS
SELECT 
    e.id,
    CONCAT(e.first_name, ' ', e.last_name) AS fullname,
    j.id AS job,
    d.id AS department
    
FROM tbl_employees e
INNER JOIN tbl_jobs j ON j.id = e.job
INNER JOIN tbl_departments d ON d.id = e.department;