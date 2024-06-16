USE db_employee;
GO

--AddCountry
EXEC AddCountry @id = 'USA', @name = 'United States of America', @region = 1; 

SELECT * FROM tbl_countries;


--AddDepartment
EXEC AddDepartment @name = 'Engineering', @locations = 1; 

SELECT * FROM tbl_departments;


--AddEmployee
EXECUTE AddEmployee @first_name = 'Johnyyyy', @last_name = 'Doe', @gender = 'Male', @email = 'johnyyyy@example.com',
                    @phone = '1234567890', @hire_date = '2024-06-10', @salary = 8000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'Password1!', @confirm_password = 'Password1!';

EXECUTE AddEmployee @first_name = 'Zidan', @last_name = 'Akmal', @gender = 'Male', @email = 'dan@gmail.com',
                    @phone = '1234567890', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'Z!d4nnnn', @confirm_password = 'Z!d4nnnn';

EXECUTE AddEmployee @first_name = 'Akmal', @last_name = 'Mahasna', @gender = 'Male', @email = 'akmal@gmail.com',
                    @phone = '088823212', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'Akm4l@ja', @confirm_password = 'Akm4l@ja';

EXECUTE AddEmployee @first_name = 'Ragil', @last_name = 'Ramadhan', @gender = 'Male', @email = 'ragil@gmail.com',
                    @phone = '088823219', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'Ra9!l0990', @confirm_password = 'Ra9!l0990';

EXECUTE AddEmployee @first_name = 'Fahri', @last_name = 'Hanif', @gender = 'Male', @email = 'hnf@gmail.com',
                    @phone = '0213232', @hire_date = '2024-12-11', @salary = 10000000, @manager = 1,
                    @job = 'Manager', @department = 5, @password = 'hanhan12', @confirm_password = 'hanhan12';

EXECUTE AddEmployee @first_name = 'SANTI', @last_name = 'PIA', @gender = 'Female', @email = 'pia@gmail.com',
                    @phone = '0213232', @hire_date = '2009-10-10', @salary = 10000000, @manager = 3,
                    @job = 'Manager', @department = 3, @password = 'PiaS4nt!', @confirm_password = 'PiaS4nt!';


select * from  tbl_employees;
select * from tbl_accounts
select * from tbl_job_histories

select * from tbl_jobs
select * from tbl_departments

delete from tbl_job_histories where employee >=1;
delete from tbl_accounts where id >=1;
delete from tbl_employees where id >=1;

 
 DBCC CHECKIDENT ('tbl_employees', RESEED, 0);
 DBCC CHECKIDENT ('tbl_accounts', RESEED, 0);
 DBCC CHECKIDENT ('tbl_job_histories', RESEED, 0);


--AddJob
EXEC AddJob @id = 'Engineer', @title = 'Software Engineer', @min_salary = 2500000, @max_salary = 10000000;
EXEC AddJob @id = 'Manager', @title = 'Project Manager', @min_salary = 5000000, @max_salary = 18000000;
EXEC AddJob @id = 'Directure', @title = 'Precident Directure', @min_salary = 7000000, @max_salary = 20000000;

SELECT * FROM tbl_jobs;


--AddLocation
EXEC AddLocation @street_address= 'Jalan Perjuangan 1', @postal_code='13200', @city = 'Brooklyn', @state_province = 'New York' , @country='USA'; 

SELECT * FROM tbl_locations;


--AddPermission 
EXEC AddPermission	@name = 'GRANT UPDATE';

SELECT * FROM tbl_permissions


--AddRegion
EXEC AddRegion @name = 'Africa';

DBCC CHECKIDENT ('tbl_regions', RESEED, 0);

/*
INSERT INTO tbl_regions (name)
VALUES ('ASIA');

DELETE FROM tbl_regions
WHERE name = 'Africa';

Select * from tbl_regions;
*/



--AddRoles
EXEC AddRole  @name = 'db_owner';

SELECT * FROM tbl_roles



--ChangePassword
EXEC ChangePassword @email = 'johnyyyy@example.com', @password = 'Password1!', @new_password = '!Johny123', @confirm_password = '!Johny123';

