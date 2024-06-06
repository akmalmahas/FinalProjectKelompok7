--add region
EXEC AddRegion @name = 'Africa';
EXEC AddRegion @name = 'Asia';
EXEC AddRegion @name = 'America';
EXEC AddRegion @name = 'Europe';

Select * from tbl_regions;


-- Reset AI
DBCC CHECKIDENT ('tbl_regions', RESEED, 3);
DBCC CHECKIDENT ('tbl_employees', RESEED, 1);

--Edit Region
EXEC EditRegion @id = 1, @name = 'Afrika';

SELECT * from tbl_regions;

--delete region

EXEC DeleteRegion @id = '4';


--Add Country
EXEC AddCountry @id = 'USA', @name = 'United States of America', @region = 1; 

SELECT * FROM tbl_countries;

--Edit Country
EXEC EditCountry @id ='USA', @name = 'United States of Americaaaaaa';
EXEC EditCountry @id ='USA', @region = 4;
EXEC EditCountry @id ='USA', @region = 10;

SELECT * FROM tbl_countries;

--Delete Country
EXEC DeleteCountry @id = 'USA';

SELECT * FROM tbl_countries;

--AddPermission 
EXEC AddPermission	@name = 'GRANT UPDATE';

SELECT * FROM tbl_permissions

--EditPermission
EXEC EditPermission @id = 1, @name = 'GRANT INSERT';

SELECT * FROM tbl_permissions

--DeletePermission
EXEC DeletePermission @id = 1;

SELect* from tbl_permissions

--Add Job
EXEC AddJob @id = 'Engineer', @title = 'Software Engineer', @min_salary = 2500000, @max_salary = 10000000;
EXEC AddJob @id = 'Manager', @title = 'Project Manager', @min_salary = 5000000, @max_salary = 18000000; 

SELECT * FROM tbl_jobs;

--Edit Job
EXEC EditJob @id = 'Engineer', @title = 'Software Engineer', @min_salary = 3000000, @max_salary = 10000000;
EXEC EditJob @id = 'Engineer', @title = 'Software Engineer', @max_salary = 25000000;
EXEC EditJob @id = 'Engineer', @title = 'Data Engineer';

SELECT * FROM tbl_jobs;

--Delete Job
EXEC DeleteJob @id = 'Engineer';

SELECT * FROM tbl_jobs;

--AddRoles
EXEC AddRole  @name = 'db_owner';

SELECT * FROM tbl_roles

--EditRole
EXEC EditRole @id = 1, @name = 'db_accessadmin';

SELECT * FROM tbl_roles

--DeleteRole
EXEC DeleteRole @id = 1;

SELECT * FROM tbl_roles

--AddLocation
EXEC AddLocation @street_address= 'Jalan Perjuangan 1', @postal_code='13200', @city = 'Brooklyn', @state_province = 'New York' , @country='USA'; 

SELECT * FROM tbl_locations;

--EditLocation
EXEC EditLocation @id=1, @street_address= 'Jalan Perjuangan 2', @postal_code='13200', @city = 'Brooklyn', @state_province = 'New York' , @country='USA'; 
EXEC EditLocation @id=1, @postal_code='20101';

SELECT * FROM tbl_locations;

--DeleteLocation
EXEC Deletelocation @id = '1';

SELECT * FROM tbl_locations;

--AddDepartment
EXEC AddDepartment @name = 'Engineering', @locations = 1; 

SELECT * FROM tbl_departments;

--EditDepartment
EXEC EditDepartment @id = 2, @name = 'Officer', @locations=6;

SELECT * from tbl_departments;

--Delete Department
EXEC DeleteDepartment @id = '2';

--EXEC DELETE Employee
EXEC DeleteEmployee @id = '3';

SELECT * FROM tbl_employees;

SELECT * FROM tbl_departments;

--Add Employee
EXECUTE Register @first_name = 'Johnyyyy', @last_name = 'Doe', @gender = 'Male', @email = 'johnyyyy@example.com',
                    @phone = '1234567890', @hire_date = '2024-06-10', @salary = 50000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE Register @first_name = 'Zidan', @last_name = 'Akmal', @gender = 'Male', @email = 'dan@gmail.com',
                    @phone = '1234567890', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

--Edit Employee
EXECUTE EditEmployee @id='1', @first_name = 'Johnyyyy', @last_name = 'Doe', @gender = 'Male', @email = 'johnyyyy@example.com',
                    @phone = '1234567890', @hire_date = '2024-06-10', @salary = 50000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE EditEmployee id='2', @first_name = 'Zidan', @last_name = 'Akmal', @gender = 'Male', @email = 'dan@gmail.com',
                    @phone = '1234567890', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE EditEmployee @id='1', @first_name = 'Johny',@email = 'Johny123@gmail.com' --,@gender = 'laki-laki';

--EXEC DELETE Employee
EXEC DeleteEmployee @id = '3';

--CHANGE PASSWORD
EXEC ChangePassword @email = 'Johny123@gmail.com', @password = 'akmal123', @new_password = 'akmal1234', @confirm_password = 'akmal1234';

SELECT * FROM tbl_employees;

SELECT * FROM tbl_departments;

--Edit Profile



--VIEW
SELECT * FROM vw_Region;

SELECT * FROM vw_Job;

SELECT * FROM vw_Department;

SELECT * FROM vw_Country;

SELECT * FROM vw_Location;

SELECT * FROM vw_Role;

SELECT * FROM vw_Permission;

SELECT * FROM vw_Employee;

