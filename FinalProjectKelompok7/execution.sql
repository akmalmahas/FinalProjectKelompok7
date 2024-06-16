USE db_employee;
GO

--silakan untuk mengubah values dari tiap data di bawah ini sesuai keingininan dan ketentuan

--AddRegion
EXEC AddRegion @name = 'Africa';
EXEC AddRegion @name = 'Asia';
EXEC AddRegion @name = 'America';
EXEC AddRegion @name = 'Europe';
EXEC AddRegion @name = 'Arabia';

--EditRegion
EXEC EditRegion @id = 1, @name = 'Afrika';

--DeleteRegion
EXEC DeleteRegion @id = '1';

--view region
SELECT * FROM vw_Region;

SELECT * FROM tbl_regions;

--AddCountry
EXEC AddCountry 
	@id = 'USA', 
	@name = 'United States of America', 
	@region = 1; 

--EditCountry
EXEC EditCountry 
	@id ='USA', 
	@name = 'America', 
	@region = 1;

EXEC EditCountry 
	@id ='USA', 
	@name = 'America Serikat'
;

EXEC EditCountry @id ='USA', 
	@region = 1
;

--DeleteCountry
EXEC DeleteCountry @id = 'USA';

--view Country
SELECT * FROM vw_Country;

SELECT * FROM tbl_countries;

--AddLocation
EXEC AddLocation 
	@street_address= 'Jalan Perjuangan 1', 
	@postal_code='13200', 
	@city = 'Brooklyn', 
	@state_province = 'New York', 
	@country='USA'
	; 

--EditLocation
EXEC EditLocation 
	@id=1, 
	@street_address= 'Jalan Perjuangan 2', 
	@postal_code='13200', 
	@city = 'Brooklyn', 
	@state_province = 'New York' , 
	@country='USA'
; 

EXEC EditLocation 
	@id=1, 
	@postal_code='20101';

--DeleteLocation
EXEC DeleteLocation @id = '1';

--view Location
SELECT * FROM vw_Location;

SELECT * FROM tbl_locations;


--AddDepartment
EXEC AddDepartment @name = 'Engineering', @locations = 1; 

--EditDepartment
EXEC EditDepartment @id = 1, @name = 'Officer', @locations=1;

--DeleteDepartment
EXEC DeleteDepartment @id = 1;

--view Department
SELECT * FROM vw_Department;

SELECT * FROM tbl_departments;

--AddJob
EXEC AddJob 
	@id = 'Engineer', 
	@title = 'Software Engineer', 
	@min_salary = 2500000, 
	@max_salary = 7000000
	;

EXEC AddJob 
	@id = 'Manager', 
	@title = 'Project Manager', 
	@min_salary = 10000000, 
	@max_salary = 18000000
	;

EXEC AddJob 
	@id = 'Directure', 
	@title = 'Precident Directure', 
	@min_salary = 25000000, 
	@max_salary = 30000000
	;

--EditJob
EXEC EditJob @id = 'Engineer', 
	@title = 'Software Engineer',
	@min_salary = 3000000, 
	@max_salary = 10000000
	;

EXEC EditJob @id = 'Engineer', 
	@title = 'Software Engineer', 
	@max_salary = 25000000
	;

EXEC EditJob @id = 'Engineer', 
	@title = 'Data Engineer';

--Deletejob
EXEC DeleteJob @id = 'Directure';

--View Job
SELECT * FROM vw_Job;

SELECT * FROM tbl_jobs;


--AddEmployee
EXECUTE AddEmployee 
		@first_name = 'Johnyyyy', 
		@last_name = 'Doe', 
		@gender = 'Male', 
		@email = 'johnyyyy@example.com',
		@phone = '1234567890', 
		@hire_date = '2024-06-10', 
		@salary = 15000000, 
		@manager = null,
		@job = 'Manager', 
		@department = 5, 
		@password = 'Password1!', 
		@confirm_password = 'Password1!'
;

