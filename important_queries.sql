--DROP NEW SALES WORK ORDER 
delete from dbo.work_orders where sales_person > 0

--DROP NEW SALES WORK OFFER 
delete from dbo.unsucessful_work_offers where offer_proposer > 0
delete from dbo.work_offers_rfqs where offer_proposer > 0
delete from dbo.work_offers_products_info where offer_proposer > 0
delete from dbo.work_offers where offer_proposer > 0

--DROP NEW RFQS
delete from dbo.updated_rfqs_assignees where sales_person > 0
delete from dbo.unsuccessful_rfqs where sales_person > 0
delete from dbo.rfqs where rfqs.sales_person > 0

--DROP PRODUCTS
delete from dbo.brands_models where brand_id >= 0

delete from dbo.model_applications where model_id >= 0
delete from dbo.model_benefits where model_id >= 0
delete from dbo.model_standard_features where model_id >= 0

delete from dbo.products_brands where brand_id >= 0
delete from dbo.brands_type where id >= 0

--DROP NEW OFFICE MEETING
delete from dbo.office_meetings where office_meetings.meeting_serial > 0

--DROP NEW CLIENT VISIT
delete from dbo.client_visits where client_visits.sales_person > 0

--DROP NEW CLIENT CALL
delete from dbo.client_calls where client_calls.sales_person > 0

--DROP NEW CONTACT PHONE ENTRY
delete from erp_system.dbo.contact_person_mobile where contact_person_mobile.sales_person_id > 0;

--DROP NEW CONTACT PERSONAL EMAIL ENTRY
delete from erp_system.dbo.contact_person_personal_emails where branch_serial > 0;

--DROP NEW CONTACT COMMENTS
delete from erp_system.dbo.contact_person_comment where contact_person_comment.sales_person_id > 0;

--DROP NEW CONTACT ENTRY
delete from dbo.contact_person_info where contact_person_info.branch_serial > 0;

--DROP NEW COMPANY ENTRY
delete from dbo.company_telephone where branch_serial >0
delete from dbo.company_fax where branch_serial > 0
delete from dbo.company_address where address_serial > 0
delete from dbo.company_field_of_work where company_serial > 0
delete from dbo.company_name where company_serial > 0

--DROP NEW EMPLOYEE ENTRY
delete from dbo.employees_business_emails where employees_business_emails.id > 0
delete from dbo.employees_business_phones where employees_business_phones.id > 0
delete from dbo.employees_initials where employees_initials.id > 0
delete from dbo.employees_national_id where employees_national_id.id > 0
delete from dbo.employees_passwords where employees_passwords.id > 0
delete from dbo.employees_payroll_info where employees_payroll_info.employee_id > 0
delete from dbo.employees_personal_emails where employees_personal_emails.id > 0
delete from dbo.employees_personal_phones where employees_personal_phones.id > 0
delete from dbo.employees_termination_info where employees_termination_info.id > 0
delete from dbo.employees_monthly_salaries where employees_monthly_salaries.employee_id > 0
delete from dbo.employees_basic_salaries where employees_basic_salaries.employee_id > 0
delete from dbo.employees_educational_qualifications where employee_id > 0
delete from dbo.employees_info where employees_info.employee_id > 0

--DROP CUSTOMS AGENCIES
delete from erp_system.dbo.customs_contact_person_mobile where customs_contact_person_mobile.branch_serial > 0
delete from erp_system.dbo.customs_contact_person_info where customs_contact_person_info.branch_serial > 0
delete from erp_system.dbo.customs_agency_telephone where customs_agency_telephone.branch_serial > 0
delete from erp_system.dbo.customs_agency_fax where customs_agency_fax.branch_serial > 0
delete from erp_system.dbo.customs_agency_address where customs_agency_address.address > 0
delete from erp_system.dbo.customs_agency_name where customs_agency_name.added_by > 0

--DROP FREIGHT AGENCIES
delete from erp_system.dbo.freight_contact_person_mobile where freight_contact_person_mobile.branch_serial > 0
delete from erp_system.dbo.freight_contact_person_info where freight_contact_person_info.branch_serial > 0
delete from erp_system.dbo.freight_agency_telephone where freight_agency_telephone.branch_serial > 0
delete from erp_system.dbo.freight_agency_fax where freight_agency_fax.branch_serial > 0
delete from erp_system.dbo.freight_agency_address where freight_agency_address.address > 0
delete from erp_system.dbo.freight_agency_name where freight_agency_name.added_by > 0

