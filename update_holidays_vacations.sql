--UPDATE HOLIDAY ATTENDANCE
DECLARE @start_date DATETIME;
DECLARE @end_date DATETIME;

DECLARE get_holiday_start_date CURSOR FOR
select public_holidays.start_date
from erp_system.dbo.public_holidays

DECLARE get_holiday_end_date CURSOR FOR
select public_holidays.end_date
from erp_system.dbo.public_holidays

OPEN get_holiday_start_date
OPEN get_holiday_end_date

FETCH NEXT FROM get_holiday_start_date INTO @start_date
FETCH NEXT FROM get_holiday_end_date INTO @end_date

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE erp_system.dbo.employees_attendance
	SET employees_attendance.attendance_type = 7
	WHERE employees_attendance.calendar_date >= CAST(@start_date AS DATE)
	AND employees_attendance.calendar_date <= CAST(@end_date AS DATE)

	FETCH NEXT FROM get_holiday_start_date INTO @start_date
	FETCH NEXT FROM get_holiday_end_date INTO @end_date
END

CLOSE get_holiday_start_date
CLOSE get_holiday_end_date

DEALLOCATE get_holiday_start_date
DEALLOCATE get_holiday_end_date

--UPDATE VACATIONS
DECLARE @current_employee INT;

DECLARE get_current_employee CURSOR FOR
select vacation_leave_requests.benficiary_personnel
from erp_system.dbo.vacation_leave_requests
where vacation_leave_requests.request_status = 4

DECLARE get_vacation_start_date CURSOR FOR
select vacation_leave_requests.leave_start_date
from erp_system.dbo.vacation_leave_requests
where vacation_leave_requests.request_status = 4

DECLARE get_vacation_end_date CURSOR FOR
select vacation_leave_requests.leave_end_date
from erp_system.dbo.vacation_leave_requests
where vacation_leave_requests.request_status = 4

OPEN get_current_employee
OPEN get_vacation_start_date
OPEN get_vacation_end_date

FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_vacation_start_date INTO @start_date
FETCH NEXT FROM get_vacation_end_date INTO @end_date

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE erp_system.dbo.employees_attendance
	SET employees_attendance.attendance_type = 8
	WHERE employees_attendance.employee_id = @current_employee
	AND employees_attendance.calendar_date >= CAST(@start_date AS DATE)
	AND employees_attendance.calendar_date <= CAST(@end_date AS DATE)

	FETCH NEXT FROM get_current_employee INTO @current_employee
	FETCH NEXT FROM get_vacation_start_date INTO @start_date
	FETCH NEXT FROM get_vacation_end_date INTO @end_date
END

CLOSE get_current_employee
CLOSE get_vacation_start_date
CLOSE get_vacation_end_date

DEALLOCATE get_current_employee
DEALLOCATE get_vacation_start_date
DEALLOCATE get_vacation_end_date