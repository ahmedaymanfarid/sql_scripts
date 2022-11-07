--RETURN ALL COMPANIES INFO FOR SPECIFIC PRODUCT, ADDRESS AND WORK FIELD
with get_work_field as (	select	company_field_of_work.company_serial,
							generic_work_fields.generic_work_field,
							specific_work_fields.specific_work_field
							from dbo.work_fields 
							inner join dbo.generic_work_fields 
							on work_fields.generic_work_field = generic_work_fields.id 
							inner join dbo.specific_work_fields 
							on work_fields.specific_work_field = specific_work_fields.id 
							inner join dbo.company_field_of_work
							on work_fields.id = company_field_of_work.work_field
						),
get_company_info	as	(	select company_address.company_serial,
							company_address.address_serial,
							company_name.company_name,
							company_name.domain_name,
							company_address.country, 
							company_address.state_governorate, 
							company_address.city, 
							company_address.district
							from dbo.company_address
							inner join dbo.company_name
							on company_address.company_serial = company_name.company_serial
						),
get_work_info		as	(	select	work_offers.branch_serial,
							work_offers.sales_person,
							products_type.id as product_id,
							products_type.product_name
							from dbo.work_offers
							inner join dbo.products_type
							on work_offers.product_type = products_type.id		
						)
select distinct get_company_info.company_serial,
		get_company_info.company_name
from get_company_info
inner join get_work_field
on get_company_info.company_serial = get_work_field.company_serial
left join get_work_info
on get_company_info.address_serial = get_work_info.branch_serial
--where get_work_field.generic_work_field = 'Industry'
--where get_work_info.sales_person = 12
--and get_company_info.state_governorate = 'Cairo'
--and get_work_info.product_name = 'Batteries'
order by get_company_info.company_name;

--RETURN ALL CONTACTS FOR GIVEN COMPANIES
select company_address.company_serial, 
contact_person_info.contact_id, 
company_address.address_serial, 
contact_person_info.name, 
contact_person_info.email, 
company_address.country, 
company_address.state_governorate, 
company_address.city, 
company_address.district 
from dbo.contact_person_info 
inner join dbo.company_address 
on contact_person_info.branch_serial = company_address.address_serial 
inner join dbo.departments_type 
on contact_person_info.department = departments_type.id 
where contact_person_info.sales_person_id = 12
and (	company_address.company_serial = 3 
		or company_address.company_serial = 7 
		or company_address.company_serial = 16
		or company_address.company_serial = 21
		or company_address.company_serial = 19
		or company_address.company_serial = 11
		or company_address.company_serial = 13
		or company_address.company_serial = 15)
and company_address.country = 'Egypt'
and company_address.district = 'Nasr City'
and departments_type.department = 'Engineering Department'
order by contact_person_info.name
