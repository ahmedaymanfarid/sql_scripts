select employees_attendance.employee_id,
		employees_attendance.attendance_type,
		employees_attendance.calendar_date,
		employees_attendance.first_in,
		employees_attendance.last_out,
		employees_info.name,
		attendance_types.attendance_type
from erp_system.dbo.employees_attendance
inner join erp_system.dbo.employees_info
on employees_attendance.employee_id = employees_info.employee_id
inner join erp_system.dbo.attendance_types
on employees_attendance.attendance_type = attendance_types.id
where employees_info.currently_enrolled = 1
and employees_attendance.calendar_date >= '2021-06-01'
and employees_attendance.calendar_date <='2021-06-30'
order by employees_info.name;