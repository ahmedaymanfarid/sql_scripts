select service_reports.report_serial,
		service_reports.report_date,
		service_reports.report_id,
		service_reports.wo_serial,
		service_reports.wo_prod_id,
		service_reports.wo_prod_serial,
		work_orders_products_serials.serial,
		products_category.id as category_id,
		products_category.category_name,
		products_type.id as product_id,
		products_type.product_name,
		brands_type.id as brand_id,
		brands_type.brand_name,
		brands_models.model_id,
		brands_models.brand_model,
		model_specs.spec_id,
		model_specs.spec_name,
		service_reports.report_number
from erp_system.dbo.service_reports
left join erp_system.dbo.work_orders_products_serials
on service_reports.wo_serial = work_orders_products_serials.order_serial
and service_reports.wo_prod_id = work_orders_products_serials.product_number
and service_reports.wo_prod_serial = work_orders_products_serials.serial_id
left join erp_system.dbo.maintenance_contracts_products_serials
on service_reports.mc_serial = maintenance_contracts_products_serials.contract_serial
and service_reports.mc_version = maintenance_contracts_products_serials.contract_version
and service_reports.mc_prod_id = maintenance_contracts_products_serials.product_number
and service_reports.mc_prod_serial = maintenance_contracts_products_serials.serial_id
left join erp_system.dbo.work_orders_products_info
on work_orders_products_serials.order_serial = work_orders_products_info.order_serial
and work_orders_products_serials.product_number = work_orders_products_info.product_number
left join erp_system.dbo.model_specs
on work_orders_products_info.product_category = model_specs.category_id
and work_orders_products_info.product_type = model_specs.product_id
and work_orders_products_info.product_brand = model_specs.brand_id
and work_orders_products_info.product_model = model_specs.model_id
and work_orders_products_info.product_spec = model_specs.spec_id
left join erp_system.dbo.products_category
on model_specs.category_id = products_category.id
left join erp_system.dbo.products_type
on model_specs.product_id = products_type.id
left join erp_system.dbo.products_brands
on model_specs.product_id = products_brands.product_id
and model_specs.brand_id = products_brands.brand_id
left join erp_system.dbo.brands_type
on products_brands.brand_id = brands_type.id
left join erp_system.dbo.brands_models
on model_specs.product_id = brands_models.product_id
and model_specs.brand_id = brands_models.brand_id
and model_specs.model_id = brands_models.model_id

where wo_serial is not null