--CHANGE BRANCH SERIAL OF CONTACT PERSON
insert into erp_system.dbo.contact_person_info (sales_person_id, branch_serial, contact_id, email, name, gender, department, is_valid)
(select sales_person_id = 15,
		branch_serial = 23,
		contact_id = 1,
		email,
		name,
		gender,
		department,
		is_valid
from erp_system.dbo.contact_person_info
where contact_person_info.sales_person_id = 15
and contact_person_info.branch_serial = 24
and contact_person_info.contact_id = 1);

update erp_system.dbo.contact_person_comment
set sales_person_id = 15, branch_serial = 23, contact_id = 1 
where sales_person_id = 15
and branch_serial = 24
and contact_id = 1

update erp_system.dbo.contact_person_personal_emails
set sales_person_id = 15, branch_serial = 23, contact_id = 1 
where sales_person_id = 15
and branch_serial = 24
and contact_id = 1

update erp_system.dbo.contact_person_mobile
set sales_person_id = 15, branch_serial = 23, contact_id = 1 
where sales_person_id = 15
and branch_serial = 24
and contact_id = 1

update erp_system.dbo.contact_person_info 
set is_valid = 0
where sales_person_id = 15
and branch_serial = 23
and contact_id = 1;


--USE OF ABSENCE TEST FUNCTION
select *,
		dbo.absence_test(first_in_last_out.first_check_in, first_in_last_out.last_check_out)
from first_in_last_out
where first_in_last_out.modified_date > '2021-04-01'
and first_in_last_out.modified_date < '2021-04-13';


--PROGRAMATIC INSERT SINGLE EMPLOYEE AND DATE IN EMPLOYEES ATTENDANCE TABLE
DECLARE @current_date DATE = '2021-06-23';
DECLARE @current_employee_id INT = 130;
DECLARE @first_check_in TIME;
DECLARE @last_check_out TIME;
DECLARE @attendance_type INT;

DECLARE get_first_in CURSOR FOR 
SELECT first_in_last_out.first_check_in
FROM erp_system.dbo.first_in_last_out
WHERE first_in_last_out.modified_date = @current_date
AND first_in_last_out.emp_code = @current_employee_id

DECLARE get_last_out CURSOR FOR 
SELECT first_in_last_out.last_check_out
FROM erp_system.dbo.first_in_last_out
WHERE first_in_last_out.modified_date = @current_date
AND first_in_last_out.emp_code = @current_employee_id

OPEN get_first_in
OPEN get_last_out

FETCH NEXT FROM get_first_in INTO @first_check_in
FETCH NEXT FROM get_last_out INTO @last_check_out

INSERT INTO erp_system.dbo.employees_attendance 
values(@current_employee_id, @current_date, @first_check_in, @last_check_out, dbo.get_attendance(@first_check_in, @last_check_out));

CLOSE get_first_in
CLOSE get_last_out

DEALLOCATE get_first_in
DEALLOCATE get_last_out

--PROGRAMATIC INSERT ALL EMPLOYEES FOR SPECIFIED DATE IN EMPLOYEES ATTENDANCE TABLE
DECLARE @current_date DATE = '2021-06-24';
DECLARE @current_employee_id INT;
DECLARE @first_check_in TIME;
DECLARE @last_check_out TIME;
DECLARE @attendance_type INT;

DECLARE get_employee CURSOR FOR
SELECT employees_info.employee_id
FROM erp_system.dbo.employees_info

OPEN get_employee

FETCH NEXT FROM get_employee INTO @current_employee_id

