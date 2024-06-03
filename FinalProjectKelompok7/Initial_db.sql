--DATABASE
CREATE DATABASE db_employee;

--REGIONS
CREATE TABLE tbl_regions (
	id INT IDENTITY PRIMARY KEY,
	name varchar (25) not null,
);


--COUNTRIES
CREATE TABLE tbl_countries(
	id CHAR (3) PRIMARY KEY,
	name varchar (40) not null,
	region int not null
);


--LOCATIONS
CREATE TABLE tbl_locations(
	id int IDENTITY PRIMARY KEY, 
	street_address varchar (40),
	postal_code Varchar (12),
	city varchar (30) not null,
	state_province Varchar (25),
	country CHAR (3) not null
);


--DEPARTMENTS
CREATE TABLE tbl_departments (
	id INT IDENTITY PRIMARY KEY,
	name varchar (30)  not null,
	locations int not null
);

--JOBS
CREATE TABLE tbl_jobs(
	id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(35) NOT NULL,
	min_salary INT ,
	max_salary INT
);

--JOBS HISTORIES
CREATE TABLE tbl_job_histories(
	employee INT IDENTITY,
	start_date date,
	end_date date,
	status VARCHAR(10) NOT NULL,
	job VARCHAR(10) NOT NULL,
	department INT NOT NULL,
	PRIMARY KEY (employee, start_date)
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

--PERMISSIONS
CREATE TABLE tbl_permissions (
    id INT IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL
    );

--role_permissions
CREATE TABLE tbl_role_permissions(
    id INT IDENTITY PRIMARY KEY,
    role INT NOT NULL,
    permission INT NOT NULL
    );

--ROLES
CREATE TABLE tbl_roles (
    id INT IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL
    );

--account_roles
CREATE TABLE tbl_account_roles(
    id INT IDENTITY PRIMARY KEY,
    account INT NOT NULL,
    role INT NOT NULL 
    );

CREATE TABLE tbl_employees(
	id int IDENTITY PRIMARY KEY,
	first_name varchar (25) not null,
	last_name varchar (25),
	gender varchar (10) NOT NULL,
	email varchar (25) UNIQUE NOT NULL,
	phone varchar (20),
	hire_date DATE NOT NULL,
	salary int,
	manager int,
	job varchar (10) not null,
	department int not null
);

--Pembuatan Foreign Key
ALTER TABLE tbl_countries ADD FOREIGN KEY(region) REFERENCES tbl_regions(id);
ALTER TABLE tbl_locations ADD FOREIGN KEY(country) REFERENCES tbl_countries(id);
ALTER TABLE tbl_departments ADD FOREIGN KEY(location) REFERENCES tbl_locations(id);
ALTER TABLE tbl_job_histories ADD FOREIGN KEY(employee) REFERENCES tbl_employees(id);
ALTER TABLE tbl_accounts ADD FOREIGN KEY(id) REFERENCES tbl_employees(id);
ALTER TABLE tbl_account_roles ADD FOREIGN KEY(account) REFERENCES tbl_accounts_roles(id);
ALTER TABLE tbl_account_roles ADD FOREIGN KEY(role) REFERENCES tbl_roles(id);
ALTER TABLE tbl_role_permissions ADD FOREIGN KEY(permission) REFERENCES tbl_permissions(id); 
ALTER TABLE tbl_job_histories ADD FOREIGN KEY(job) REFERENCES tbl_jobs(id);
ALTER TABLE tbl_job_histories ADD FOREIGN KEY(department) REFERENCES tbl_departments(id);
