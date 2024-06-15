/*1. membuat akun dengan meng exec AddEmployee dan pastikan data yg diinputkan
	Masuk ke tbl_employees, tbl_accounts dan tbl_job_histories 
*/

--2. melakukan create login sebagaai wadah untuk akun yang dibuat dengan code berikut:
 CREATE LOGIN [username] WITH PASSWORD = '[password]';
 --username dan password dapat dilihat di tbl_accounts

--3 Membuat user atau pengguna untuk melakukan proses login
CREATE USER [username] FOR LOGIN [username]

--4. Menambahkan user yang dibuat ke membership dari roles yang ada (keempatnya memiliki hak akses yang berbeda)
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