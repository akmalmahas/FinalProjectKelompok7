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

--Edit Region
EXEC EditRegion @id =5, @name = 'arab';

SELECT * from tbl_regions;

--delete region

EXEC DeleteRegion @id = '5';


--Add Country
EXEC AddCountry @id = 'USA', @name = 'United States of America', @region = 3; 

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
EXEC AddLocation @street_address= 'Street 1', @postal_code='13200', @city = 'Brooklyn', @state_province = 'New York' , @country='USA'; 

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

SELECT * FROM tbl_departments;

--EditDepartment
EXEC EditDepartment @id = 2, @name = 'Officer', @locations=2;

SELECT * from tbl_departments;

--Delete Department
EXEC DeleteDepartment @id = '2';

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

