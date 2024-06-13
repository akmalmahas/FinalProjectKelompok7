CREATE VIEW vw_RolePermission AS
SELECT 
    rp.id AS role_permission_id,
    r.name AS role_name,
    p.name AS permission_name
FROM 
    tbl_role_permissions rp
JOIN 
    tbl_roles r ON rp.role = r.id
JOIN 
    tbl_permissions p ON rp.permission = p.id;

SELECT * FROM vw_RolePermission