EXECUTE AddEmployee 
		@first_name = 'Zidan', 
		@last_name = 'Akmal',
		@gender = 'Male', 
		@email = 'dan@gmail.com',
		@phone = '1234567890', 
		@hire_date = '2024-10-01', 
		@salary = 11000000, 
		@manager = null,
		@job = 'Manager', 
		@department = 1, 
		@password = 'Z!d4nnnn', 
		@confirm_password = 'Z!d4nnnn'
		;

EXECUTE AddEmployee 
		@first_name = 'Akmal', 
		@last_name = 'Mahasna', 
		@gender = 'Male', 
		@email = 'akmal@gmail.com',
        @phone = '088823212', 
		@hire_date = '2024-10-01', 
		@salary = 12000000, 
		@manager = null,
        @job = 'Manager', 
		@department = 1, 
		@password = 'Akm4l@ja', 
		@confirm_password = 'Akm4l@ja';

EXECUTE AddEmployee 
		@first_name = 'Ragil', 
		@last_name = 'Ramadhan',
		@gender = 'Male', 
		@email = 'ragil@gmail.com',
        @phone = '088823219', 
		@hire_date = '2024-10-01', 
		@salary = 5000000, 
		@manager = null,
        @job = 'Manager', 
		@department = 1, 
		@password = 'Ra9!l0990', 
		@confirm_password = 'Ra9!l0990';

	--contoh add employee yang gagal karena password tidak sesuai ketentuan
EXECUTE AddEmployee 
		@first_name = 'Fahri', 
		@last_name = 'Hanif', 
		@gender = 'Male', 
		@email = 'hnf@gmail.com',
        @phone = '0213232', 
		@hire_date = '2024-12-11', 
		@salary = 10000000,
		@manager = 1,
        @job = 'Manager', 
		@department = 1, 
		@password = 'hanhan12', 
		@confirm_password = 'hanhan12';

EXECUTE AddEmployee 
	@first_name = 'SANTI', 
	@last_name = 'PIA', 
	@gender = 'Female',
	@email = 'pia@gmail.com',
    @phone = '0213232', 
	@hire_date = '2009-10-10', 
	@salary = 10000000,
	@manager = 3,
    @job = 'Manager',
	@department = 3, 
	@password = 'PiaS4nt!', 
	@confirm_password = 'PiaS4nt!';

  --untuk melihat konektivitas antara tbl_employees, tbl_accounts, dan tbl_job_histories silakan jalankan 3 query berikut
select * from  tbl_employees;
select * from tbl_accounts
select * from tbl_job_histories

	--untuk memudahkan melihat data pada tbl jobs dan departments untuk pengisian tbl_employees
	--silakan jalankan 2 query ini agar tidak scroll ke atas
select * from tbl_jobs
select * from tbl_departments

--delete from tbl_job_histories where employee >=1;
--delete from tbl_accounts where id >=1;
--delete from tbl_employees where id >=1;

--EditEmployee
EXECUTE EditEmployee 
		@id='1', 
		@first_name = 'Johnyyyy', 
		@last_name = 'Doe', 
		@gender = 'Male', 
		@email = 'johnyyyy@example.com',
        @phone = '1234567890', 
		@hire_date = '2024-06-10', 
		@salary = 50000, 
		@manager = null,
        @job = 'Manager', 
		@department = 5, 
		@password = 'password123', 
		@confirm_password = 'password123';

EXECUTE EditEmployee 
		id='2', 
		@first_name = 'Zidan', 
		@last_name = 'Akmal', 
		@gender = 'Male', 
		@email = 'dan@gmail.com',
        @phone = '1234567890',
		@hire_date = '2024-10-01', 
		@salary = 5000000, 
		@manager = null,
        @job = 'Manager',
		@department = 5, 
		@password = 'password123', 
		@confirm_password = 'password123';

EXECUTE EditEmployee 
		@id='1', 
		@first_name = 'Johny',
		@email = 'Johny123@gmail.com',
		@hire_date='2024-01-17' 
		--,@gender = 'laki-laki'
		;

EXECUTE EditEmployee 
		@id='3', 
		@manager=3, 
		@salary=13000000;

