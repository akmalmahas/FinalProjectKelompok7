/*
	Buka folder initial_db.sql lalu running semua query yang terdapat di sana 
	(create database, create table dan alter table) pastikan foreign key nya terhubung dengan primary key.

	Dilanjut dengan menjalankan function yang ada (func_IsValidEmail.sql , func_IsValidGender.sql ,
	func_IsValidPassword.sql , func_IsValidPasswordPolicy.sql , func_IsValidPhoneNumber).

	Selanjutnya pembuatan stored procedure, dengan meng execute setiap file yang diawali dengan kata usp
	(usp_AddAccountRoles.sql , usp_AddCountry.sql ,  dan seterusnya sampai usp_login.sql)
	
	Setelah stored procedure berhasil dibuat, dilanjutkan dengan pembuatan trigger pada tbl_employees,
	dimana setiap mengisi employee baru maka tbl_job_histories dan tbl_accounts akan otomatis terisi.
	Cara membuat triggernya dengan mengeksekusi file dengan nama depan tr (tr_delete_employe.sql , 
	tr_insert_employee.sql , tr_update_employee.sql)

	Melakukan penginputan, pengeditan dan penghapusan data pada tiap table dengan menggunakan atau
	memanggil stored procedure yang telah dibuat (misal EXEC AddRegion @name = 'Asia';)
	contoh pengeksekusian secara lengkap ada di file execution.sql, silahkan buka dan running pada query
	USE db_employee Go terlebih dahulu.

	Setelah trigger berhasil digunakan dan data pada ketiga table tersebut saling terkoneksi, selanjutnya
	pembuatan view. Dilakukan dengan mengeksekusi file yang berawal vw_ (vw_AccountRoles.sql , 
	vw_Country.sql , vw_Department.sql , dan seterusnya)

	langkah terakhir adalah pembuatan login untuk user dan pengaplikasian hak akses pada suatu role
	lebih jelasnya silakan buka file alur_login.sql dan jalankan use db_employee go terlebih dahulu.

	Jika tidak ada kendala dalam penarapan langkah langkahnya, berarti db_employee yang dibuat kelompok 7
	berhasil berjalan dengan normal dan sesuai harapan.
*/

