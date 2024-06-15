CREATE VIEW vw_Profile AS
SELECT 
    e.id,
	a.username,
    CONCAT(e.first_name, ' ', e.last_name) AS fullname,
    e.gender,
	e.email,
	e.phone
    
FROM tbl_employees e
INNER JOIN tbl_accounts a ON a.id = e.id

SELECT * FROM vw_Profile where email = 'dan@gmail.com' ;