EXECUTE EditEmployee @id='2', @email= 'zidan@gmail.com';

EXECUTE EditEmployee @id='1', @job='MANAGER';

--EXEC DELETE Employee
EXEC DeleteEmployee @id = '1';

--vw_Employee dan vw_EmployeeDetails
SELECT * FROM vw_Employee;
SELECT * FROM vw_EmployeeDetails;


--AddPermission 
EXEC AddPermission	@name = 'UPDATE';

--EditPermission
EXEC EditPermission @id = 1, @name = 'INSERT';

--DeletePermission
EXEC DeletePermission @id = 1;

--view permission
SELECT * FROM vw_Permission;

SELECT * FROM tbl_permissions

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

--edit role_permissions
Exec EditRolesPermission @RolesPermissionId = 1 , @RoleId = 1 , @PermissionId = 4;

--delete role_permissions
Exec DeleteRolesPermission @RolesPermissionId = 5;

--view role_permission
SELECT * FROM vw_RolePermission;


--AddRoles
EXEC AddRole  @name = 'db_owner';
EXEC AddRole  @name = 'db_writer';
EXEC AddRole  @name = 'db_reader';
EXEC AddRole  @name = 'db_admin';
EXEC AddRole  @name = 'db_view';

--EditRole
EXEC EditRole @id = 1, @name = 'SuperAdmin';
EXEC EditRole @id = 2, @name = 'Admin';
EXEC EditRole @id = 3, @name = 'Manager';
EXEC EditRole @id = 4, @name = 'Employee';

--DeleteRole
EXEC DeleteRole @id = 5;

--view roles
SELECT * FROM vw_Role;

SELECT * FROM tbl_roles

--AddAcountRoles
EXEC AddAccountRoles @AccountId = 1, @RoleId = 1;
EXEC AddAccountRoles @AccountId = 1, @RoleId = 1;
EXEC AddAccountRoles @AccountId = 1, @RoleId = 1;
EXEC AddAccountRoles @AccountId = 2, @RoleId = 2;
EXEC AddAccountRoles @AccountId = 3, @RoleId = 3;
EXEC AddAccountRoles @AccountId = 4, @RoleId = 4;

--EditAcountRoles
EXEC EditAccountRoles @AccountRoleId = 1, @NewAccountId = 1, @NewRoleId = 1;
EXEC EditAccountRoles @AccountRoleId = 2, @NewAccountId = 2, @NewRoleId = 2;
EXEC EditAccountRoles @AccountRoleId = 3, @NewAccountId = 3, @NewRoleId = 3;
EXEC EditAccountRoles @AccountRoleId = 4, @NewAccountId = 4, @NewRoleId = 3;

--DeleteAcountRoles
EXEC DeleteAccountRoles @AccountRoleId  = 4;

--vw_account_roles
SELECT * FROM vw_account_roles;

--ChangePassword
EXEC ChangePassword
	@email = 'johnyyyy@example.com', 
	@password = 'Password1!', 
	@new_password = '!Johny123', 
	@confirm_password = '!Johny123';

SELECT * FROM tbl_accounts;
SELECT * FROM tbl_employees;


--EditProfile
EXEC EditProfile @id =2, @username ='Zidan', @email='zidan1@gmail.com';
EXEC EditProfile @id =5, @username ='hanifri', @email='nif@gmail.com';

SELECT * FROM tbl_accounts;
SELECT * FROM tbl_employees;

--Login
EXEC Login @username = 'SANTIPIA', @password = 'PiaS4nt!';

select * from tbl_employees

-- jika mengalami lupa password, jalankan sp Generate OTP dan forgot password

--GenerateOtp
exec GenerateOTP @Email = 'pia@gmail.com';
	--Akan muncul kode otp, dan cantumkan di kolom otp pada exec ForgotPassword

--forgotpassword
EXEC ForgotPassword @Email = 'pia@gmail.com', @NewPassword = 'PiaS4nt!', @ConfirmPassword = 'PiaS4nt!', @OTP = 5520; --OTP sesuaikan dengan yang muncul pada result Generate OTP