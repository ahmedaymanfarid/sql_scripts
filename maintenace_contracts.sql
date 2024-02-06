select maintenance_contracts.contract_serial,
		maintenance_contracts.contract_version,
		maintenance_contracts_products_info.product_number,
		maintenance_contracts_products_serials.serial_id,
		maintenance_contracts_products_serials.serial,
		products_category.id as category_id,
		products_category.category_name,
		products_type.id as product_id,
		products_type.product_name,
		brands_type.id as brand_id,
		brands_type.brand_name,
		brands_models.model_id,
		brands_models.brand_model,
		model_specs.spec_id,
		model_specs.spec_name
from erp_system.dbo.maintenance_contracts
left join erp_system.dbo.maintenance_contracts_products_info
on maintenance_contracts.contract_serial = maintenance_contracts_products_info.contract_serial
and maintenance_contracts.contract_version = maintenance_contracts_products_info.contract_version
left join erp_system.dbo.maintenance_contracts_products_serials
on maintenance_contracts_products_serials.contract_serial = maintenance_contracts_products_info.contract_serial
and maintenance_contracts_products_serials.contract_version = maintenance_contracts_products_info.contract_version
and maintenance_contracts_products_serials.product_number = maintenance_contracts_products_info.product_number
left join erp_system.dbo.model_specs
on maintenance_contracts_products_info.product_category = model_specs.category_id
and maintenance_contracts_products_info.product_type = model_specs.product_id
and maintenance_contracts_products_info.product_brand = model_specs.brand_id
and maintenance_contracts_products_info.product_model = model_specs.model_id
and maintenance_contracts_products_info.product_spec = model_specs.spec_id
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
order by contract_serial, contract_version, product_number