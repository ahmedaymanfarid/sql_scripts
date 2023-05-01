--SALES PEOPLE MONTHLY RFQ COUNT
CREATE VIEW dbo.sales_rfqs_monthly_count AS
SELECT sales_person,
		YEAR(rfqs.issue_date) as issue_year,
		MONTH(rfqs.issue_date) as issue_month,
		rfq_status,
		COUNT(rfq_status) as rfq_count
FROM erp_system.dbo.rfqs
GROUP BY sales_person, YEAR(rfqs.issue_date), MONTH(rfqs.issue_date), rfq_status;

--SALES PEOPLE MONTHLY RFQ PRICE
CREATE VIEW dbo.sales_rfqs_monthly_price AS
SELECT rfqs.sales_person,
		YEAR(rfqs.issue_date) as issue_year,
		MONTH(rfqs.issue_date) as issue_month,
		rfq_status,
		SUM(work_offers.price_value) as offered_amount
FROM erp_system.dbo.rfqs

INNER JOIN erp_system.dbo.work_offers_rfqs
ON rfqs.sales_person = work_offers_rfqs.sales_person
AND rfqs.rfq_serial = work_offers_rfqs.rfq_serial
AND rfqs.rfq_version = work_offers_rfqs.rfq_version

INNER JOIN erp_system.dbo.work_offers
ON work_offers_rfqs.sales_person = work_offers.sales_person
AND work_offers_rfqs.offer_serial = work_offers.offer_serial
AND work_offers_rfqs.offer_version = work_offers.offer_version

GROUP BY rfqs.sales_person, YEAR(rfqs.issue_date), MONTH(rfqs.issue_date), rfq_status;

--SALES PEOPLE MONTHLY RFQ COUNT & PRICE
CREATE VIEW sales_rfqs_monthly_count_and_price AS
SELECT sales_rfqs_monthly_count.sales_person,
		sales_rfqs_monthly_count.issue_year,
		sales_rfqs_monthly_count.issue_month,
		sales_rfqs_monthly_price.rfq_status,
		sales_rfqs_monthly_count.rfq_count,
		sales_rfqs_monthly_price.offered_amount
FROM dbo.sales_rfqs_monthly_count 
INNER JOIN dbo.sales_rfqs_monthly_price
ON sales_rfqs_monthly_count.sales_person = sales_rfqs_monthly_price.sales_person
AND sales_rfqs_monthly_count.issue_year = sales_rfqs_monthly_price.issue_year
AND sales_rfqs_monthly_count.issue_month = sales_rfqs_monthly_price.issue_month
AND sales_rfqs_monthly_count.rfq_status = sales_rfqs_monthly_price.rfq_status

--SALES PEOPLE YEARLY RFQ COUNT
CREATE VIEW dbo.sales_rfqs_yearly_count AS
SELECT sales_person,
		YEAR(rfqs.issue_date) as issue_year,
		rfq_status,
		COUNT(rfq_status) as rfq_count
FROM erp_system.dbo.rfqs
GROUP BY sales_person, YEAR(rfqs.issue_date), rfq_status;

--SALES PEOPLE YEARLY RFQ PRICE
CREATE VIEW dbo.sales_rfqs_yearly_price AS
SELECT rfqs.sales_person,
		YEAR(rfqs.issue_date) as issue_year,
		rfq_status,
		SUM(work_offers.price_value) as offered_amount
FROM erp_system.dbo.rfqs

INNER JOIN erp_system.dbo.work_offers_rfqs
ON rfqs.sales_person = work_offers_rfqs.sales_person
AND rfqs.rfq_serial = work_offers_rfqs.rfq_serial
AND rfqs.rfq_version = work_offers_rfqs.rfq_version

INNER JOIN erp_system.dbo.work_offers
ON work_offers_rfqs.sales_person = work_offers.sales_person
AND work_offers_rfqs.offer_serial = work_offers.offer_serial
AND work_offers_rfqs.offer_version = work_offers.offer_version

