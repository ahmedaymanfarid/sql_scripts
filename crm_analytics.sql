--PRODUCT ANALYTICS
CREATE FUNCTION dbo.get_quoted_product_count(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
select outgoing_quotations.sales_person,
		outgoing_quotations_items.product_category,
		outgoing_quotations_items.product_type,
		outgoing_quotations_items.product_model,
		count(outgoing_quotations_items.product_model) as quoted_count,
		employees_initials.employee_initial
from erp_system.dbo.outgoing_quotations
inner join erp_system.dbo.outgoing_quotations_items
on outgoing_quotations.offer_proposer = outgoing_quotations_items.offer_proposer
and outgoing_quotations.offer_serial = outgoing_quotations_items.offer_serial
and outgoing_quotations.offer_version = outgoing_quotations_items.offer_version
inner join erp_system.dbo.employees_initials
on outgoing_quotations.sales_person = employees_initials.id
where outgoing_quotations.issue_date >= @start_date
and outgoing_quotations.issue_date <= @end_date
group by sales_person, employees_initials.employee_initial, product_category, product_type, product_model


CREATE FUNCTION dbo.get_quoted_product_amount(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
select outgoing_quotations.sales_person,
		outgoing_quotations_items.product_category,
		outgoing_quotations_items.product_type,
		outgoing_quotations_items.product_model,
		sum(outgoing_quotations.price_value) as quoted_amount,
		employees_initials.employee_initial
from erp_system.dbo.outgoing_quotations
inner join erp_system.dbo.outgoing_quotations_items
on outgoing_quotations.offer_proposer = outgoing_quotations_items.offer_proposer
and outgoing_quotations.offer_serial = outgoing_quotations_items.offer_serial
and outgoing_quotations.offer_version = outgoing_quotations_items.offer_version
inner join erp_system.dbo.employees_initials
on outgoing_quotations.sales_person = employees_initials.id
where outgoing_quotations.issue_date >= @start_date
and outgoing_quotations.issue_date <= @end_date
group by sales_person, employees_initials.employee_initial, product_category, product_type, product_model



CREATE FUNCTION dbo.get_ordered_product_count(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
select work_orders.sales_person,
		work_orders_products_info.product_category,
		work_orders_products_info.product_type,
		work_orders_products_info.product_model,
		count(work_orders_products_info.product_model) as model_count,
		employees_initials.employee_initial
from erp_system.dbo.work_orders_products_info
inner join erp_system.dbo.work_orders
on work_orders.order_serial = work_orders_products_info.order_serial
inner join erp_system.dbo.employees_initials
on work_orders.sales_person = employees_initials.id
where work_orders.issue_date >= @start_date
and work_orders.issue_date <= @end_date
group by sales_person, employees_initials.employee_initial, product_category, product_type, product_model


CREATE FUNCTION dbo.get_ordered_product_amount(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN

select sales_person,
		work_orders_products_info.product_category,
		work_orders_products_info.product_type,
		work_orders_products_info.product_model,
		sum(work_orders.price_value) as ordered_amount,
		employees_initials.employee_initial
from erp_system.dbo.work_orders
inner join erp_system.dbo.work_orders_products_info
on work_orders.order_serial = work_orders_products_info.order_serial
inner join erp_system.dbo.employees_initials
on work_orders.sales_person = employees_initials.id
where work_orders.issue_date >= @start_date
and work_orders.issue_date <= @end_date
group by sales_person, employees_initials.employee_initial, product_category, product_type, product_model



CREATE FUNCTION dbo.get_rfqs_product_count(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN

select rfqs.sales_person,
		rfqs_products_info.product_category,
		rfqs_products_info.product_type,
		rfqs_products_info.product_model,
		count(product_model) as model_count,
		employees_initials.employee_initial
from erp_system.dbo.rfqs_products_info
inner join erp_system.dbo.rfqs
on rfqs.sales_person = rfqs_products_info.sales_person
and rfqs.rfq_serial = rfqs_products_info.rfq_serial
and rfqs.rfq_version = rfqs_products_info.rfq_version
inner join erp_system.dbo.employees_initials
on rfqs.sales_person = employees_initials.id
where rfqs.issue_date >= @start_date
and rfqs.issue_date <= @end_date
group by rfqs.sales_person, employees_initials.employee_initial, product_category, product_type, product_model



--SALES QOUTATIONS
CREATE FUNCTION dbo.get_sales_quoted_amount(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
select outgoing_quotations.sales_person,
		outgoing_quotations.offer_status,
		sum(outgoing_quotations.price_value) as quoted_amount,
		employees_initials.employee_initial
from erp_system.dbo.outgoing_quotations
inner join erp_system.dbo.employees_initials
on outgoing_quotations.sales_person = employees_initials.id
where outgoing_quotations.issue_date >= @start_date
and outgoing_quotations.issue_date <= @end_date
group by sales_person, employees_initials.employee_initial, offer_status


CREATE FUNCTION dbo.get_sales_quoted_count(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
select outgoing_quotations.sales_person,
		outgoing_quotations.offer_status,
		count(outgoing_quotations.sales_person) as offer_count,
		employees_initials.employee_initial
from erp_system.dbo.outgoing_quotations
inner join erp_system.dbo.employees_initials
on outgoing_quotations.sales_person = employees_initials.id
where outgoing_quotations.issue_date >= @start_date
and outgoing_quotations.issue_date <= @end_date
group by sales_person, employees_initials.employee_initial, offer_status


--SALES ORDERS
CREATE FUNCTION dbo.get_sales_ordered_amount(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
select work_orders.sales_person,
		orders_status.order_status,
		sum(work_orders.price_value) as ordered_amount,
		currencies_type.currency,
		employees_initials.employee_initial
from erp_system.dbo.work_orders
inner join erp_system.dbo.employees_initials
on work_orders.sales_person = employees_initials.id
inner join erp_system.dbo.currencies_type
on work_orders.price_currency = currencies_type.id
inner join erp_system.dbo.orders_status
on work_orders.order_status = orders_status.id
where work_orders.issue_date >= @start_date
and work_orders.issue_date <= @end_date
group by sales_person, employees_initials.employee_initial, orders_status.order_status, currency

CREATE FUNCTION dbo.get_sales_order_count(@start_date DATETIME, @end_date DATETIME)
RETURNS TABLE AS
RETURN
select work_orders.sales_person,
		work_orders.order_status,
		count(work_orders.sales_person) as order_count,
		employees_initials.employee_initial
from erp_system.dbo.work_orders
inner join erp_system.dbo.employees_initials
on work_orders.sales_person = employees_initials.id
where work_orders.issue_date >= @start_date
and work_orders.issue_date <= @end_date
group by sales_person, employees_initials.employee_initial, order_status