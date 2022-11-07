insert into erp_system.dbo.employees_info 
select 217,
		name,
		gender,
		employee_department,
		employee_team,
		employee_position,
		birth_date,
		join_date,
		currently_enrolled,
		date_added
from erp_system.dbo.employees_info 
where employees_info.employee_id = 220

update erp_system.dbo.employees_basic_salaries
set employee_id = 217 where employee_id = 220

update erp_system.dbo.employees_national_id
set id = 217 where id = 220

update erp_system.dbo.employees_payroll_info
set employee_id = 217 where employee_id = 220

update erp_system.dbo.employees_personal_emails
set id = 217 where id = 220

update erp_system.dbo.employees_business_emails
set id = 217 where id = 220

update erp_system.dbo.employees_personal_phones
set id = 217 where id = 220

update erp_system.dbo.employees_business_phones
set id = 217 where id = 220

update erp_system.dbo.employees_excluded_attendance
set employee_id = 217 where employee_id = 220

update erp_system.dbo.employees_educational_qualifications
set employee_id = 217 where employee_id = 220

update erp_system.dbo.employees_submitted_documents
set employee_id = 217 where employee_id = 220

update erp_system.dbo.employees_attendance
set employee_id = 217 where employee_id = 220

update erp_system.dbo.employees_info
set employee_id = 217 where employee_id = 220
