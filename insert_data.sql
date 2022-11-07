--BASE INFO
BULK
INSERT erp_system.dbo.time_units
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\time_units.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.generic_work_fields
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\generic_work_fields.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.specific_work_fields
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\specific_work_fields.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.educational_degrees
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\educational_degrees.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.educational_majors
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\educational_majors.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.offers_status
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\offers_status.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.orders_status
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\orders_status.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.rfqs_status
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\rfqs_status.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.collection_status
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\collection_status.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.contracts_type
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\contracts_type.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.currencies_type
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\currencies_type.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.delivery_points
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\delivery_points.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.rfq_failure_reasons
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\rfq_failure_reasons.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.offer_failure_reasons
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\offer_failure_reasons.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.departments_type
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\departments_type.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.teams_type
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\teams_type.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.positions_type
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\positions_type.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.visits_purpose
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\visits_purpose.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.visits_result
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\visits_result.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.calls_purpose
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\calls_purpose.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.calls_result
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\calls_result.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.meetings_purpose
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\meetings_purpose.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.bank_names
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\bank_names.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.bank_branches
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\bank_branches.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.attendance_types
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\attendance_types.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.mission_types
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\base_info\mission_types.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

--MY COMPANY PRODUCTS											
BULK
INSERT erp_system.dbo.products_type
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_products\products_type.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.brands_type
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_products\brands_type.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.products_brands
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_products\products_brands.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.brands_models
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_products\brands_models.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.model_applications
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_products\model_applications.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.model_benefits
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_products\model_benefits.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.model_standard_features
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_products\model_standard_features.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.models_summary_points
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_products\models_summary_points.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

--WORLD MAP
BULK
INSERT erp_system.dbo.countries
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\world_map\countries.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.states_governorates
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\world_map\states_governorates.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.cities
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\world_map\cities.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.districts
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\world_map\districts.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.country_codes
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\world_map\country_codes.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO


--HUMAN RESOURCES
BULK
INSERT erp_system.dbo.vacation_leave_types
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\vacation_leave_types.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.vacation_leave_limits
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\vacation_leave_limits.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.vacation_leave_notice_period
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\vacation_leave_notice_period.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.approval_levels
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\approval_levels.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employement_documents_type
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\employement_documents_type.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.vacation_leave_request_status
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\vacation_leave_request_status.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_submitted_documents
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\employees_submitted_documents.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_payroll_info
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\employees_payroll_info.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_basic_salaries
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\employees_basic_salaries.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_monthly_salaries
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\employees_monthly_salaries.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

--LEAVES AND PETITIONS
BULK
INSERT erp_system.dbo.petitions_requests
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\petitions_requests.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.public_holidays
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\public_holidays.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.vacation_leave_requests
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\vacation_leave_requests.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.vacation_leave_approvals_rejections
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\vacation_leave_approvals_rejections.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.penalties_requests
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\penalties_requests.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.penalties_approvals_rejections
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\penalties_approvals_rejections.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.rewards_requests
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\rewards_requests.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.rewards_approvals_rejections
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\rewards_approvals_rejections.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.allowances_requests
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\allowances_requests.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.allowances_approvals_rejections
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\allowances_approvals_rejections.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.deductions_requests
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\deductions_requests.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.deductions_approvals_rejections
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\human_resources\deductions_approvals_rejections.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

--MY COMPANY EMPLOYEES
BULK
INSERT erp_system.dbo.employees_info
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_info.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_contracts
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_contracts.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_educational_qualifications
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_educational_qualifications.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_termination_info
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_termination_info.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_rejoining_info
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_rejoining_info.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_business_emails
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_business_emails.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_initials
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_initials.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_business_phones
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_business_phones.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_personal_phones
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_personal_phones.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_national_id
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_national_id.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_nationality
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_nationality.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.employees_residency
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_employees\employees_residency.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

--CLIENT COMPANY INFO
BULK
INSERT erp_system.dbo.company_name
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\client_company_info\company_name.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.company_address
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\client_company_info\company_address.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.company_field_of_work
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\client_company_info\company_field_of_work.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.company_fax
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\client_company_info\company_fax.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.company_telephone
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\client_company_info\company_telephone.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

--CONTACT PERSONS
BULK
INSERT erp_system.dbo.contact_person_info
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\contact_persons\contact_person_info.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.contact_person_mobile
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\contact_persons\contact_person_mobile.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.contact_person_personal_emails
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\contact_persons\contact_person_personal_emails.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.contact_person_comment
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\contact_persons\contact_person_comment.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

-- DOMAINS NAMES	
BULK
INSERT erp_system.dbo.country_tlds
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\domain_names\country_tlds.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.original_tlds
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\domain_names\original_tlds.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

--MY COMPANY WORK
BULK
INSERT erp_system.dbo.rfqs
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_work\rfqs.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.unsuccessful_rfqs
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_work\unsuccessful_rfqs.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.updated_rfqs_assignees
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_work\updated_rfqs_assignees.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.work_offers
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_work\work_offers.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.work_offers_products_info
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_work\work_offers_products_info.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.work_offers_rfqs
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_work\work_offers_rfqs.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.unsucessful_work_offers
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_work\unsucessful_work_offers.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.work_orders
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_work\work_orders.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.client_visits
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_work\client_visits.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.client_calls
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_work\client_calls.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.office_meetings
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\my_company_work\office_meetings.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

--PROCUREMENT
BULK
INSERT erp_system.dbo.supplier_name
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\procurement\supplier_name.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.supplier_branches
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\procurement\supplier_branches.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.supplier_telephone
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\procurement\supplier_telephone.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.supplier_contact_person_info
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\procurement\supplier_contact_person_info.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

BULK
INSERT erp_system.dbo.supplier_contact_person_mobile
FROM 'F:\Work\01 Electronics\Software Development\database_tables\csv_files\procurement\supplier_contact_person_mobile.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO