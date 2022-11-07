
--UPDATE PETITIONED EARLY LEAVES
DECLARE @current_employee INT;
DECLARE @petition_date DATE;

DECLARE get_current_employee CURSOR FOR
select petitions_requests.benficiary_personnel
from erp_system.dbo.petitions_requests

DECLARE get_petition_date CURSOR FOR
select petitions_requests.requested_day
from erp_system.dbo.petitions_requests

OPEN get_current_employee
OPEN get_petition_date

FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_petition_date INTO @petition_date

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE erp_system.dbo.employees_attendance
	SET employees_attendance.attendance_type = 9
	WHERE employees_attendance.employee_id = @current_employee
	AND employees_attendance.calendar_date = @petition_date
	AND employees_attendance.attendance_type = 4

	FETCH NEXT FROM get_current_employee INTO @current_employee
	FETCH NEXT FROM get_petition_date INTO @petition_date
END

CLOSE get_current_employee
CLOSE get_petition_date

DEALLOCATE get_current_employee
DEALLOCATE get_petition_date

--UPDATE PETITIONED LATE ARRIVALS
DECLARE get_current_employee CURSOR FOR
select petitions_requests.benficiary_personnel
from erp_system.dbo.petitions_requests

DECLARE get_petition_date CURSOR FOR
select petitions_requests.requested_day
from erp_system.dbo.petitions_requests

OPEN get_current_employee
OPEN get_petition_date

FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_petition_date INTO @petition_date

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE erp_system.dbo.employees_attendance
	SET employees_attendance.attendance_type = 10
	WHERE employees_attendance.employee_id = @current_employee
	AND employees_attendance.calendar_date = @petition_date
	AND (employees_attendance.attendance_type = 2 OR employees_attendance.attendance_type = 3)

	FETCH NEXT FROM get_current_employee INTO @current_employee
	FETCH NEXT FROM get_petition_date INTO @petition_date
END

CLOSE get_current_employee
CLOSE get_petition_date

DEALLOCATE get_current_employee
DEALLOCATE get_petition_date

--UPDATE LATE ARRIVAL - MISSION
DECLARE @mission_date DATE;

DECLARE get_current_employee CURSOR FOR
select missions.employee_id
from erp_system.dbo.missions

DECLARE get_mission_date CURSOR FOR
select missions.mission_date
from erp_system.dbo.missions

OPEN get_current_employee
OPEN get_mission_date

FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_mission_date INTO @mission_date

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE erp_system.dbo.employees_attendance
	SET employees_attendance.attendance_type = 12
	WHERE employees_attendance.employee_id = @current_employee
	AND employees_attendance.calendar_date = @mission_date
	AND (employees_attendance.attendance_type = 1 OR employees_attendance.attendance_type = 2 OR employees_attendance.attendance_type = 3)

	FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_mission_date INTO @mission_date
END

CLOSE get_current_employee
CLOSE get_mission_date

DEALLOCATE get_current_employee
DEALLOCATE get_mission_date

--UPDATE EARLY LEAVE - MISSION
DECLARE get_current_employee CURSOR FOR
select missions.employee_id
from erp_system.dbo.missions

DECLARE get_mission_date CURSOR FOR
select missions.mission_date
from erp_system.dbo.missions

OPEN get_current_employee
OPEN get_mission_date

FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_mission_date INTO @mission_date

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE erp_system.dbo.employees_attendance
	SET employees_attendance.attendance_type = 11
	WHERE employees_attendance.employee_id = @current_employee
	AND employees_attendance.calendar_date = @mission_date
	AND (employees_attendance.attendance_type = 4)

	FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_mission_date INTO @mission_date
END

CLOSE get_current_employee
CLOSE get_mission_date

DEALLOCATE get_current_employee
DEALLOCATE get_mission_date

--UPDATE ABSENCE - MISSION
DECLARE get_current_employee CURSOR FOR
select missions.employee_id
from erp_system.dbo.missions

DECLARE get_mission_date CURSOR FOR
select missions.mission_date
from erp_system.dbo.missions

OPEN get_current_employee
OPEN get_mission_date

FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_mission_date INTO @mission_date

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE erp_system.dbo.employees_attendance
	SET employees_attendance.attendance_type = 13
	WHERE employees_attendance.employee_id = @current_employee
	AND employees_attendance.calendar_date = @mission_date
	AND (employees_attendance.attendance_type = 5)

	FETCH NEXT FROM get_current_employee INTO @current_employee
FETCH NEXT FROM get_mission_date INTO @mission_date
END

CLOSE get_current_employee
CLOSE get_mission_date

DEALLOCATE get_current_employee
DEALLOCATE get_mission_date