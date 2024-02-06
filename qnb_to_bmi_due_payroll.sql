SELECT employees_info.employee_id,
		employees_info.name,
		employees_payroll_info.bic_code,
		employees_payroll_info.is_preferred
FROM erp_system.dbo.employees_info
INNER JOIN erp_system.dbo.employees_payroll_info
on employees_info.employee_id = employees_payroll_info.employee_id
INNER JOIN erp_system.dbo.employee_salary_due('2023-11-01', '2023-11-30')
ON employees_info.employee_id = employee_salary_due.employee_id
WHERE employees_payroll_info.bic_code = 'QNBAEGCXXXX'
AND employees_payroll_info.is_preferred = 1
--AND employees_info.enrollement_status <= 3
ORDER BY employees_info.name