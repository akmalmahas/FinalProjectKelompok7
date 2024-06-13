--add region
EXEC AddRegion @name = 'Africa';
EXEC AddRegion @name = 'Asia';
EXEC AddRegion @name = 'America';
EXEC AddRegion @name = 'Europe';
EXEC AddRegion @name = 'Arabia';


Select * from tbl_regions;
delete from tbl_regions where id >= 1;

-- Reset AI
DBCC CHECKIDENT ('tbl_regions', RESEED, 0);
DBCC CHECKIDENT ('tbl_locations', RESEED, 0);
DBCC CHECKIDENT ('tbl_employees', RESEED, 0);
DBCC CHECKIDENT ('tbl_departments', RESEED, 0);
DBCC CHECKIDENT ('tbl_accounts', RESEED, 0);
DBCC CHECKIDENT ('tbl_permissions', RESEED, 0);
DBCC CHECKIDENT ('tbl_roles', RESEED, 0);
DBCC CHECKIDENT ('tbl_permissions', RESEED, 0);
DBCC CHECKIDENT ('tbl_account_roles', RESEED, 0);
DBCC CHECKIDENT ('tbl_role_permissions', RESEED, 0);

--Edit Region
EXEC EditRegion @id =5, @name = 'Antartica';

SELECT * from tbl_regions;

--delete region

EXEC DeleteRegion @id = '5';


--Add Country
EXEC AddCountry @id = 'USA', @name = 'United States of America', @region = 3; 
EXEC AddCountry @id = 'IDN', @name = 'Indonesia', @region = 2; 
EXEC AddCountry @id = 'GER', @name = 'Germany', @region = 4; 

SELECT * FROM tbl_countries;

--Edit Country
EXEC EditCountry @id ='USA', @name = 'America';
EXEC EditCountry @id ='USA', @region = 3;
EXEC EditCountry @id ='USA', @region = 10;

SELECT * FROM tbl_countries;

--Delete Country
EXEC DeleteCountry @id = 'USA';

SELECT * FROM tbl_countries;

--AddPermission 
EXEC AddPermission	@name = 'INSERT';
EXEC AddPermission	@name = 'UPDATE';
EXEC AddPermission	@name = 'DELETE';
EXEC AddPermission	@name = 'SELECT';


SELECT * FROM tbl_permissions

--EditPermission
EXEC EditPermission @id = 4, @name = 'VIEW';

SELECT * FROM tbl_permissions

--DeletePermission
EXEC DeletePermission @id = 1;

SELect* from tbl_permissions

--Add Job
EXEC AddJob @id = 'Engineer', @title = 'Software Engineer', @min_salary = 2500000, @max_salary = 10000000;
EXEC AddJob @id = 'Manager', @title = 'Project Manager', @min_salary = 5000000, @max_salary = 18000000; 
EXEC AddJob @id = 'Directure', @title = 'Directure', @min_salary = 10000000, @max_salary = 25000000; 
EXEC AddJob @id = 'Directures', @title = 'Directures', @min_salary = 10000000, @max_salary = 25000000; 

SELECT * FROM tbl_jobs;

--Edit Job
EXEC EditJob @id = 'Engineer', @title = 'Software Engineer', @min_salary = 3000000, @max_salary = 10000000;
EXEC EditJob @id = 'Engineer', @title = 'Software Engineer', @max_salary = 25000000;
EXEC EditJob @id = 'Engineer', @title = 'Data Engineer';

SELECT * FROM tbl_jobs;

--Delete Job
EXEC DeleteJob @id = 'Directures';

SELECT * FROM tbl_jobs;

--AddRoles
EXEC AddRole  @name = 'SuperAdmin';
EXEC AddRole  @name = 'Admin';
EXEC AddRole  @name = 'Manager';
EXEC AddRole  @name = 'Employee';

SELECT * FROM tbl_roles

--EditRole
EXEC EditRole @id = 1, @name = 'Super Admin';

SELECT * FROM tbl_roles

--DeleteRole
EXEC DeleteRole @id = 1;

SELECT * FROM tbl_roles

