
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