GROUP BY rfqs.sales_person, YEAR(rfqs.issue_date), rfq_status;

--SALES PEOPLE YEARLY RFQ COUNT & PRICE
CREATE VIEW sales_rfqs_yearly_count_and_price AS
SELECT sales_rfqs_yearly_count.sales_person,
		sales_rfqs_yearly_count.issue_year,
		sales_rfqs_yearly_price.rfq_status,
		sales_rfqs_yearly_count.rfq_count,
		sales_rfqs_yearly_price.offered_amount
FROM dbo.sales_rfqs_yearly_count 
INNER JOIN dbo.sales_rfqs_yearly_price
ON sales_rfqs_yearly_count.sales_person = sales_rfqs_yearly_price.sales_person
AND sales_rfqs_yearly_count.issue_year = sales_rfqs_yearly_price.issue_year
AND sales_rfqs_yearly_count.rfq_status = sales_rfqs_yearly_price.rfq_status


--SALES PEOPLE TOTAL RFQ COUNT
CREATE VIEW dbo.sales_rfqs_total_count AS
SELECT sales_person,
		YEAR(rfqs.issue_date) as issue_year,
		COUNT(rfq_status) as rfq_count
FROM erp_system.dbo.rfqs
GROUP BY sales_person, YEAR(rfqs.issue_date);

--SALES PEOPLE TOTAL RFQ PRICE
CREATE VIEW dbo.sales_rfqs_total_price AS
SELECT rfqs.sales_person,
		YEAR(rfqs.issue_date) as issue_year,
		SUM(work_offers.price_value) as offered_amount
FROM erp_system.dbo.rfqs

INNER JOIN erp_system.dbo.work_offers_rfqs
ON rfqs.sales_person = work_offers_rfqs.sales_person
AND rfqs.rfq_serial = work_offers_rfqs.rfq_serial
AND rfqs.rfq_version = work_offers_rfqs.rfq_version

INNER JOIN erp_system.dbo.work_offers
ON work_offers_rfqs.sales_person = work_offers.sales_person
AND work_offers_rfqs.offer_serial = work_offers.offer_serial
AND work_offers_rfqs.offer_version = work_offers.offer_version

GROUP BY rfqs.sales_person, YEAR(rfqs.issue_date);

--SALES PEOPLE TOTAL RFQ COUNT & PRICE
CREATE VIEW sales_rfqs_total_count_and_price AS
SELECT sales_rfqs_total_count.sales_person,
		sales_rfqs_total_count.issue_year,
		sales_rfqs_total_count.rfq_count,
		sales_rfqs_total_price.offered_amount
FROM dbo.sales_rfqs_total_count 
INNER JOIN dbo.sales_rfqs_total_price
ON sales_rfqs_total_count.sales_person = sales_rfqs_total_price.sales_person
AND sales_rfqs_total_count.issue_year = sales_rfqs_total_price.issue_year

--SALES PEOPLE RFQS STATISTICS
CREATE VIEW sales_rfqs_yearly_statistics AS
SELECT sales_rfqs_yearly_count_and_price.sales_person,
		sales_rfqs_yearly_count_and_price.issue_year,
		sales_rfqs_yearly_count_and_price.rfq_status,
		sales_rfqs_yearly_count_and_price.rfq_count,
		sales_rfqs_total_count_and_price.rfq_count as total_count,
		sales_rfqs_yearly_count_and_price.rfq_count * 100 / sales_rfqs_total_count_and_price.rfq_count as count_percent,
		sales_rfqs_yearly_count_and_price.offered_amount,
		sales_rfqs_total_count_and_price.offered_amount as total_amount,
		sales_rfqs_yearly_count_and_price.offered_amount * 100 / sales_rfqs_total_count_and_price.offered_amount as price_percent