--AddLocation
EXEC AddLocation @street_address= 'Street 1', @postal_code='13200', @city = 'Brooklyn', @state_province = 'New York' , @country='USA'; 
EXEC AddLocation @street_address= 'Jalan Kenangan', @postal_code='18293', @city = 'Bekasi', @state_province = 'Jawa Barat' , @country='IDN';
EXEC AddLocation @street_address= 'Street Socher', @postal_code='99991', @city = 'Berlin', @state_province = 'Eastern Germany' , @country='GER';

SELECT * FROM tbl_locations;

--EditLocation
EXEC EditLocation @id=1, @street_address= 'Street 2', @postal_code='13200', @city = 'Brooklyn', @state_province = 'New York' , @country='USA'; 
EXEC EditLocation @id=1, @postal_code='20101';

SELECT * FROM tbl_locations;

--DeleteLocation
EXEC Deletelocation @id = '1';

SELECT * FROM tbl_locations;

--AddDepartment
EXEC AddDepartment @name = 'Engineering', @locations = 2; 
EXEC AddDepartment @name = 'Technical', @locations = 1; 
EXEC AddDepartment @name = 'Marketing', @locations = 3; 


SELECT * FROM tbl_departments;

--EditDepartment
EXEC EditDepartment @id = 3, @name = 'Officer', @locations=1;

SELECT * from tbl_departments;

--Delete Department
EXEC DeleteDepartment @id = '4';

--EXEC DELETE Employee
EXEC DeleteEmployee @id = '3';

SELECT * FROM tbl_employees;

SELECT * FROM tbl_departments;

--Add Employee


EXECUTE AddEmployee @first_name = 'Johnyyyy', @last_name = 'Doe', @gender = 'Male', @email = 'johnyyyy@example.com',
                    @phone = '1234567890', @hire_date = '2024-06-10', @salary = 8000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE AddEmployee @first_name = 'Zidan', @last_name = 'Akmal', @gender = 'Male', @email = 'dan@gmail.com',
                    @phone = '1234567890', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE AddEmployee @first_name = 'Akmal', @last_name = 'Mahasna', @gender = 'Male', @email = 'akmal@gmail.com',
                    @phone = '088823212', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE AddEmployee @first_name = 'Ragil', @last_name = 'Ramadhan', @gender = 'Male', @email = 'ragil@gmail.com',
                    @phone = '088823219', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE AddEmployee @first_name = 'Fahri', @last_name = 'Hanif', @gender = 'Male', @email = 'hnf@gmail.com',
                    @phone = '0213232', @hire_date = '2024-12-11', @salary = 10000000, @manager = 1,
                    @job = 'Manager', @department = 5, @password = 'hanhan12', @confirm_password = 'hanhan12';

select * from  tbl_employees;
select * from tbl_accounts
select * from tbl_jobs
select * from tbl_departments
select * from tbl_job_histories


delete from tbl_employees where id >=1;
delete from tbl_accounts where id >=1;
 
 DBCC CHECKIDENT ('tbl_employees', RESEED, 0);
 DBCC CHECKIDENT ('tbl_accounts', RESEED, 0);


--Edit Employee

EXECUTE EditEmployee @id='1', @first_name = 'Johnyyyy', @last_name = 'Doe', @gender = 'Male', @email = 'johnyyyy@example.com',
                    @phone = '1234567890', @hire_date = '2024-06-10', @salary = 50000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE EditEmployee id='2', @first_name = 'Zidan', @last_name = 'Akmal', @gender = 'Male', @email = 'dan@gmail.com',
                    @phone = '1234567890', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE EditEmployee @id='1', @first_name = 'Johny',@email = 'Johny123@gmail.com' --,@gender = 'laki-laki';

EXECUTE EditEmployee @id='3', @manager=3, @salary=1900000;

EXECUTE EditEmployee @id='2', @email= 'zidan@gmail.com';

select * from  tbl_employees;
select * from tbl_accounts;

--EXEC DELETE Employee
EXEC DeleteEmployee @id = '3';

