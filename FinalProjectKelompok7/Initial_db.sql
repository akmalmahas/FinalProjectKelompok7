CREATE DATABASE db_employee;

CREATE TABLE tbl_regions (
	id INT IDENTITY PRIMARY KEY,
	name varchar (25) not null,
);

CREATE TABLE tbl_countries(
	id CHAR (3) PRIMARY KEY,
	name varchar (40) not null,
	region int not null
);

CREATE TABLE tbl_locations(
	id int IDENTITY PRIMARY KEY, 
	street_address varchar (40),
	postal_code Varchar (12),
	city varchar (30) not null,
	state_province Varchar (25),
	country CHAR (3) not null
);

CREATE TABLE tbl_departments (
	id INT IDENTITY PRIMARY KEY,
	name varchar (30)  not null,
	locations int not null
);

--JOBS
CREATE TABLE tbl_jobs(
	id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(35) NOT NULL,
	min_salary INT(11),
	max_salary INT(11)
);

--JOBS HISTORIES
CREATE TABLE tbl_job_histories(
	employee INT(6) IDENTITY PRIMARY KEY,
	start_date date PRIMARY KEY,
	end_date date,
	status VARCHAR(10) NOT NULL,
	job VARCHAR(10) NOT NULL,
	department INT(4) NOT NULL
);

--ACCOUNTS
CREATE TABLE tbl_accounts(
	id INT IDENTITY PRIMARY KEY,
	username VARCHAR(25),
	password VARCHAR(255) NOT NULL,
	otp INT,
	is_expired DATETIME,
	is_used BIT
);



--Pembuatan Foreign Key
ALTER TABLE tbl_countries ADD FOREIGN KEY(region) REFERENCES tbl_regions(id);
ALTER TABLE tbl_locations ADD FOREIGN KEY(country) REFERENCES tbl_countries(id);
ALTER TABLE tbl_departments ADD FOREIGN KEY(location) REFERENCES tbl_locations(id);
ALTER TABLE tbl_job_histories ADD FOREIGN KEY(employee) REFERENCES tbl_employees(id);
ALTER TABLE tbl_accounts ADD FOREIGN KEY(id) REFERENCES tbl_employees(id);