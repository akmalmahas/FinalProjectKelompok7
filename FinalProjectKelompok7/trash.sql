--add region
EXEC AddRegion @name = 'Africa';
EXEC AddRegion @name = 'Asia';
EXEC AddRegion @name = 'America';
EXEC AddRegion @name = 'Europe';

Select * from tbl_regions;


-- Reset AI
DBCC CHECKIDENT ('tbl_regions', RESEED, 3);


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

