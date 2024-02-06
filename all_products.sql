select products_category.id,
		products_category.category_name,
		products_type.id,
		products_type.product_name,
		brands_type.id,
		brands_type.brand_name,
		model_specs.spec_id,
		model_specs.spec_name
from erp_system.dbo.model_specs
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