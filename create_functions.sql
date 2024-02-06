--GET ATTENDANCE
CREATE FUNCTION [dbo].[get_attendance](@check_in DATETIME, @check_out DATETIME)
RETURNS INT AS
BEGIN
	DECLARE @return_value INT;
	
	IF(DATEPART(WEEKDAY, @check_in) = 6 OR DATEPART(WEEKDAY, @check_in) = 7)
		SET @return_value = 6
	IF(CAST(@check_in AS TIME) >= '08:45:00' AND CAST(@check_in AS TIME) < '09:30:00')
		SET @return_value = 3
	ELSE IF(CAST(@check_in AS TIME) >= '09:30:00' AND CAST(@check_in AS TIME) < '10:15:00')
		SET @return_value = 2
	ELSE IF(CAST(@check_in AS TIME) >= '10:15:00')
		SET @return_value = 1
	ELSE IF(CAST(@check_out AS TIME) < '16:15:00')
		SET @return_value = 4
	ELSE IF(CAST(@check_in AS TIME) < '08:45:00' AND CAST(@check_out AS TIME) > '16:15:00')
		SET @return_value = 0
	ELSE
		SET @return_value = 5
	RETURN @return_value
END


--ATTENDANCE SUMMARY
CREATE FUNCTION dbo.attendance_summary(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
SELECT employees_attendance.employee_id,
		attendance_types.id AS attendance_id,
		count(employees_attendance.attendance_type) AS attendance_count,
		employees_info.enrollement_status,
		employees_info.name AS employee_name,
		attendance_types.attendance_type
FROM erp_system.dbo.employees_attendance
INNER JOIN erp_system.dbo.employees_info
ON employees_attendance.employee_id = employees_info.employee_id
RIGHT JOIN erp_system.dbo.attendance_types
ON employees_attendance.attendance_type = attendance_types.id
WHERE employees_attendance.calendar_date >= @start_date
AND employees_attendance.calendar_date <= @end_date
GROUP BY employees_attendance.employee_id, employees_info.name, attendance_types.id, attendance_types.attendance_type, employees_info.enrollement_status


--ABSENCE SUMMARY
CREATE FUNCTION dbo.absence_summary(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN

WITH get_first_degree_latency as ( SELECT attendance_summary.employee_id,
									attendance_summary.attendance_count
									FROM erp_system.dbo.attendance_summary(@start_date,@end_date)
									WHERE attendance_summary.attendance_id = 1),

	get_second_degree_latency as ( SELECT attendance_summary.employee_id,
									attendance_summary.attendance_count
									FROM erp_system.dbo.attendance_summary(@start_date,@end_date)
									WHERE attendance_summary.attendance_id = 2),

	get_third_degree_latency as ( SELECT attendance_summary.employee_id,
										attendance_summary.attendance_count
									FROM erp_system.dbo.attendance_summary(@start_date,@end_date)
									WHERE attendance_summary.attendance_id = 3),

	get_early_leave as ( SELECT attendance_summary.employee_id,
								attendance_summary.attendance_count
						FROM erp_system.dbo.attendance_summary(@start_date,@end_date)
						WHERE attendance_summary.attendance_id = 4),

	get_absence as (  SELECT attendance_summary.employee_id,
								attendance_summary.attendance_count
						FROM erp_system.dbo.attendance_summary(@start_date,@end_date)
						WHERE attendance_summary.attendance_id = 5),

	get_attended_days as (  SELECT attendance_summary.employee_id,
								SUM(attendance_summary.attendance_count) as attended_days
							FROM erp_system.dbo.attendance_summary(@start_date,@end_date)
						
							WHERE attendance_summary.attendance_id != 5
							AND attendance_summary.attendance_id != 6
							AND attendance_summary.attendance_id != 7
							
							GROUP BY attendance_summary.employee_id)

	
SELECT DISTINCT attendance_summary.employee_id,
		CASE WHEN get_first_degree_latency.attendance_count > 0 THEN get_first_degree_latency.attendance_count
		ELSE 0 END AS first_degree_count,
		CASE WHEN get_second_degree_latency.attendance_count > 0 THEN get_second_degree_latency.attendance_count
		ELSE 0 END AS second_degree_count,
		CASE WHEN get_third_degree_latency.attendance_count > 0 THEN get_third_degree_latency.attendance_count
		ELSE 0 END AS third_degree_count,
		CASE WHEN get_early_leave.attendance_count > 0 THEN get_early_leave.attendance_count
		ELSE 0 END AS early_leave_count,
		CASE 
		WHEN get_absence.attendance_count > 0 AND employees_contracts.contract_type != 2
		THEN get_absence.attendance_count
		WHEN get_absence.attendance_count > 0 AND employees_contracts.contract_type = 2 AND get_attended_days.attended_days > employees_contracts.part_time_days
		THEN 0
		WHEN get_absence.attendance_count > 0 AND employees_contracts.contract_type = 2 AND get_attended_days.attended_days < employees_contracts.part_time_days
		THEN employees_contracts.part_time_days - get_attended_days.attended_days
		ELSE 0 END AS absence_count

FROM erp_system.dbo.attendance_summary(@start_date,@end_date)

LEFT JOIN get_first_degree_latency
ON attendance_summary.employee_id = get_first_degree_latency.employee_id
LEFT JOIN get_second_degree_latency
ON attendance_summary.employee_id = get_second_degree_latency.employee_id
LEFT JOIN get_third_degree_latency
ON attendance_summary.employee_id = get_third_degree_latency.employee_id
LEFT JOIN get_early_leave
ON attendance_summary.employee_id = get_early_leave.employee_id
LEFT JOIN get_absence
ON attendance_summary.employee_id = get_absence.employee_id
LEFT JOIN get_attended_days
ON attendance_summary.employee_id = get_attended_days.employee_id
INNER JOIN erp_system.dbo.employees_contracts
on attendance_summary.employee_id = employees_contracts.employee_id

--TERMINATED EMPLOYEE WORKING DAYS
CREATE FUNCTION dbo.get_terminated_employees_work_days(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
SELECT employees_termination_info.id AS employee_id,
		employees_termination_info.resignation_date,
		DATEDIFF(DAY,@start_date,employees_termination_info.resignation_date) AS work_days
FROM erp_system.dbo.employees_termination_info
WHERE employees_termination_info.resignation_date >= @start_date
AND employees_termination_info.resignation_date <= @end_date

--EMPLOYEE SALARY DUE
CREATE FUNCTION dbo.employee_salary_due(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN

WITH get_latest_salary AS (SELECT employees_basic_salaries.employee_id,
							MAX(employees_basic_salaries.due_date) AS due_date
					FROM erp_system.dbo.employees_basic_salaries
					WHERE employees_basic_salaries.due_date <= @end_date
					GROUP BY employees_basic_salaries.employee_id)

SELECT employees_basic_salaries.employee_id,
		CASE WHEN (employees_info.is_rejoined = 0 AND employees_info.join_date > @start_date AND employees_info.join_date < @end_date)
			THEN CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.gross_salary)) AS MONEY) * DATEDIFF(DAY,employees_info.join_date,@end_date) / 30
			WHEN (employees_info.is_rejoined = 1 AND employees_rejoining_info.rejoin_date > @start_date AND employees_rejoining_info.rejoin_date < @end_date)
			THEN CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.gross_salary)) AS MONEY) * DATEDIFF(DAY,employees_rejoining_info.rejoin_date,@end_date) / 30
			WHEN (employees_termination_info.resignation_date >= @start_date AND employees_termination_info.resignation_date <= @end_date)
			THEN CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.gross_salary)) AS MONEY) * DATEDIFF(DAY,@start_date,employees_termination_info.resignation_date) / 30
			WHEN (employees_info.is_rejoined = 1 AND employees_rejoining_info.rejoin_date > @end_date)
			THEN 0
			WHEN (employees_info.is_rejoined = 0 AND (employees_termination_info.resignation_date < @start_date OR employees_info.join_date > @end_date))
			THEN 0
			ELSE CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.gross_salary)) AS MONEY)
			END AS gross_salary,

		CASE WHEN (employees_info.is_rejoined = 0 AND employees_info.join_date > @start_date AND employees_info.join_date < @end_date)
			THEN CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.insurance_and_taxes)) AS MONEY) * DATEDIFF(DAY,employees_info.join_date,@end_date) / 30
			WHEN (employees_info.is_rejoined = 1 AND employees_rejoining_info.rejoin_date > @start_date AND employees_rejoining_info.rejoin_date < @end_date)
			THEN CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.insurance_and_taxes)) AS MONEY) * DATEDIFF(DAY,employees_rejoining_info.rejoin_date,@end_date) / 30
			WHEN (employees_termination_info.resignation_date >= @start_date AND employees_termination_info.resignation_date <= @end_date)
			THEN CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.insurance_and_taxes)) AS MONEY) * DATEDIFF(DAY,@start_date,employees_termination_info.resignation_date) / 30
			WHEN (employees_info.is_rejoined = 1 AND employees_rejoining_info.rejoin_date > @end_date)
			THEN 0
			WHEN (employees_info.is_rejoined = 0 AND (employees_termination_info.resignation_date < @start_date OR employees_info.join_date > @end_date))
			THEN 0
			ELSE CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.insurance_and_taxes)) AS MONEY)
			END AS insurance_and_taxes,

		CASE WHEN (employees_info.is_rejoined = 0 AND employees_info.join_date > @start_date AND employees_info.join_date < @end_date)
			THEN CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.net_salary)) AS MONEY) * DATEDIFF(DAY,employees_info.join_date,@end_date) / 30
			WHEN (employees_info.is_rejoined = 1 AND employees_rejoining_info.rejoin_date > @start_date AND employees_rejoining_info.rejoin_date < @end_date)
			THEN CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.net_salary)) AS MONEY) * DATEDIFF(DAY,employees_rejoining_info.rejoin_date,@end_date) / 30
			WHEN (employees_termination_info.resignation_date >= @start_date AND employees_termination_info.resignation_date <= @end_date)
			THEN CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.net_salary)) AS MONEY) * DATEDIFF(DAY,@start_date,employees_termination_info.resignation_date) / 30
			WHEN (employees_info.is_rejoined = 1 AND employees_rejoining_info.rejoin_date > @end_date)
			THEN 0
			WHEN (employees_info.is_rejoined = 0 AND (employees_termination_info.resignation_date < @start_date OR employees_info.join_date > @end_date))
			THEN 0
			ELSE CAST(CONVERT(VARCHAR, DECRYPTBYKEY(employees_basic_salaries.net_salary)) AS MONEY)
			END AS net_salary,
		employees_basic_salaries.due_year,
		employees_basic_salaries.due_month,
		employees_basic_salaries.date_added