WHILE @@FETCH_STATUS = 0
BEGIN

	SET @first_check_in = NULL
	SET @last_check_out = NULL

	DECLARE get_first_in CURSOR FOR 
	SELECT first_in_last_out.first_check_in
	FROM erp_system.dbo.first_in_last_out
	WHERE first_in_last_out.modified_date = @current_date
	AND first_in_last_out.emp_code = @current_employee_id

	DECLARE get_last_out CURSOR FOR 
	SELECT first_in_last_out.last_check_out
	FROM erp_system.dbo.first_in_last_out
	WHERE first_in_last_out.modified_date = @current_date
	AND first_in_last_out.emp_code = @current_employee_id

	OPEN get_first_in
	OPEN get_last_out

	FETCH NEXT FROM get_first_in INTO @first_check_in
	FETCH NEXT FROM get_last_out INTO @last_check_out

	INSERT INTO erp_system.dbo.employees_attendance 
	values(@current_employee_id, @current_date, @first_check_in, @last_check_out, dbo.get_attendance(@first_check_in, @last_check_out));

	CLOSE get_first_in
	CLOSE get_last_out

	DEALLOCATE get_first_in
	DEALLOCATE get_last_out

	FETCH NEXT FROM get_employee INTO @current_employee_id
END

CLOSE get_employee

DEALLOCATE get_employee

--INSERT ALL EMPLOYEES AND DATES DATA INTO EMPLOYEES ATTENDANCE
DECLARE @current_date DATE = '2021-03-14';
DECLARE @end_date DATE = '2021-07-04';
DECLARE @current_employee_id INT;
DECLARE @first_check_in TIME;
DECLARE @last_check_out TIME;
DECLARE @attendance_type INT;

WHILE @current_date < @end_date
BEGIN
	DECLARE get_employee CURSOR FOR
	SELECT employees_info.employee_id
	FROM erp_system.dbo.employees_info
	
	OPEN get_employee

	FETCH NEXT FROM get_employee INTO @current_employee_id

	WHILE @@FETCH_STATUS = 0
	BEGIN
	
		SET @first_check_in = NULL
		SET @last_check_out = NULL
	
		DECLARE get_first_in CURSOR FOR 
		SELECT first_in_last_out.first_check_in
		FROM erp_system.dbo.first_in_last_out
		WHERE first_in_last_out.modified_date = @current_date
		AND first_in_last_out.emp_code = @current_employee_id
	
		DECLARE get_last_out CURSOR FOR 
		SELECT first_in_last_out.last_check_out
		FROM erp_system.dbo.first_in_last_out
		WHERE first_in_last_out.modified_date = @current_date
		AND first_in_last_out.emp_code = @current_employee_id
	
		OPEN get_first_in
		OPEN get_last_out
	
		FETCH NEXT FROM get_first_in INTO @first_check_in
		FETCH NEXT FROM get_last_out INTO @last_check_out
	
		INSERT INTO erp_system.dbo.employees_attendance 
		values(@current_employee_id, @current_date, @first_check_in, @last_check_out, dbo.get_attendance(@first_check_in, @last_check_out));
	
		CLOSE get_first_in
		CLOSE get_last_out
	
		DEALLOCATE get_first_in
		DEALLOCATE get_last_out
	
		FETCH NEXT FROM get_employee INTO @current_employee_id
	END
	
	SET @current_date = DATEADD(dd, 1, @current_date) 

	CLOSE get_employee
	DEALLOCATE get_employee
END	

--MANUAL MONTHLY ATTENDANCE REPORT
select	employees_info.name,
		employees_attendance.calendar_date,
		DATEPART(WEEKDAY, employees_attendance.calendar_date) AS week_day,
		employees_attendance.first_in,
		employees_attendance.last_out,
		attendance_types.attendance_type
from erp_system.dbo.employees_attendance
inner join erp_system.dbo.attendance_types
on employees_attendance.attendance_type = attendance_types.id
inner join erp_system.dbo.employees_info
on employees_attendance.employee_id = employees_info.employee_id
inner join erp_system.dbo.employees_excluded_attendance
on employees_attendance.employee_id = employees_excluded_attendance.employee_id
where calendar_date >= '2021-07-01'
and calendar_date <= '2021-07-31'
and employees_info.currently_enrolled = 1
and employees_excluded_attendance.is_excluded = 0

--FULL EMPLOYEES INFO
select employees_info.employee_id,
		employees_info.name,
		employees_info.arabic_name,
		employees_business_phones.phone,
		employees_personal_phones.phone,
		employees_business_emails.email,
		employees_info.gender,
		employee_salary_due.gross_salary,
		employee_salary_due.insurance_and_taxes,
		employee_salary_due.net_salary,
		employees_national_id.national_id,
		departments_type.department,
		teams_type.team,
		positions_type.position,
		employees_info.birth_date,
		employees_info.join_date,
		employees_termination_info.resignation_date,
		educational_degrees.educational_degree,
		educational_majors.educational_major,
		employees_educational_qualifications.graduation_year,
		enrollement_status.enrollement_status
