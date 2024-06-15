use db_employee
go;

/*1. membuat akun dengan meng exec AddEmployee dan pastikan data yg diinputkan
	Masuk ke tbl_employees, tbl_accounts dan tbl_job_histories 
*/

--2. melakukan create login sebagaai wadah untuk akun yang dibuat dengan code berikut:
 CREATE LOGIN [username] WITH PASSWORD = '[password]';
 --username dan password dapat dilihat di tbl_accounts

--3 Membuat user atau pengguna untuk melakukan proses login
CREATE USER [username] FOR LOGIN [username]

--Memberikan Hak Akses pada Roles, jalankan semua query berikut
--hak akses untuk superadmin
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_account_roles TO SuperAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.vw_country TO SuperAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_Department TO SuperAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.vw_Employee TO SuperAdmin;
GRANT EXECUTE ON dbo.AddAccountRoles TO SuperAdmin;
GRANT EXECUTE ON dbo.AddCountry TO SuperAdmin;
GRANT EXECUTE ON dbo.AddDepartment TO SuperAdmin;
GRANT EXECUTE ON dbo.AddEmployee TO SuperAdmin;
GRANT EXECUTE ON dbo.AddJob TO SuperAdmin;
GRANT EXECUTE ON dbo.AddLocation TO SuperAdmin;
GRANT EXECUTE ON dbo.AddPermission TO SuperAdmin;
GRANT EXECUTE ON dbo.AddRegion TO SuperAdmin;
GRANT EXECUTE ON dbo.AddRole TO SuperAdmin;
GRANT EXECUTE ON dbo.AddRolesPermission TO SuperAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_EmployeeDetails TO SuperAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_Job TO SuperAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_Location TO SuperAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_Region TO SuperAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_Role TO SuperAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_Permission TO SuperAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_RolePermission TO SuperAdmin;
GRANT EXECUTE ON dbo.DeleteAccountRoles TO SuperAdmin;
GRANT EXECUTE ON dbo.DeleteCountry TO SuperAdmin;
GRANT EXECUTE ON dbo.DeleteDepartment TO SuperAdmin;
GRANT EXECUTE ON dbo.DeleteEmployee TO SuperAdmin;
GRANT EXECUTE ON dbo.DeleteJob TO SuperAdmin;
GRANT EXECUTE ON dbo.DeleteLocation TO SuperAdmin;
GRANT EXECUTE ON dbo.DeletePermission TO SuperAdmin;
GRANT EXECUTE ON dbo.DeleteRegion TO SuperAdmin;
GRANT EXECUTE ON dbo.DeleteRole TO SuperAdmin;
GRANT EXECUTE ON dbo.DeleteRolesPermission TO SuperAdmin;
GRANT EXECUTE ON dbo.EditAccountRoles TO SuperAdmin;
GRANT EXECUTE ON dbo.EditCountry TO SuperAdmin;
GRANT EXECUTE ON dbo.EditDepartment TO SuperAdmin;
GRANT EXECUTE ON dbo.EditEmployee TO SuperAdmin;
GRANT EXECUTE ON dbo.EditJob TO SuperAdmin;
GRANT EXECUTE ON dbo.EditLocation TO SuperAdmin;
GRANT EXECUTE ON dbo.EditPermission TO SuperAdmin;
GRANT EXECUTE ON dbo.EditRegion TO SuperAdmin;
GRANT EXECUTE ON dbo.EditRole TO SuperAdmin;
GRANT EXECUTE ON dbo.EditRolesPermission TO SuperAdmin;


-- Hak Akses untuk admin
GRANT SELECT, INSERT, UPDATE ON vw_account_roles TO Admin;
GRANT SELECT, INSERT, UPDATE ON dbo.vw_country TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_Department TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.vw_Employee TO Admin;
GRANT EXECUTE ON dbo.AddAccountRoles TO Admin;
GRANT EXECUTE ON dbo.AddCountry TO Admin;
GRANT EXECUTE ON dbo.AddDepartment TO Admin;
GRANT EXECUTE ON dbo.AddEmployee TO Admin;
GRANT EXECUTE ON dbo.AddJob TO Admin;
GRANT EXECUTE ON dbo.AddLocation TO Admin;
GRANT EXECUTE ON dbo.AddRegion TO Admin;
GRANT EXECUTE ON dbo.AddRole TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_EmployeeDetails TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_Job TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_Location TO Admin;
GRANT SELECT, INSERT, UPDATE ON vw_Region TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON vw_Department TO Admin;
GRANT SELECT, INSERT, UPDATE ON vw_Role TO Admin;
GRANT EXECUTE ON dbo.DeleteDepartment TO Admin;
GRANT EXECUTE ON dbo.DeleteEmployee TO Admin;
GRANT EXECUTE ON dbo.DeleteJob TO Admin;
GRANT EXECUTE ON dbo.DeleteLocation TO Admin;
GRANT EXECUTE ON dbo.EditAccountRoles TO Admin;
GRANT EXECUTE ON dbo.EditCountry TO Admin;
GRANT EXECUTE ON dbo.EditDepartment TO Admin;
GRANT EXECUTE ON dbo.EditEmployee TO Admin;
GRANT EXECUTE ON dbo.EditJob TO Admin;
GRANT EXECUTE ON dbo.EditLocation TO Admin;
GRANT EXECUTE ON dbo.EditRegion TO Admin;
GRANT EXECUTE ON dbo.EditRole TO Admin;


-- Hak Akses untuk manager
GRANT SELECT, UPDATE ON vw_EmployeeDetails TO Manager;
GRANT SELECT, UPDATE ON vw_Employee TO Manager;
GRANT SELECT, UPDATE ON vw_Profile TO Manager;
GRANT EXECUTE ON dbo.ChangePassword TO Manager;
GRANT EXECUTE ON dbo.EditEmployee TO Manager;
GRANT EXECUTE ON dbo.EditProfile TO Manager;

-- Hak Akses untuk employee
GRANT SELECT ON vw_Profile TO Employee;
GRANT EXECUTE ON dbo.EditProfile TO Employee;
GRANT EXECUTE ON dbo.ChangePassword TO Employee;

-- 4Menambahkan user yang dibuat ke membership dari roles yang ada (keempatnya memiliki hak akses yang berbeda)
ALTER ROLE SuperAdmin ADD MEMBER [username] ;
ALTER ROLE admin ADD MEMBER [username];
ALTER ROLE manager ADD MEMBER [username];
ALTER ROLE employee ADD MEMBER [username];

--5 jika berhasil semua, jalankan exec login dengan contoh berikut
EXEC Login @username= 'Johny', @password='Password1!';
----jika lupa password jalankan perintah generate otp dan forgot password
exec GenerateOTP @Email = '[email]';
--otp yang dikirimkan dapat digunakan untuk diinput pada exec forget password parameter OTP
EXEC ForgotPassword @Email='', @NewPassword='[password]', @ConfirmPassword='[password]', @OTP='[otp]';

--6 Setelah login  berhasil masukkan perintah dibawah sebelum mengeksekusi sebuah sp/view
execute as user ='[username]';
select * from vw_EmployeeDetails;
EXEC AddRegion @name = 'Africa'; 

--perlu diingat jika terjadi gagal kemungkinan sp/view yang ingin di eksekusi bukan milik user yang mengeksekusi

--Jangan lupa untuk melakukan revert bila sudah selesai dengan satu user dan hendak beralih ke user role yang lain
REVERT;