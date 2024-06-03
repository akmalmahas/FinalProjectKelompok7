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



--Pembuatan Foreign Key

ALTER TABLE tbl_countries ADD FOREIGN KEY(region) REFERENCES tbl_regions(id);
ALTER TABLE tbl_locations ADD FOREIGN KEY(country) REFERENCES tbl_countries(id);
ALTER TABLE tbl_departments ADD FOREIGN KEY(location) REFERENCES tbl_locations(id);