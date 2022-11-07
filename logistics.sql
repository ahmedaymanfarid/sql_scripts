--CUSTOMS AGENCIES
CREATE TABLE erp_system.dbo.customs_agency_name		( 	agency_serial INT PRIMARY KEY,
														customs_agency_name VARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
													);
											
CREATE TABLE erp_system.dbo.customs_agency_address	( 	address_serial INT PRIMARY KEY,
														agency_serial INT REFERENCES customs_agency_name(agency_serial),
														address INT REFERENCES districts(id),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.customs_agency_fax		(	branch_serial INT REFERENCES customs_agency_address(address_serial),
														fax VARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (branch_serial,fax)
													);
											
CREATE TABLE erp_system.dbo.customs_agency_telephone	(	branch_serial INT REFERENCES customs_agency_address(address_serial),
															telephone_number VARCHAR(50),
															added_by INT REFERENCES employees_info(employee_id),
															date_added DATETIME DEFAULT getdate(),
															PRIMARY KEY (branch_serial,telephone_number)
														);	

CREATE TABLE erp_system.dbo.customs_contact_person_info		(		employee_id INT REFERENCES employees_info(employee_id),
																	branch_serial INT REFERENCES customs_agency_address(address_serial),
																	contact_id INT,
																	email VARCHAR(50),
																	name VARCHAR(50),
																	gender VARCHAR(10),
																	department INT REFERENCES departments_type(id),
																	is_valid BIT,
																	date_added DATETIME DEFAULT getdate(),
																	PRIMARY KEY (employee_id,branch_serial,contact_id)
															);

CREATE TABLE erp_system.dbo.customs_contact_person_mobile	(	employee_id INT,
																branch_serial INT,
																contact_id INT,
																telephone_id INT,
																mobile VARCHAR(50),
																date_added DATETIME DEFAULT getdate(),
																FOREIGN KEY (employee_id,branch_serial,contact_id) REFERENCES customs_agency_contact_person_info(employee_id,branch_serial,contact_id),
																PRIMARY KEY (employee_id,branch_serial,contact_id,telephone_id)
															);
															
--FREIGHT AGENCIES															
CREATE TABLE erp_system.dbo.freight_agency_name		( 	agency_serial INT PRIMARY KEY,
														freight_agency_name VARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
													);
											
CREATE TABLE erp_system.dbo.freight_agency_address	( 	address_serial INT PRIMARY KEY,
														agency_serial INT REFERENCES freight_agency_name(agency_serial),
														address INT REFERENCES districts(id),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.freight_agency_fax		(	branch_serial INT REFERENCES freight_agency_address(address_serial),
														fax VARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (branch_serial,fax)
													);
											
CREATE TABLE erp_system.dbo.freight_agency_telephone	(	branch_serial INT REFERENCES freight_agency_address(address_serial),
															telephone_number VARCHAR(50),
															added_by INT REFERENCES employees_info(employee_id),
															date_added DATETIME DEFAULT getdate(),
															PRIMARY KEY (branch_serial,telephone_number)
														);	

CREATE TABLE erp_system.dbo.freight_contact_person_info		(		employee_id INT REFERENCES employees_info(employee_id),
																	branch_serial INT REFERENCES freight_agency_address(address_serial),
																	contact_id INT,
																	email VARCHAR(50),
																	name VARCHAR(50),
																	gender VARCHAR(10),
																	department INT REFERENCES departments_type(id),
																	is_valid BIT,
																	date_added DATETIME DEFAULT getdate(),
																	PRIMARY KEY (employee_id,branch_serial,contact_id)
															);

CREATE TABLE erp_system.dbo.freight_contact_person_mobile	(	employee_id INT,
																branch_serial INT,
																contact_id INT,
																telephone_id INT,
																mobile VARCHAR(50),
																date_added DATETIME DEFAULT getdate(),
																FOREIGN KEY (employee_id,branch_serial,contact_id) REFERENCES freight_agency_contact_person_info(employee_id,branch_serial,contact_id),
																PRIMARY KEY (employee_id,branch_serial,contact_id,telephone_id)
															);															
															
--CUSTOMS AGENCIES
BULK
INSERT erp_system.dbo.customs_agency_name
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\customs_agency_name.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.customs_agency_address
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\customs_agency_address.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.customs_agency_fax
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\customs_agency_fax.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.customs_agency_telephone
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\customs_agency_telephone.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.customs_contact_person_info
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\customs_contact_person_info.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.customs_contact_person_mobile
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\customs_contact_person_mobile.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

--FREIGHT AGENCIES

BULK
INSERT erp_system.dbo.freight_agency_name
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\freight_agency_name.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.freight_agency_address
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\freight_agency_address.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.freight_agency_fax
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\freight_agency_fax.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.freight_agency_telephone
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\freight_agency_telephone.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.freight_contact_person_info
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\freight_contact_person_info.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.freight_contact_person_mobile
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\logistics\freight_contact_person_mobile.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO															