--UPDATE ABSENCE - VISIT
DECLARE @current_employee INT;
DECLARE @visit_date DATE;

DECLARE get_current_employee CURSOR FOR
select client_visits.sales_person
from erp_system.dbo.client_visits

DECLARE get_visit_date CURSOR FOR
select client_visits.date_of_visit
from erp_system.dbo.client_visits

OPEN get_current_employee
OPEN get_visit_date

FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_visit_date INTO @visit_date

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE erp_system.dbo.employees_attendance
	SET employees_attendance.attendance_type = 13
	WHERE employees_attendance.employee_id = @current_employee
	AND employees_attendance.calendar_date = @visit_date
	AND (employees_attendance.attendance_type = 5)

	FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_visit_date INTO @visit_date
END

CLOSE get_current_employee
CLOSE get_visit_date

DEALLOCATE get_current_employee
DEALLOCATE get_visit_date


--UPDATE ABSENCE - OFFICE MEETING
DECLARE @office_meeting_date DATE;

DECLARE get_current_employee CURSOR FOR
select office_meetings.called_by
from erp_system.dbo.office_meetings

DECLARE get_office_meeting_date CURSOR FOR
select office_meetings.date_of_meeting
from erp_system.dbo.office_meetings

OPEN get_current_employee
OPEN get_office_meeting_date

FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_office_meeting_date INTO @office_meeting_date

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE erp_system.dbo.employees_attendance
	SET employees_attendance.attendance_type = 0
	WHERE employees_attendance.employee_id = @current_employee
	AND employees_attendance.calendar_date = @office_meeting_date
	AND (employees_attendance.attendance_type = 5)

	FETCH NEXT FROM get_current_employee INTO @current_employee
	FETCH NEXT FROM get_office_meeting_date INTO @office_meeting_date
END

CLOSE get_current_employee
CLOSE get_office_meeting_date

DEALLOCATE get_current_employee
DEALLOCATE get_office_meeting_date