--CHANGE PASSWORD
EXEC ChangePassword @email = 'Johny123@gmail.com', @password = 'akmal123', @new_password = 'akmal1234', @confirm_password = 'akmal1234';

SELECT * FROM tbl_employees;

SELECT * FROM tbl_departments;

--Edit Profile
EXEC EditProfile @id =2, @username ='zidan1@gmail.com', @email='zidan1@gmail.com';
EXEC EditProfile @id =5, @username ='hanifuyee1', @email='nif@gmail.com';

SELECT * FROM tbl_accounts;
SELECT * FROM tbl_employees;


--VIEW
SELECT * FROM vw_Region;

SELECT * FROM vw_Job;

SELECT * FROM vw_Department;

SELECT * FROM vw_Country;

SELECT * FROM vw_Location;

SELECT * FROM vw_Role;

SELECT * FROM vw_Permission;

SELECT * FROM vw_Employee;

--Hapus Trigger
DROP TRIGGER trg_AfterInsertEmployee;
DROP TRIGGER trg_AfterUpdateEmployeeJob;
DROP TRIGGER trg_AfterDeleteEmployee;

--add role permission
Exec AddRolesPermission @RoleId = 1 , @PermissionId = 1;
Exec AddRolesPermission @RoleId = 1 , @PermissionId = 2;
Exec AddRolesPermission @RoleId = 1 , @PermissionId = 3;
Exec AddRolesPermission @RoleId = 1 , @PermissionId = 4;
Exec AddRolesPermission @RoleId = 2 , @PermissionId = 1;
Exec AddRolesPermission @RoleId = 2 , @PermissionId = 2;
Exec AddRolesPermission @RoleId = 2 , @PermissionId = 3;
Exec AddRolesPermission @RoleId = 2 , @PermissionId = 4;
Exec AddRolesPermission @RoleId = 3 , @PermissionId = 2;
Exec AddRolesPermission @RoleId = 3 , @PermissionId = 4;
Exec AddRolesPermission @RoleId = 4 , @PermissionId = 2;
Exec AddRolesPermission @RoleId = 4 , @PermissionId = 4;

select * from tbl_role_permissions;
select * from tbl_permissions;

delete from tbl_role_permissions where role >= 1;

DBCC CHECKIDENT ('tbl_role_permissions', RESEED, 0);

--edit role_permissions
Exec EditRolesPermission @RolesPermissionId = 12 , @RoleId = 4 , @PermissionId = 4;


--delete role_permissions
Exec DeleteRolesPermission @RolesPermissionId = 12;


--add account roles
exec AddAccountRoles @AccountId= , @RoleId= ;
exec AddAccountRoles @AccountId= , @RoleId= ;
exec AddAccountRoles @AccountId= , @RoleId= ;
exec AddAccountRoles @AccountId= , @RoleId= ;

--edit account roles
exec EditAccountRoles @AccountRoleId = , @NewAccountId= , @NewRoleId= ;
exec EditAccountRoles @AccountRoleId = , @NewAccountId= , @NewRoleId= ;
exec EditAccountRoles @AccountRoleId = , @NewAccountId= , @NewRoleId= ;
exec EditAccountRoles @AccountRoleId = , @NewRoleId= ;

--delete account roles
exec DeleteAccountRoles @AccountRoleId = ;


--add employee +trigger
EXECUTE AddEmployee @first_name = 'Johnyyyy', @last_name = 'Doe', @gender = 'Male', @email = 'johnyyyy@example.com',
                    @phone = '1234567890', @hire_date = '2024-06-10', @salary = 8000000, @manager = null,
                    @job = 'Directure', @department = 1, @password = 'Password1!', @confirm_password = 'Password1!';

EXECUTE AddEmployee @first_name = 'Zidan', @last_name = 'Akmal', @gender = 'Male', @email = 'dan@gmail.com',
                    @phone = '1234567890', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 1, @password = 'Z!d4nnnn', @confirm_password = 'Z!d4nnnn';