from dbo.sales_rfqs_yearly_count_and_price
left join dbo.sales_rfqs_total_count_and_price 
on sales_rfqs_yearly_count_and_price.sales_person = sales_rfqs_total_count_and_price.sales_person
and sales_rfqs_yearly_count_and_price.issue_year = sales_rfqs_total_count_and_price.issue_year

--PRE-SALES PEOPLE RFQ STATISTICS
CREATE VIEW dbo.total_monthly_presales_rfqs AS
SELECT assigned_engineer,
		YEAR(rfqs.issue_date) as issue_year,
		MONTH(rfqs.issue_date) as issue_month,
		rfq_status,
		COUNT(rfq_status) as rfq_count
FROM erp_system.dbo.rfqs
GROUP BY assigned_engineer, YEAR(rfqs.issue_date), MONTH(rfqs.issue_date), rfq_status;


CREATE VIEW dbo.total_yearly_presales_rfqs AS
SELECT assigned_engineer,
		YEAR(rfqs.issue_date) as issue_year,
		rfq_status,
		COUNT(rfq_status) as rfq_count
FROM erp_system.dbo.rfqs
GROUP BY assigned_engineer, YEAR(rfqs.issue_date), rfq_status;


CREATE FUNCTION dbo.get_yearly_rfqs (@sales_person INT, @year_number INT) 
RETURNS TABLE 
AS 

RETURN 	(	SELECT sales_person,
					rfq_status,
					COUNT(rfq_status) as rfq_count
			FROM erp_system.dbo.rfqs
			WHERE rfqs.sales_person = @sales_person
					AND YEAR(rfqs.issue_date) = @year_number
			GROUP BY sales_person, rfq_status
		)	
		
CREATE FUNCTION dbo.get_monthly_rfqs (@sales_person INT, @month_number INT) 
RETURNS TABLE 
AS 

RETURN 	(	SELECT sales_person,
					rfq_status,
					COUNT(rfq_status) as rfq_count
			FROM erp_system.dbo.rfqs
			WHERE rfqs.sales_person = @sales_person
					AND MONTH(rfqs.issue_date = @month_number
			GROUP BY sales_person, rfq_status
		)	
		
--GET EMPLOYEE FIRST IN LAST OUT
CREATE VIEW first_in_last_out AS
WITH enhance_date_time AS ( SELECT emp_code,
									cast(punch_time as date) as modified_date,
									cast(punch_time as time) as modified_time
							FROM zkbiotime.dbo.iclock_transaction )
SELECT emp_code,
		name,
		modified_date,
		min(modified_time) as first_check_in,
		max(modified_time) as last_check_out
from enhance_date_time
inner join erp_system.dbo.employees_info
on enhance_date_time.emp_code = employees_info.employee_id
group by emp_code, name, modified_date;


--GET EMPLOYEE VACATION LIMIT
CREATE VIEW regular_vacation_limit AS
SELECT
		employees_info.employee_id,
		CASE WHEN DATEPART(YEAR,GETDATE()) - DATEPART(YEAR,employees_info.join_date) < 7 THEN 10
		WHEN DATEPART(YEAR,GETDATE()) - DATEPART(YEAR,employees_info.join_date) < 10 THEN 16
		WHEN DATEPART(YEAR,GETDATE()) - DATEPART(YEAR,employees_info.join_date) < 15 THEN 25
		ELSE 40 END AS vacation_limit,
		employees_info.name

FROM erp_system.dbo.employees_info

CREATE VIEW emergency_vacation_limit AS
SELECT
		employees_info.employee_id,
		CASE WHEN DATEPART(YEAR,GETDATE()) - DATEPART(YEAR,employees_info.join_date) < 7 THEN 5
		WHEN DATEPART(YEAR,GETDATE()) - DATEPART(YEAR,employees_info.join_date) < 10 THEN 5
		WHEN DATEPART(YEAR,GETDATE()) - DATEPART(YEAR,employees_info.join_date) < 15 THEN 5
		ELSE 5 END AS vacation_limit,
		employees_info.name

FROM erp_system.dbo.employees_info