SELECT * FROM tbl_accounts;
SELECT * FROM tbl_employees;
=======
EXEC ChangePassword @email = 'akmal@gmail.com', @password = 'password123', @new_password = 'akmal123456', @confirm_password = 'akmal123456';

select * from tbl_accounts



--DeleteCountry
EXEC DeleteCountry @id = 'USA';

SELECT * FROM tbl_countries;


--DeleteDepartment
EXEC DeleteDepartment @id = '2';

SELECT * FROM tbl_departments;



--EXEC DELETE Employee
EXEC DeleteEmployee @id = '1';

SELECT * FROM tbl_employees;


--Deletejob
EXEC DeleteJob @id = 'Engineer';

SELECT * FROM tbl_jobs;



--execDeleteLocation
EXEC DeleteLocation @id = '1';

SELECT * FROM tbl_locations;


--DeletePermission
EXEC DeletePermission @id = 1;

SELect* from tbl_permissions



--execDeleteRegion
EXEC DeleteRegion @id = '4';


--DeleteRole
EXEC DeleteRole @id = 1;

SELECT * FROM tbl_roles



--EditCountry
EXEC EditCountry @id ='USA', @name = 'United States of America', @region = 1;

SELECT * FROM tbl_countries;


--EditDepartment
EXEC EditDepartment @id = 2, @name = 'Officer', @locations=6;

SELECT * from tbl_departments;


--EditEmployee
EXECUTE EditEmployee @id='1', @first_name = 'Johnyyyy', @last_name = 'Doe', @gender = 'Male', @email = 'johnyyyy@example.com',
                    @phone = '1234567890', @hire_date = '2024-06-10', @salary = 50000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE EditEmployee id='2', @first_name = 'Zidan', @last_name = 'Akmal', @gender = 'Male', @email = 'dan@gmail.com',
                    @phone = '1234567890', @hire_date = '2024-10-01', @salary = 5000000, @manager = null,
                    @job = 'Manager', @department = 5, @password = 'password123', @confirm_password = 'password123';

EXECUTE EditEmployee @id='1', @first_name = 'Johny',@email = 'Johny123@gmail.com', @hire_date='2024-01-17' --,@gender = 'laki-laki';

EXECUTE EditEmployee @id='3', @manager=3, @salary=1900000;

EXECUTE EditEmployee @id='2', @email= 'zidan@gmail.com';

EXECUTE EditEmployee @id='1', @job='MANAGER';

select * from  tbl_employees;
select * from tbl_accounts;


--EditJob
EXEC EditJob @id = 'Engineer', @title = 'Software Engineer', @min_salary = 3000000, @max_salary = 10000000;
EXEC EditJob @id = 'Engineer', @title = 'Software Engineer', @max_salary = 25000000;
EXEC EditJob @id = 'Engineer', @title = 'Data Engineer';

SELECT * FROM tbl_jobs;


--EditLocation
EXEC EditLocation @id=1, @street_address= 'Jalan Perjuangan 2', @postal_code='13200', @city = 'Brooklyn', @state_province = 'New York' , @country='USA'; 
EXEC EditLocation @id=1, @postal_code='20101';

SELECT * FROM tbl_locations;


--EditPermission
EXEC EditPermission @id = 1, @name = 'GRANT INSERT';

SELECT * FROM tbl_permissions


--EditProfile
EXEC EditProfile @id =2, @username ='zidan1@gmail.com', @email='zidan1@gmail.com';
EXEC EditProfile @id =5, @username ='hanifuyee1', @email='nif@gmail.com';

SELECT * FROM tbl_accounts;
SELECT * FROM tbl_employees;


--EditRegion
EXEC EditRegion @id = 1, @name = 'Afrika';

SELECT * from tbl_regions;


--EditRole
EXEC EditRole @id = 1, @name = 'db_accessadmin';

SELECT * FROM tbl_roles


--GenerateOtp
EXEC GenerateOTP @Email = 'akmal@gmail.com';


--Login
EXEC Login @username = 'SANTIPIA', @password = 'PiaS4nt!';

exec GenerateOTP @Email = 'pia@gmail.com';

select * from tbl_employees