EXECUTE AddEmployee @first_name = 'Akmal', @last_name = 'Mahasna', @gender = 'Male', @email = 'akmal@gmail.com',
                    @phone = '088823212', @hire_date = '2024-10-01', @salary = 5000000, @manager = 2,
                    @job = 'Engineer', @department = 3, @password = 'Akm4l@ja', @confirm_password = 'Akm4l@ja';

EXECUTE AddEmployee @first_name = 'Ragil', @last_name = 'Ramadhan', @gender = 'Male', @email = 'ragil@gmail.com',
                    @phone = '088823219', @hire_date = '2024-10-01', @salary = 5000000, @manager = 1,
                    @job = 'Engineer', @department = 3, @password = 'Ra9!l0990', @confirm_password = 'Ra9!l0990';

EXECUTE AddEmployee @first_name = 'Fahri', @last_name = 'Hanif', @gender = 'Male', @email = 'hnf@gmail.com',
                    @phone = '0213232', @hire_date = '2024-12-11', @salary = 10000000, @manager = 3,
                    @job = 'Engineer', @department = 1, @password = '!hanhaN12', @confirm_password = '!hanhaN12';

EXECUTE AddEmployee @first_name = 'Putri', @last_name = 'Mila', @gender = 'Female', @email = 'mila@gmail.com',
                    @phone = '08291222', @hire_date = '2024-09-09', @salary = 10000000, @manager = 3,
                    @job = 'Engineer', @department = 1, @password = 'Mila5@qq', @confirm_password = 'Mila5@qq';


select * from  tbl_employees;
select * from tbl_accounts
select * from tbl_job_histories

delete from tbl_job_histories where employee >=1;
delete from tbl_accounts where id >=1;
delete from tbl_employees where id >=1;

 
 DBCC CHECKIDENT ('tbl_employees', RESEED, 0);
 DBCC CHECKIDENT ('tbl_accounts', RESEED, 0);
 DBCC CHECKIDENT ('tbl_job_histories', RESEED, 0);

--login
EXEC Login @username_or_email = 'akmal@gmail.com', @password = 'Akm4l@ja1';

--OTP
EXEC GenerateOTP @Email = 'akmal@gmail.com';

--FORGOT PASSWORD
EXEC ForgotPassword @Email = 'akmal@gmail.com', @NewPassword = 'Akmal900!', @ConfirmPassword = 'Akmal900!', @OTP = 5520;

--edit employee + trigger
EXECUTE EditEmployee @id='2', @job= 'Engineer';
EXECUTE EditEmployee @id='9', @job= 'Manager';

--Delete employee +triger
exec DeleteEmployee @id = 9;

-- Disable constraint
ALTER TABLE tbl_job_histories NOCHECK CONSTRAINT FK_tbl_job_histories_tbl_employees;

-- Perform data cleanup or error correction tasks

-- Re-enable constraint
ALTER TABLE tbl_job_histories WITH CHECK CHECK CONSTRAINT FK_tbl_job_histories_tbl_employees;


--vw_EmployeeDetails
DBCC CHECKIDENT ('tbl_account_roles', RESEED, 0);
EXEC AddAccountRoles @AccountId = 1, @RoleId = 1;
EXEC AddAccountRoles @AccountId = 2, @RoleId = 2;
EXEC AddAccountRoles @AccountId = 3, @RoleId = 3;
EXEC AddAccountRoles @AccountId = 4, @RoleId = 4;
EXEC AddAccountRoles @AccountId = 8, @RoleId = 4;

EXEC DeleteAccountRoles @AccountRoleId  = 6;

select * from vw_RolePermission
select * from tbl_account_roles
select * from tbl_roles

SELECT * FROM vw_EmployeeDetails;

DELETE FROM tbl_roles WHERE ID >= 1;

DBCC CHECKIDENT ('tbl_roles', RESEED, 0);
DBCC CHECKIDENT ('tbl_account_roles', RESEED, 0);

DBCC CHECKIDENT ('tbl_account_roles')
EXEC EditAccountRoles @AccountRoleId = 2, @NewAccountId = 2, @NewRoleId = 2;
EXEC EditAccountRoles @AccountRoleId = 4, @NewAccountId = 8, @NewRoleId = 4;