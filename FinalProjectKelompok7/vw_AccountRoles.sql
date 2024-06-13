CREATE VIEW vw_account_roles AS
SELECT 
    ar.id AS account_role_id,
    a.username ,
    r.name
FROM 
    tbl_account_roles ar
JOIN 
    tbl_accounts a ON ar.account = a.id
JOIN 
    tbl_roles r ON ar.role = r.id;