from erp_system.dbo.employees_info
left join erp_system.dbo.employees_business_phones
on employees_info.employee_id = employees_business_phones.id
left join erp_system.dbo.employees_personal_phones
on employees_info.employee_id = employees_personal_phones.id
left join erp_system.dbo.employees_business_emails
on employees_info.employee_id = employees_business_emails.id
left join erp_system.dbo.employee_salary_due('2021-10-01','2021-10-28')
on employees_info.employee_id = employee_salary_due.employee_id
left join erp_system.dbo.employees_national_id
on employees_info.employee_id = employees_national_id.id
left join erp_system.dbo.departments_type
on employees_info.employee_department = departments_type.id
left join erp_system.dbo.teams_type
on employees_info.employee_team = teams_type.id
left join erp_system.dbo.positions_type
on employees_info.employee_position = positions_type.id
left join erp_system.dbo.employees_termination_info
on employees_info.employee_id = employees_termination_info.id
left join erp_system.dbo.employees_educational_qualifications
on employees_info.employee_id = employees_educational_qualifications.employee_id
left join erp_system.dbo.educational_degrees
on employees_educational_qualifications.certificate = educational_degrees.id
left join erp_system.dbo.educational_majors
on employees_educational_qualifications.major = educational_majors.id
inner join erp_system.dbo.enrollement_status
on employees_info.enrollement_status = enrollement_status.id
order by employees_info.employee_id


--PRODUCTS FULL INFO
select distinct products_category.id,
				products_type.id,
				brands_type.id,
				brands_models.model_id,
				products_category.category_name,
				products_type.product_name,
				brands_type.brand_name,
				brands_models.brand_model
from erp_system.dbo.brands_models
inner join erp_system.dbo.products_brands
on brands_models.product_id = products_brands.product_id
and brands_models.brand_id = products_brands.brand_id
inner join erp_system.dbo.products_type
on products_brands.product_id = products_type.id
inner join erp_system.dbo.brands_type
on products_brands.brand_id = brands_type.id
inner join erp_system.dbo.products_category
on products_type.product_category = products_category.id
order by products_category.category_name, products_type.product_name, brands_type.brand_name, brands_models.brand_model


--GET COMPANY PROJECTS
select company_projects.project_name,
		consultant_names.consultant_name,
		owner_names.owner_name,
		general_contractor_names.contractor_name,
		company_projects.contract_value

from erp_system.dbo.company_projects

left join erp_system.dbo.consultant_names
on company_projects.consultant_serial = consultant_names.consultant_serial

left join erp_system.dbo.owner_names
on company_projects.owner_serial = owner_names.owner_serial

left join erp_system.dbo.general_contractor_names
on company_projects.contractor_serial = general_contractor_names.contractor_serial



--SYMMETRIC KEY
create symmetric key salary_key
 WITH ALGORITHM=AES_256
    , IDENTITY_VALUE = 'Salary Protection Key'
    , Key_SOURCE = N'Salary Protection Key'
  ENCRYPTION BY PASSWORD = '#01$elec@salary';
go

--CERTIFICATE (NOT USED)
USE erp_system;
GO
CREATE CERTIFICATE Certificate_test encryption by password = '#01#serv'
WITH SUBJECT = 'certificate_subject_name' 

--ASYMMETRIC KEY (NOT USED)
CREATE ASYMMETRIC KEY test_key 
    WITH ALGORITHM = RSA_2048
    ENCRYPTION BY PASSWORD = '01$ELEC%';



--ENCRYPTION OF MASTER KEY
insert into erp_system.dbo.employees_keys
values (3, EncryptByPassPhrase('A7mad0layano0ne!', '#01$elec@salary' ))

--DECRYPTION OF MASTER KEY
select employees_keys.employee_id,
	convert(varchar(max), DECRYPTBYPASSPHRASE('A7mad0layano0ne!', employees_keys.sym_key)) as decrypt
from erp_system.dbo.employees_keys