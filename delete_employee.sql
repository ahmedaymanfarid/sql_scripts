DECLARE @employee_id INT = 239;

delete from erp_system.dbo.employees_basic_salaries
where employee_id =  @employee_id

delete from erp_system.dbo.employees_national_id
where id =  @employee_id

delete from erp_system.dbo.employees_payroll_info
where employee_id =  @employee_id

delete from erp_system.dbo.employees_personal_emails
where id =  @employee_id

delete from erp_system.dbo.employees_business_emails
where id =  @employee_id

delete from erp_system.dbo.employees_personal_phones
where id =  @employee_id

delete from erp_system.dbo.employees_business_phones
where id =  @employee_id

delete from erp_system.dbo.employees_excluded_attendance
where employee_id =  @employee_id

delete from erp_system.dbo.employees_educational_qualifications
where employee_id =  @employee_id

delete from erp_system.dbo.employees_submitted_documents
where employee_id =  @employee_id

delete from erp_system.dbo.employees_attendance
where employee_id =  @employee_id

delete from erp_system.dbo.employees_info
where employee_id =  @employee_id

delete from zkbiotime.dbo.personnel_employee
where emp_code = @employee_id