FROM erp_system.dbo.employees_info

LEFT JOIN erp_system.dbo.employees_rejoining_info
ON employees_info.employee_id = employees_rejoining_info.id

INNER JOIN erp_system.dbo.employees_basic_salaries
ON employees_info.employee_id = employees_basic_salaries.employee_id

INNER JOIN get_latest_salary
ON employees_basic_salaries.employee_id = get_latest_salary.employee_id
AND employees_basic_salaries.due_date = get_latest_salary.due_date

LEFT JOIN erp_system.dbo.employees_termination_info
ON employees_info.employee_id = employees_termination_info.id

WHERE (employees_info.enrollement_status < 4 OR 
employees_termination_info.resignation_date >= @start_date)


--GENERATE SALARIES
CREATE FUNCTION dbo.generate_salaries(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
WITH get_employee_penalties AS (SELECT penalties_requests.employee_on_penalty,
                                 SUM(penalties_requests.penalty_days) AS penalty_days
							FROM erp_system.dbo.penalties_requests
							WHERE penalties_requests.penalty_year = DATEPART(YEAR,@start_date)
							AND penalties_requests.penalty_month = DATEPART(MONTH,@start_date)
							AND penalties_requests.penalty_status = 4
							GROUP BY penalties_requests.employee_on_penalty),

get_employee_rewards AS (SELECT rewards_requests.employee_on_reward,
                                   		SUM(rewards_requests.reward_days) AS reward_days
                          FROM erp_system.dbo.rewards_requests
						  WHERE rewards_requests.reward_year = DATEPART(YEAR,@start_date)
						  AND rewards_requests.reward_month = DATEPART(MONTH,@start_date)
						  AND rewards_requests.reward_status = 4
						  GROUP BY rewards_requests.employee_on_reward),

get_salary_hold AS (SELECT salary_hold.employee_id
					FROM erp_system.dbo.salary_hold
					WHERE salary_hold.due_year = DATEPART(YEAR,@start_date)
					AND salary_hold.due_month = DATEPART(MONTH,@start_date)
					AND salary_hold.is_valid = 1),

get_deductions AS (SELECT deductions_requests.employee_id,
							sum(deductions_requests.deduction_value) as deduction_value
					FROM erp_system.dbo.deductions_requests
					WHERE deductions_requests.start_date <= @start_date 
					AND deductions_requests.end_date >= @end_date
					AND deductions_requests.deduction_status = 4
					GROUP BY deductions_requests.employee_id),

get_allowances AS (SELECT allowances_requests.employee_id,
						sum(allowances_requests.allowance_value) as allowance_value
					FROM erp_system.dbo.allowances_requests
					WHERE allowances_requests.start_date <= @start_date 
					AND allowances_requests.end_date >= @end_date
					AND allowances_requests.allowance_status = 4
					GROUP BY allowances_requests.employee_id)					

SELECT DISTINCT employees_info.employee_id,
		employees_payroll_info.branch_code,
		employees_payroll_info.bank_payroll_id,
		
		employees_payroll_info.account_id,
		
       employee_salary_due.gross_salary,
       employee_salary_due.insurance_and_taxes,
       attendance_deductions.deducted_amount AS attendance_ded_value,
	   
	   CASE 
	   WHEN employees_contracts.contract_type = 2
		THEN (get_employee_penalties.penalty_days * employee_salary_due.net_salary) / employees_contracts.part_time_days
		ELSE (get_employee_penalties.penalty_days * employee_salary_due.net_salary) / 30
		END  AS penalty_value,

		  CASE 
	   WHEN employees_contracts.contract_type = 2 AND get_employee_rewards.reward_days IS NOT NULL
		THEN ((get_employee_rewards.reward_days + get_part_time_extra_days.extra_days) * employee_salary_due.net_salary) / employees_contracts.part_time_days 
	   WHEN  employees_contracts.contract_type = 2 
	   THEN (get_part_time_extra_days.extra_days * employee_salary_due.net_salary) / employees_contracts.part_time_days 
		ELSE (get_employee_rewards.reward_days * employee_salary_due.net_salary) / 30
		END  AS reward_value,
       		
		get_allowances.allowance_value,
		get_deductions.deduction_value,
		
		employees_info.name,
		employees_payroll_info.bic_code

FROM erp_system.dbo.employees_info
LEFT JOIN erp_system.dbo.attendance_deductions(@start_date,@end_date)
ON employees_info.employee_id = attendance_deductions.employee_id
INNER JOIN erp_system.dbo.employee_salary_due(@start_date,@end_date)
ON employees_info.employee_id = employee_salary_due.employee_id
INNER JOIN erp_system.dbo.employees_contracts
ON employees_info.employee_id = employees_contracts.employee_id
LEFT JOIN erp_system.dbo.get_part_time_extra_days(@start_date,@end_date)
ON employees_info.employee_id = get_part_time_extra_days.employee_id
LEFT JOIN get_employee_penalties
ON employees_info.employee_id = get_employee_penalties.employee_ON_penalty
LEFT JOIN get_employee_rewards
ON employees_info.employee_id = get_employee_rewards.employee_ON_reward
LEFT JOIN get_salary_hold
ON employees_info.employee_id = get_salary_hold.employee_id
LEFT JOIN get_allowances
ON employees_info.employee_id = get_allowances.employee_id
LEFT JOIN get_deductions
ON employees_info.employee_id = get_deductions.employee_id
LEFT JOIN erp_system.dbo.employees_payroll_info
ON employees_info.employee_id = employees_payroll_info.employee_id
WHERE employees_payroll_info.is_preferred = 1
AND get_salary_hold.employee_id IS NULL
--ATTENDANCE DEDUCTIONS
CREATE FUNCTION dbo.attendance_deductions(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
SELECT  absence_summary.employee_id,
		absence_summary.third_degree_count + 
		absence_summary.second_degree_count * 2 + 
		absence_summary.first_degree_count * 4 + 
		absence_summary.early_leave_count * 4 AS deducted_hours,
		absence_summary.absence_count AS deducted_days,
		CASE 
		WHEN 
			absence_summary.employee_id = employees_excluded_attendance.employee_id 
			AND employees_excluded_attendance.is_excluded = 1 THEN 0
		WHEN employees_contracts.contract_type = 2
		THEN
		(employee_salary_due.net_salary / employees_contracts.part_time_days) * absence_summary.absence_count + 
				((employee_salary_due.net_salary / employees_contracts.part_time_days) / 8) * 
				(absence_summary.third_degree_count + 
				absence_summary.second_degree_count * 2 + 
				absence_summary.first_degree_count * 4 + 
				absence_summary.early_leave_count * 4)	

		ELSE
		(employee_salary_due.net_salary / 30) * absence_summary.absence_count + 
				((employee_salary_due.net_salary / 30) / 8) * 
				(absence_summary.third_degree_count + 
				absence_summary.secONd_degree_count * 2 + 
				absence_summary.first_degree_count * 4 + 
				absence_summary.early_leave_count * 4)	
		END AS deducted_amount
FROM dbo.absence_summary(@start_date,@end_date)

INNER JOIN erp_system.dbo.employee_salary_due(@start_date,@end_date)
ON absence_summary.employee_id = employee_salary_due.employee_id

INNER JOIN erp_system.dbo.employees_excluded_attendance
ON absence_summary.employee_id = employees_excluded_attendance.employee_id

INNER JOIN erp_system.dbo.employees_contracts
ON absence_summary.employee_id = employees_contracts.employee_id

--PART-TIME EXTRA DAYS
CREATE FUNCTION dbo.get_part_time_extra_days(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
WITH get_attended_days AS (SELECT attendance_summary.employee_id,
								SUM(attendance_summary.attendance_count) as attended_days
							FROM erp_system.dbo.attendance_summary(@start_date, @end_date)
							INNER JOIN erp_system.dbo.employees_contracts
							on attendance_summary.employee_id = employees_contracts.employee_id
							WHERE attendance_summary.attendance_id != 5
							AND attendance_summary.attendance_id != 6
							AND attendance_summary.attendance_id != 7
							AND employees_contracts.contract_type = 2
							GROUP BY attendance_summary.employee_id)
SELECT get_attended_days.employee_id,
		get_attended_days.attended_days - employees_contracts.part_time_days AS extra_days
FROM get_attended_days
INNER JOIN erp_system.dbo.employees_contracts
on get_attended_days.employee_id = employees_contracts.employee_id

--EMPLOYEE REGULAR VACATIONS DAYS COUNT
CREATE FUNCTION dbo.get_regular_vacations_amount(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
SELECT vacation_leave_requests.benficiary_personnel,
		CASE WHEN DATEPART(YEAR, vacation_leave_requests.leave_end_date) > DATEPART(YEAR, GETDATE()) 
		THEN DATEDIFF(DAY, vacation_leave_requests.leave_start_date, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1)) + 1
		ELSE DATEDIFF(DAY, vacation_leave_requests.leave_start_date, vacation_leave_requests.leave_end_date) + 1
		END AS vacation_days

FROM erp_system.dbo.vacation_leave_requests
WHERE vacation_leave_requests.leave_start_date >= @start_date
AND vacation_leave_requests.leave_start_date <= @end_date
AND vacation_leave_requests.request_status = 4
AND vacation_leave_requests.request_type = 1
--AND (vacation_leave_requests.request_type = 1 OR vacation_leave_requests.request_type = 6 OR vacation_leave_requests.request_type = 7)


--EMPLOYEE REGULAR VACATIONS COUNT
CREATE FUNCTION dbo.get_emergency_vacations_count(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
SELECT get_emergency_vacations_amount.benficiary_personnel,
		SUM(get_emergency_vacations_amount.vacation_days) AS vacation_days

FROM erp_system.dbo.get_emergency_vacations_amount(@start_date,@end_date)
GROUP BY get_emergency_vacations_amount.benficiary_personnel

--EMPLOYEE EMERGENCY VACATIONS DAYS COUNT
CREATE FUNCTION dbo.get_emergency_vacations_amount(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
SELECT vacation_leave_requests.benficiary_personnel,
		CASE WHEN DATEPART(YEAR, vacation_leave_requests.leave_end_date) > DATEPART(YEAR, GETDATE()) 
		THEN DATEDIFF(DAY, vacation_leave_requests.leave_start_date, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1)) + 1
		ELSE DATEDIFF(DAY, vacation_leave_requests.leave_start_date, vacation_leave_requests.leave_end_date) + 1
		END AS vacation_days

FROM erp_system.dbo.vacation_leave_requests
WHERE vacation_leave_requests.leave_start_date >= @start_date
AND vacation_leave_requests.leave_start_date <= @end_date
AND vacation_leave_requests.request_status = 4
AND (vacation_leave_requests.request_type = 6 
OR vacation_leave_requests.request_type = 7)
--AND (vacation_leave_requests.request_type = 1 OR vacation_leave_requests.request_type = 6 OR vacation_leave_requests.request_type = 7)


--EMPLOYEE REGULAR VACATIONS COUNT
CREATE FUNCTION dbo.get_emergency_vacations_count(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
SELECT get_emergency_vacations_amount.benficiary_personnel,
		SUM(get_emergency_vacations_amount.vacation_days) AS vacation_days

FROM erp_system.dbo.get_emergency_vacations_amount(@start_date,@end_date)
GROUP BY get_emergency_vacations_amount.benficiary_personnel

--EMPLOYEMENT STATUS REPORT
CREATE FUNCTION dbo.get_employement_status_report()
RETURNS TABLE AS
RETURN

select enrollement_status.id as status_id,
		count(employees_info.enrollement_status) as status_count,
		enrollement_status.enrollement_status
from erp_system.dbo.employees_info
right join erp_system.dbo.enrollement_status
on employees_info.enrollement_status = enrollement_status.id
group by enrollement_status.id, enrollement_status.enrollement_status


--PROBATION PERIOD EMPLOYEES
CREATE FUNCTION dbo.get_employees_on_probation()
RETURNS TABLE AS
RETURN

SELECT employees_info.employee_id,
		employees_info.employee_department as department_id,
		employees_info.employee_team as team_id,
		employees_info.employee_position as position_id,
		employees_contracts.probation_period,
		employees_contracts.probation_period_unit,
		
		employees_info.join_date,
		CASE WHEN employees_contracts.probation_period_unit = 4
		THEN DATEADD(YEAR, employees_contracts.probation_period, employees_info.join_date)
		WHEN employees_contracts.probation_period_unit = 3
		THEN DATEADD(MONTH, employees_contracts.probation_period, employees_info.join_date)
		WHEN employees_contracts.probation_period_unit = 2
		THEN DATEADD(DAY, employees_contracts.probation_period * 7, employees_info.join_date)
		WHEN employees_contracts.probation_period_unit = 1
		THEN DATEADD(DAY, employees_contracts.probation_period, employees_info.join_date)
		ELSE employees_info.join_date
		END AS employment_date,

		employees_info.name,
		departments_type.department as department_name,
		teams_type.team as team_name,
		positions_type.position as position_name

from erp_system.dbo.employees_info

inner join erp_system.dbo.departments_type
on employees_info.employee_department = departments_type.id

inner join erp_system.dbo.teams_type
on employees_info.employee_team = teams_type.id

inner join erp_system.dbo.positions_type
on employees_info.employee_position = positions_type.id

inner join erp_system.dbo.employees_contracts
on employees_info.employee_id = employees_contracts.employee_id

where employees_info.enrollement_status = 1


--NOTICE PERIOD EMPLOYEES
CREATE FUNCTION dbo.get_employees_on_notice()
RETURNS TABLE AS
RETURN

SELECT employees_info.employee_id,
		employees_info.employee_department as department_id,
		employees_info.employee_team as team_id,
		employees_info.employee_position as position_id,
		employees_contracts.notice_period,
		employees_contracts.notice_period_unit,
		
		employees_termination_info.on_notice_date,
		employees_termination_info.resignation_date,

		employees_info.name,
		departments_type.department as department_name,
		teams_type.team as team_name,
		positions_type.position as position_name

from erp_system.dbo.employees_info

inner join erp_system.dbo.departments_type
on employees_info.employee_department = departments_type.id

inner join erp_system.dbo.teams_type
on employees_info.employee_team = teams_type.id

inner join erp_system.dbo.positions_type
on employees_info.employee_position = positions_type.id

inner join erp_system.dbo.employees_contracts
on employees_info.employee_id = employees_contracts.employee_id

inner join erp_system.dbo.employees_termination_info
on employees_info.employee_id = employees_termination_info.id

where employees_info.enrollement_status = 3

--NO PAYROLL EMPLOYEES
CREATE FUNCTION dbo.get_no_payroll_employees()
RETURNS TABLE AS
RETURN

WITH get_payroll_count AS (SELECT employees_payroll_info.employee_id,
									count(employees_payroll_info.bic_code) AS payroll_count
							FROM erp_system.dbo.employees_payroll_info
							GROUP BY employees_payroll_info.employee_id
							)
SELECT employees_info.employee_id,
		employees_info.name,
		departments_type.id as department_id,
		teams_type.id as team_id,
		positions_type.id as position_id,
		employees_payroll_info.bic_code,
		departments_type.department as department_name,
		teams_type.team as team_name,
		positions_type.position as position_name

FROM erp_system.dbo.employees_info

INNER JOIN erp_system.dbo.employees_payroll_info
ON employees_info.employee_id = employees_payroll_info.employee_id

INNER JOIN get_payroll_count
ON employees_info.employee_id = get_payroll_count.employee_id

INNER JOIN erp_system.dbo.departments_type
ON employees_info.employee_department = departments_type.id

INNER JOIN erp_system.dbo.teams_type
ON employees_info.employee_team = teams_type.id

INNER JOIN erp_system.dbo.positions_type
ON employees_info.employee_position = positions_type.id

WHERE employees_info.enrollement_status <= 2
and employees_payroll_info.bic_code = 'CASH'
and get_payroll_count.payroll_count = 1


--PUNCUALITY
CREATE FUNCTION dbo.get_employees_punctuality(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN

SELECT employees_attendance.employee_id,
		COUNT(employees_attendance.attendance_type) as type_count,
		employees_info.name

FROM erp_system.dbo.employees_attendance

INNER JOIN erp_system.dbo.employees_info
ON employees_attendance.employee_id = employees_info.employee_id

INNER JOIN erp_system.dbo.employees_excluded_attendance
ON employees_excluded_attendance.employee_id = employees_info.employee_id

WHERE employees_attendance.calendar_date >= @start_date
AND employees_attendance.calendar_date <= @end_date
AND (employees_attendance.attendance_type = 0 OR 
	(employees_attendance.attendance_type >= 6 AND employees_attendance.attendance_type <= 7) OR
	(employees_attendance.attendance_type >= 11 AND employees_attendance.attendance_type <= 12) )
AND employees_info.enrollement_status <= 3
AND employees_excluded_attendance.is_excluded = 0

GROUP BY employees_attendance.employee_id, employees_info.name



--PENALTIES REPORT
CREATE FUNCTION dbo.get_penalties_report(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN

SELECT penalties_requests.employee_on_penalty,
		SUM(penalties_requests.penalty_days) as penalty_day_amount,
		COUNT(penalties_requests.penalty_days) as penalty_day_count,
		employees_info.name

FROM erp_system.dbo.penalties_requests

INNER JOIN erp_system.dbo.employees_info
ON penalties_requests.employee_on_penalty = employees_info.employee_id

WHERE penalties_requests.penalty_month >= DATEPART(MONTH,@start_date)
AND penalties_requests.penalty_month <= DATEPART(MONTH,@end_date)
AND penalties_requests.penalty_year >= DATEPART(YEAR,@start_date)
AND penalties_requests.penalty_year <= DATEPART(YEAR,@end_date)
AND penalties_requests.penalty_status = 4
GROUP BY penalties_requests.employee_on_penalty, employees_info.name


--REWARDS REPORT
CREATE FUNCTION dbo.get_rewards_report(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN

SELECT rewards_requests.employee_on_reward,
		SUM(rewards_requests.reward_days) as reward_day_amount,
		COUNT(rewards_requests.reward_days) as reward_day_count,
		employees_info.name

FROM erp_system.dbo.rewards_requests

INNER JOIN erp_system.dbo.employees_info
ON rewards_requests.employee_on_reward = employees_info.employee_id

WHERE rewards_requests.reward_month >= DATEPART(MONTH,@start_date)
AND rewards_requests.reward_month <= DATEPART(MONTH,@end_date)
AND rewards_requests.reward_year >= DATEPART(YEAR,@start_date)
AND rewards_requests.reward_year <= DATEPART(YEAR,@end_date)
AND rewards_requests.reward_status = 4
GROUP BY rewards_requests.employee_on_reward, employees_info.name