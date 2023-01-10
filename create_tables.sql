--BASE INFO
CREATE TABLE erp_system.dbo.time_units						(	id INT PRIMARY KEY,
														time_unit VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);			
													
CREATE TABLE erp_system.dbo.client_generic_work_fields		( 	id INT PRIMARY KEY,
																generic_work_field VARCHAR(50),
																date_added DATETIME DEFAULT getdate()
															);

CREATE TABLE erp_system.dbo.client_specific_work_fields		( 	generic_field_name INT REFERENCES client_generic_work_fields(id),
																id INT PRIMARY KEY,
																specific_work_field VARCHAR (50),
																date_added DATETIME DEFAULT getdate()
															);



CREATE TABLE erp_system.dbo.supplier_fields		( 	id INT PRIMARY KEY,
													field_name VARCHAR (50),
													date_added DATETIME DEFAULT getdate()
												);

CREATE TABLE erp_system.dbo.work_forms		( 	id INT PRIMARY KEY,
												work_form VARCHAR (50),
												date_added DATETIME DEFAULT getdate()
											);																
													
CREATE TABLE erp_system.dbo.educational_degrees		(	id INT PRIMARY KEY,
														educational_degree VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.educational_majors		(	id INT PRIMARY KEY,
														educational_major VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);	
													
CREATE TABLE erp_system.dbo.contract_status         (   id INT PRIMARY KEY,
														contract_status VARCHAR(50),
														date_added DATETIME DEFAULT GETDATE()
													);
														
CREATE TABLE erp_system.dbo.orders_status					(	id INT PRIMARY KEY,
														order_status VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);			

CREATE TABLE erp_system.dbo.offers_status					(	id INT PRIMARY KEY,
														offer_status VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);			

CREATE TABLE erp_system.dbo.rfqs_status					(	id INT PRIMARY KEY,
														rfq_status VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);			
													
CREATE TABLE erp_system.dbo.rfps_status					(	id INT PRIMARY KEY,
														rfp_status VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);							

CREATE TABLE erp_system.dbo.settlements_status	(	id INT PRIMARY KEY,
														settlement_status VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);

CREATE TABLE erp_system.dbo.pos_status				(	id INT PRIMARY KEY,
														po_status VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);	
													
CREATE TABLE erp_system.dbo.rfps_requestors		(	team_id INT REFERENCES teams_type(id),
													authorized_personnel INT REFERENCES employees_info(employee_id),
													requestor_team VARCHAR(50),
													is_valid BIT,
													date_added DATETIME DEFAULT getdate(),
													PRIMARY KEY (team_id, authorized_personnel)
												);																
																
CREATE TABLE erp_system.dbo.measure_units			(	id INT PRIMARY KEY,
														measure_unit VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);													
													
CREATE TABLE erp_system.dbo.collection_status				(	id INT PRIMARY KEY,
														collection_status VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);			
													
CREATE TABLE erp_system.dbo.contracts_type					(	id INT PRIMARY KEY,
														contract_type VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);			
								
CREATE TABLE erp_system.dbo.currencies_type				(	id INT PRIMARY KEY,
														currency VARCHAR(10),
														date_added DATETIME DEFAULT getdate()
													);			
													
CREATE TABLE erp_system.dbo.delivery_points				(	id INT PRIMARY KEY,
														delivery_point VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.rfq_failure_reasons			(	id INT PRIMARY KEY,
														failure_reason VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);	

CREATE TABLE erp_system.dbo.offer_failure_reasons			(	id INT PRIMARY KEY,
														failure_reason VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);	
																				
CREATE TABLE erp_system.dbo.departments_type				(	id INT PRIMARY KEY,
														department VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);			

CREATE TABLE erp_system.dbo.teams_type						(	id INT PRIMARY KEY,
														team VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);			

CREATE TABLE erp_system.dbo.positions_type					(	id INT PRIMARY KEY,
														position VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);

CREATE TABLE erp_system.dbo.contact_person_titles	(	id INT PRIMARY KEY,
														english_title VARCHAR(50),
														arabic_title NVARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);		
													
CREATE TABLE erp_system.dbo.visits_purpose			(	id INT PRIMARY KEY,
														visit_purpose VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.visits_result			(	id INT PRIMARY KEY,
														visit_result VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.calls_purpose			(	id INT PRIMARY KEY,
														call_purpose VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.calls_result				(	id INT PRIMARY KEY,
														call_result VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.meetings_purpose		(	id INT PRIMARY KEY,
														meeting_purpose VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);			
													
													
CREATE TABLE erp_system.dbo.bank_names				(	bic_code VARCHAR(50) PRIMARY KEY,
														arabic_bank_name NVARCHAR(100),
														english_bank_name NVARCHAR(100),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.bank_branches			(	bic_code VARCHAR(50) REFERENCES bank_names(bic_code),
														branch_code INT,
														arabic_branch_name NVARCHAR(100),
														english_branch_name NVARCHAR(100),		
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY(bic_code,branch_code)
													);
													
CREATE TABLE erp_system.dbo.attendance_types		(	id INT PRIMARY KEY,
														attendance_type VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.missions_types		(	id INT PRIMARY KEY,
													mission_type VARCHAR(50),
													date_added DATETIME DEFAULT getdate()
												);

CREATE TABLE erp_system.dbo.missions_allowed_types		(	team_id INT REFERENCES teams_type(id),
															mission_type INT REFERENCES missions_types(id),
															date_added DATETIME DEFAULT getdate(),
															PRIMARY KEY (team_id, mission_type)
														);												
													
CREATE TABLE erp_system.dbo.calendar 				( calendar_date DATE PRIMARY KEY);													


CREATE TABLE erp_system.dbo.condition_start_dates	(	id INT PRIMARY KEY,
														condition VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.shipment_types	(	id INT PRIMARY KEY,
												shipment_type VARCHAR(50),
												date_added DATETIME DEFAULT getdate()
											);
											
													

--MY COMPANY PRODUCTS											
CREATE TABLE erp_system.dbo.products_category		(	id INT PRIMARY KEY,
														category_name VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.products_type			(	id INT PRIMARY KEY,
														product_name VARCHAR(50),
														product_category INT REFERENCES products_category(id),
														date_added DATETIME DEFAULT getdate()
													);

CREATE TABLE erp_system.dbo.brands_type				(	id INT PRIMARY KEY,
														brand_name VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.products_brands			(	product_id INT REFERENCES products_type(id),
														brand_id INT REFERENCES brands_type(id),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (product_id,brand_id)
													);

CREATE TABLE erp_system.dbo.brands_models			(	product_id INT,
														brand_id INT,
														model_id INT,
														brand_model VARCHAR(50),
														date_added DATETIME DEFAULT getdate(),
														has_serial_number BIT,
														FOREIGN KEY (product_id,brand_id) REFERENCES products_brands(product_id,brand_id),
														PRIMARY KEY (product_id,brand_id,model_id)
													);

CREATE TABLE erp_system.dbo.model_applications		(	product_id INT,
														brand_id INT,
														model_id INT,
														application_id INT,
														application VARCHAR(300),
														date_added DATETIME DEFAULT getdate(),
														FOREIGN KEY (product_id,brand_id) REFERENCES products_brands(product_id,brand_id),
														PRIMARY KEY (product_id,brand_id,model_id,application_id)
													);

CREATE TABLE erp_system.dbo.model_benefits			(	product_id INT,
														brand_id INT,
														model_id INT,
														benefit_id INT,
														benefit VARCHAR(300),
														date_added DATETIME DEFAULT getdate(),
														FOREIGN KEY (product_id,brand_id) REFERENCES products_brands(product_id,brand_id),
														PRIMARY KEY (product_id,brand_id,model_id,benefit_id)
													);

CREATE TABLE erp_system.dbo.model_standard_features		(	product_id INT,
														brand_id INT,
														model_id INT,
														feature_id INT,
														feature VARCHAR(300),
														date_added DATETIME DEFAULT getdate(),
														FOREIGN KEY (product_id,brand_id) REFERENCES products_brands(product_id,brand_id),
														PRIMARY KEY (product_id,brand_id,model_id,feature_id)
													);
													
CREATE TABLE erp_system.dbo.models_summary_points	(	product_id INT,
														brand_id INT,
														model_id INT,
														points_id INT,
														points VARCHAR(300),
														date_added DATETIME DEFAULT getdate(),
														FOREIGN KEY (product_id,brand_id, model_id) REFERENCES erp_system.dbo.brands_models(product_id,brand_id,model_id),
														PRIMARY KEY (product_id,brand_id,model_id,points_id)
													);		

CREATE TABLE erp_system.dbo.model_specs	(	date_added datetime default getdate(),
											
											added_by INT REFERENCES employees_info(employee_id),
											category_id INT REFERENCES products_category(id),
											product_id INT,
											brand_id INT,
											model_id INT,
											spec_id INT,
											
											spec_name varchar(150),
											
											genset_rated_power decimal(18, 0),
											genset_rating_unit INT REFERENCES erp_system.dbo.measure_units (id),
											genset_ltb_50 decimal(18, 0),
											genset_ltb_50_unit INT REFERENCES erp_system.dbo.measure_units (id),
											genset_ltb_60 decimal(18, 0),
											genset_ltb_60_unit INT REFERENCES erp_system.dbo.measure_units (id),
											genset_prp_50 decimal(18, 0),
											genset_prp_50_unit INT REFERENCES erp_system.dbo.measure_units (id),
											genset_prp_60 decimal(18, 0),
											genset_prp_60_unit INT REFERENCES erp_system.dbo.measure_units (id),
											genset_cooling VARCHAR(250),
											genset_tank VARCHAR(250),
											genset_load VARCHAR(250),
											genset_alternator VARCHAR(250),
											
											ups_io_phase VARCHAR(50),
											ups_rated_power decimal(18, 0),
											ups_rating INT REFERENCES erp_system.dbo.measure_units (id),
											ups_backup_time_50 INT,
											ups_backup_time_70 INT,
											ups_backup_time_100 INT,
											ups_input_power_factor VARCHAR(250),
											ups_thdi VARCHAR(250),
											ups_input_nominal_voltage VARCHAR(250),
											ups_input_voltage VARCHAR(250),
											ups_voltage_tolerance VARCHAR(250),
											ups_output_power_factor VARCHAR(250),
											ups_thdv VARCHAR(250),
											ups_output_nominal_voltage VARCHAR(250),
											ups_output_dc_voltage_range VARCHAR(250),
											ups_overload_capability VARCHAR(250),
											ups_efficiency VARCHAR(50),
											ups_input_connection_type VARCHAR(250),
											ups_front_panel VARCHAR(250),
											ups_max_power VARCHAR(250),
											ups_certificates VARCHAR(250),
											ups_safety VARCHAR(250),
											ups_emc VARCHAR(405),
											ups_environmental_aspects VARCHAR(250),
											ups_test_performance VARCHAR(250),
											ups_protection_degree VARCHAR(250),
											ups_transfer_voltage_limit VARCHAR(250),
											ups_marking VARCHAR(50),
											
											is_valid bit,
											valid_until datetime,
											
											FOREIGN KEY(product_id, brand_id, model_id) REFERENCES erp_system.dbo.brands_models (product_id, brand_id, model_id),
											PRIMARY KEY(category_id, product_id, brand_id, model_id, spec_id)
										);

--WORLD MAP
CREATE TABLE erp_system.dbo.countries				(	id INT PRIMARY KEY,
														country VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);

CREATE TABLE erp_system.dbo.states_governorates		(	country INT REFERENCES countries(id),
														id INT PRIMARY KEY,
														state_governorate VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
											
CREATE TABLE erp_system.dbo.cities					(	state_governorate INT REFERENCES states_governorates(id),
														id INT PRIMARY KEY,
														city VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);

CREATE TABLE erp_system.dbo.districts				(	city INT REFERENCES cities(id),
														id INT PRIMARY KEY,
														district VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
									
CREATE TABLE erp_system.dbo.country_codes			(	id INT PRIMARY KEY,
														phone_code VARCHAR(10),
														iso3 VARCHAR(10),
														unsd VARCHAR(10),
														date_added DATETIME DEFAULT getdate()
													);									
-- DOMAINS NAMES											
CREATE TABLE erp_system.dbo.country_tlds			(	tld VARCHAR(5) PRIMARY KEY,
														country INT REFERENCES countries(id),
														date_added DATETIME DEFAULT getdate()
													);

CREATE TABLE erp_system.dbo.original_tlds			(	tld VARCHAR(5) PRIMARY KEY,
														date_added DATETIME DEFAULT getdate()
													);
																	
--MY COMPANY EMPLOYEES
CREATE TABLE erp_system.dbo.employees_info			(	employee_id INT PRIMARY KEY,
														name VARCHAR(50),
														gender VARCHAR(10),
														employee_department INT REFERENCES departments_type(id),
														employee_team INT REFERENCES teams_type(id),
														employee_position INT REFERENCES positions_type(id),
														birth_date DATE,
														join_date DATE,
														is_rejoined BIT,
														date_added DATETIME DEFAULT getdate(),
														arabic_name VARCHAR(50),
														enrollement_status INT REFERENCES enrollement_status(id),
													);

CREATE TABLE erp_system.dbo.employees_contracts		(	employee_id INT REFERENCES employees_info(employee_id),
														contract_serial INT,
														contract_type INT REFERENCES employement_contracts_type(id),
														start_date DATE,
														end_date DATE,
														contract_duration INT,
														contract_duration_unit INT REFERENCES time_units(id),
														notice_period INT,
														notice_period_unit INT REFERENCES time_units(id),
														probation_period INT,
														probation_period_unit INT REFERENCES time_units(id),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (employee_id, contract_serial)
													);
													 
CREATE TABLE erp_system.dbo.employees_educational_qualifications	(	employee_id INT REFERENCES employees_info(employee_id),
																		certificate INT REFERENCES educational_degrees(id),
																		major INT REFERENCES educational_majors(id),
																		graduation_year INT,
																		date_added DATETIME DEFAULT getdate(),
																		PRIMARY KEY (employee_id)
																	);
													
CREATE TABLE erp_system.dbo.employees_termination_info	(	id INT REFERENCES employees_info(employee_id),
															on_notice_date DATE,
															resignation_date DATE,
															date_added DATETIME DEFAULT getdate(),
															PRIMARY KEY (id, on_notice_date, resignation_date)
														);
														
CREATE TABLE erp_system.dbo.employees_rejoining_info	(	id INT REFERENCES employees_info(employee_id),
															rejoin_date DATE,
															date_added DATETIME DEFAULT getdate(),
															PRIMARY KEY (id, rejoin_date)
														);														
													
CREATE TABLE erp_system.dbo.employees_business_emails	(	id INT REFERENCES employees_info(employee_id),
															email VARCHAR(50),
															date_added DATETIME DEFAULT getdate(),
															PRIMARY KEY (id)
														);													
			
CREATE TABLE erp_system.dbo.employees_personal_emails	(	id INT REFERENCES employees_info(employee_id),
															email VARCHAR(50),
															date_added DATETIME DEFAULT getdate(),
															PRIMARY KEY (id)
														);	

CREATE TABLE erp_system.dbo.employees_passwords		(	id INT REFERENCES employees_info(employee_id),
														password VARCHAR(200),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (id)
													);			
												
													
CREATE TABLE erp_system.dbo.employees_initials		(	id INT REFERENCES employees_info(employee_id),
														employee_initial VARCHAR(10),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (id)
													);					
												
CREATE TABLE erp_system.dbo.employees_business_phones		(	id INT REFERENCES employees_info(employee_id),												
														phone VARCHAR(50),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (id)
													);
													
CREATE TABLE erp_system.dbo.employees_personal_phones		(	id INT REFERENCES employees_info(employee_id),												
														phone VARCHAR(50),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (id)
													);			

CREATE TABLE erp_system.dbo.employees_national_id	(	id INT REFERENCES employees_info(employee_id),												
														national_id VARCHAR(50),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (id)
													);																										
																
CREATE TABLE erp_system.dbo.employees_nationality	(	id INT REFERENCES employees_info(employee_id),	
														nationality INT REFERENCES countries(id), 
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (id)
													);
	
CREATE TABLE erp_system.dbo.employees_residency		(	id INT REFERENCES employees_info(employee_id),	
														residency_address INT REFERENCES districts(id), 
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (id)
													);	
--HUMAN RESOURCES
CREATE TABLE erp_system.dbo.attendance_excuses	(	id INT PRIMARY KEY,
														attendance_excuse VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);


CREATE TABLE erp_system.dbo.attendance_excuses_limits		(	first_id INT REFERENCES attendance_excuses(id),
															second_id INT REFERENCES attendance_excuses(id),
															monthly_limit INT,
															yearly_limit INT,
															date_added DATETIME DEFAULT getdate(),
															PRIMARY KEY (first_id,second_id)
														);									
														
CREATE TABLE erp_system.dbo.attendance_excuses_notice_period	(	excuse_id INT REFERENCES attendance_excuses(id),
																amount INT,
																time_unit INT REFERENCES time_units(id),
																before_after BIT,
																date_added DATETIME DEFAULT getdate(),
																PRIMARY KEY (excuse_id)
															);	
															
CREATE TABLE erp_system.dbo.employement_documents_type	(	id INT PRIMARY KEY,
															document_type VARCHAR(50),
															date_added DATETIME DEFAULT getdate()
														);
														
CREATE TABLE erp_system.dbo.employement_contracts_type	(	id INT PRIMARY KEY,
															contract_type VARCHAR(50),
															date_added DATETIME DEFAULT getdate()
														);			
CREATE TABLE erp_system.dbo.enrollement_status	(	id INT PRIMARY KEY,
													enrollement_status VARCHAR(50),
													date_added DATETIME DEFAULT getdate()
													);																												
														
CREATE TABLE erp_system.dbo.approvals_status	(	id INT PRIMARY KEY,
													approval_status VARCHAR(50),
													date_added DATETIME DEFAULT getdate()
												);							

CREATE TABLE erp_system.dbo.allowance_types	(	id INT PRIMARY KEY,
												allowance_type VARCHAR(50),
												date_added DATETIME DEFAULT getdate()	
											);										

CREATE TABLE erp_system.dbo.deduction_types	(	id INT PRIMARY KEY,
												deduction_type VARCHAR(50),
												date_added DATETIME DEFAULT getdate()
											);		
											
CREATE TABLE erp_system.dbo.employees_submitted_documents		(	employee_id INT REFERENCES employees_info(employee_id),												
																	document_type INT REFERENCES employement_documents_type(id),
																	date_added DATETIME DEFAULT getdate(),
																	PRIMARY KEY (employee_id, document_type)
																);													

CREATE TABLE erp_system.dbo.employees_payroll_info	(	employee_id INT REFERENCES employees_info(employee_id),		
														bic_code VARCHAR(50),
														branch_code INT,
														bank_payroll_id INT,
														account_id BIGINT,
														iban_id VARCHAR(50),
														is_preferred BIT,
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (employee_id, bic_code, branch_code),
														FOREIGN KEY (bic_code, branch_code) REFERENCES bank_branches(bic_code,branch_code)
													);

CREATE TABLE erp_system.dbo.employees_basic_salaries			(	employee_id INT REFERENCES employees_info(employee_id),												
																	gross_salary VARBINARY(MAX),
																	insurance_and_taxes VARBINARY(MAX),
																	net_salary VARBINARY(MAX),
																	due_year INT,
																	due_month INT,												
																	date_added DATETIME DEFAULT getdate(),
																	PRIMARY KEY (employee_id, due_year, due_month)
																);
																
CREATE TABLE erp_system.dbo.employees_monthly_salaries	(	employee_id INT REFERENCES employees_info(employee_id),
															due_year INT,
															due_month INT,												
															payroll_type INT REFERENCES payroll_types(id),
															salary_due VARBINARY(MAX),
															date_added DATETIME DEFAULT getdate(),
															PRIMARY KEY (employee_id, due_year, due_month)
														);	
														
CREATE TABLE erp_system.dbo.employees_attendance		( 	employee_id INT REFERENCES employees_info(employee_id),
															calendar_date DATE REFERENCES calendar(calendar_date),
															first_in TIME,
															last_out TIME,
															attendance_type INT REFERENCES attendance_types(id),
															PRIMARY KEY (employee_id, calendar_date)
														);
														
CREATE TABLE erp_system.dbo.employees_excluded_attendance	( 	employee_id INT REFERENCES employees_info(employee_id),
																is_excluded BIT,
																date_added DATETIME DEFAULT getdate(),
																PRIMARY KEY (employee_id)
															);	

--SECURITY AND ACCESS
CREATE TABLE erp_system.dbo.software_modules	( 	module_id INT PRIMARY KEY,
													module_name VARCHAR(50)
												);	
												
CREATE TABLE erp_system.dbo.module_features	( 	module_id INT REFERENCES software_modules(module_id),
												feature_id INT,
												feature_name VARCHAR(50)
												PRIMARY KEY (module_id, feature_id)	
											);
												
CREATE TABLE erp_system.dbo.user_roles		( 	department INT REFERENCES departments_type(id),
												team INT REFERENCES teams_type(id),
												position INT REFERENCES positions_type(id),
												module_id INT,
												feature_id INT,
												allowed_department INT REFERENCES departments_type(id),
												allowed_team INT REFERENCES teams_type(id),
												d_read BIT,
												d_write BIT,
												d_edit BIT,
												d_delete BIT,
												d_admin BIT,
												FOREIGN KEY (module_id, feature_id) REFERENCES module_features(module_id, feature_id),
												PRIMARY KEY (department,team,position,module_id,feature_id,allowed_department,allowed_team)
											);	
--LEAVES AND PETITIONS					
CREATE TABLE erp_system.dbo.petitions_requests			(	request_serial INT PRIMARY KEY,
															petition_type INT REFERENCES attendance_excuses(id),
															benficiary_personnel INT REFERENCES employees_info(employee_id),
															requested_by INT REFERENCES employees_info(employee_id),
															requested_day DATE,
															comments VARCHAR(150),
															date_added DATETIME DEFAULT getdate()
														);	

CREATE TABLE erp_system.dbo.public_holidays				(	holiday_serial INT PRIMARY KEY,
															holiday_name VARCHAR(50),
															start_date DATETIME,
															end_date DATETIME,
															added_by INT REFERENCES employees_info(employee_id),
															date_added DATETIME DEFAULT getdate()
														);	

CREATE TABLE erp_system.dbo.missions					(	mission_serial INT PRIMARY KEY,
															mission_start_date DATETIME,
															mission_end_date DATETIME,
															employee_id INT REFERENCES employees_info(employee_id),
															mission_type INT REFERENCES missions_types(id),

															work_order INT REFERENCES work_orders(order_serial),
															maintenance_contract INT,
															rfp_requestor INT,
															rfp_serial INT,
															rfp_version INT,

															branch_serial INT REFERENCES company_address(address_serial),
															
															bank_bic_code VARCHAR(50),
															bank_branch_code INT,

															governmental_entity INT,
															government_contact INT,

															supplier_location_id INT,
															supplier_contact_id INT,

															project_serial INT, 
															project_owner BIT,
															project_consultant BIT,
															project_general_contractor BIT,
															project_site_id INT,

															added_by INT REFERENCES employees_info(employee_id),
															mission_status INT REFERENCES approvals_status(id),
															comments VARCHAR(150),
															date_added DATETIME DEFAULT getdate(),
															maintenance_contract_version INT,

															FOREIGN KEY (maintenance_contract,maintenance_contract_version) REFERENCES maintenance_contracts(contract_serial, contract_version),
															
															FOREIGN KEY (bank_bic_code,bank_branch_code) REFERENCES bank_branches(bic_code,branch_code),

															FOREIGN KEY (supplier_location_id,supplier_contact_id) REFERENCES supplier_contact_person_info(branch_serial, contact_id),

															FOREIGN KEY (project_serial, project_site_id) REFERENCES company_project_locations(project_serial, location_id),
															FOREIGN KEY (governmental_entity, government_contact) REFERENCES government_contacts(entity_serial, contact_id),
															FOREIGN KEY (rfp_requestor, rfp_serial, rfp_version) REFERENCES rfps(rfp_requestor_team, rfp_serial, rfp_version)
														);
														
CREATE TABLE erp_system.dbo.missions_approvals_rejections	(	mission_serial INT REFERENCES missions(mission_serial),
															approving_personnel INT REFERENCES employees_info(employee_id),
															comments VARCHAR(150),
															date_added DATETIME DEFAULT getdate()
														);
														
																 														
CREATE TABLE erp_system.dbo.vacation_leave_requests		(	request_serial INT PRIMARY KEY,
															benficiary_personnel INT REFERENCES employees_info(employee_id),
															requested_by INT REFERENCES employees_info(employee_id),
															request_type INT REFERENCES attendance_excuses(id),
															leave_start_date DATETIME,
															leave_end_date DATETIME,
															expiry_date DATETIME,
															request_status INT REFERENCES approvals_status(id), 
															comments VARCHAR(150),
															date_added DATETIME DEFAULT getdate()
														);	
														
CREATE TABLE erp_system.dbo.vacation_leave_approvals_rejections		(	request_serial INT REFERENCES vacation_leave_requests(request_serial),
																		approving_personnel INT REFERENCES employees_info(employee_id),
																		comments VARCHAR(150),
																		date_added DATETIME DEFAULT getdate(),
																	);	

CREATE TABLE erp_system.dbo.penalties_requests						(	request_serial INT PRIMARY KEY,
																		employee_on_penalty INT REFERENCES employees_info(employee_id),
																		requested_by INT REFERENCES employees_info(employee_id),
																		penalty_month INT,
																		penalty_year INT,
																		penalty_days INT,
																		penalty_status INT REFERENCES approvals_status(id), 
																		comments VARCHAR(150),
																		date_added DATETIME DEFAULT getdate(),
																	);	

CREATE TABLE erp_system.dbo.penalties_approvals_rejections			(	request_serial INT REFERENCES penalties_requests(request_serial),
																		approving_personnel INT REFERENCES employees_info(employee_id),
																		comments VARCHAR(150),
																		date_added DATETIME DEFAULT getdate(),
																	);
																	
CREATE TABLE erp_system.dbo.rewards_requests						(	request_serial INT PRIMARY KEY,
																		employee_on_reward INT REFERENCES employees_info(employee_id),
																		requested_by INT REFERENCES employees_info(employee_id),
																		reward_month INT,
																		reward_year INT,
																		reward_days INT,
																		reward_status INT REFERENCES approvals_status(id), 
																		comments VARCHAR(150),
																		date_added DATETIME DEFAULT getdate(),
																	);	

CREATE TABLE erp_system.dbo.rewards_approvals_rejections				(	request_serial INT REFERENCES rewards_requests(request_serial),
																		approving_personnel INT REFERENCES employees_info(employee_id),
																		comments VARCHAR(150),
																		date_added DATETIME DEFAULT getdate(),
																	);		

																	
CREATE TABLE erp_system.dbo.allowances_requests				(	request_serial INT PRIMARY KEY,
																employee_id INT REFERENCES employees_info(employee_id),
																allowance_type INT REFERENCES allowance_types(id),
																start_date DATE,
																end_date DATE,
																allowance_value MONEY,
																is_repeat BIT,
																allowance_status INT REFERENCES approvals_status(id), 
																comments VARCHAR(150),
																added_by INT REFERENCES employees_info(employee_id),
																date_added DATETIME DEFAULT getdate(),
															);																		

CREATE TABLE erp_system.dbo.allowances_approvals_rejections				(	request_serial INT REFERENCES allowances_requests(request_serial),
																		approving_personnel INT REFERENCES employees_info(employee_id),
																		comments VARCHAR(150),
																		date_added DATETIME DEFAULT getdate(),
																		PRIMARY KEY (request_serial,approving_personnel),
																	);
																	
CREATE TABLE erp_system.dbo.deductions_requests				(	request_serial INT PRIMARY KEY,
																employee_id INT REFERENCES employees_info(employee_id),
																deduction_type INT REFERENCES deduction_types(id),
																start_date DATE,
																end_date DATE,
																deduction_value MONEY,
																is_repeat BIT,
																deduction_status INT REFERENCES approvals_status(id), 
																comments VARCHAR(150),
																added_by INT REFERENCES employees_info(employee_id),
																date_added DATETIME DEFAULT getdate(),
															);	

CREATE TABLE erp_system.dbo.deductions_approvals_rejections				(	request_serial INT REFERENCES deductions_requests(request_serial),
																		approving_personnel INT REFERENCES employees_info(employee_id),
																		comments VARCHAR(150),
																		date_added DATETIME DEFAULT getdate(),
																		PRIMARY KEY (request_serial,approving_personnel),
																	);
																	
CREATE TABLE erp_system.dbo.salary_hold						(	hold_serial INT PRIMARY KEY,
																employee_id INT REFERENCES employees_info(employee_id),
																due_month INT,
																due_year INT,
																is_valid BIT,
																comments VARCHAR(150),
																added_by INT REFERENCES employees_info(employee_id),
																date_added DATETIME DEFAULT getdate(),
															);																	

CREATE TABLE erp_system.dbo.salary_unhold					(	hold_serial INT PRIMARY KEY REFERENCES salary_hold(hold_serial),
																comments VARCHAR(150),
																added_by INT REFERENCES employees_info(employee_id),
																date_added DATETIME DEFAULT getdate(),
															);															
--CLIENT COMPANY INFO								
CREATE TABLE erp_system.dbo.company_name			( 	company_serial INT PRIMARY KEY,
														company_name NVARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
													);
											
CREATE TABLE erp_system.dbo.company_address				( 	address_serial INT PRIMARY KEY,
														company_serial INT REFERENCES company_name(company_serial),
														address INT REFERENCES districts(id),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
													);

CREATE TABLE erp_system.dbo.company_field_of_work	( 	company_serial INT REFERENCES company_name(company_serial),
														work_field INT REFERENCES client_specific_work_fields(id),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (company_serial)
													);
													
CREATE TABLE erp_system.dbo.company_fax					(	branch_serial INT REFERENCES company_address(address_serial),
														fax VARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (branch_serial,fax)
													);
											
CREATE TABLE erp_system.dbo.company_telephone				(	branch_serial INT REFERENCES company_address(address_serial),
														telephone_number VARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (branch_serial,telephone_number)
													);

--CONTACT PERSONS											
CREATE TABLE erp_system.dbo.contact_person_info		(		sales_person_id INT REFERENCES employees_info(employee_id),
														branch_serial INT REFERENCES company_address(address_serial),
														contact_id INT,
														email VARCHAR(50),
														name VARCHAR(50),
														gender VARCHAR(10),
														department INT REFERENCES departments_type(id),
														is_valid BIT,
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (sales_person_id,branch_serial,contact_id)
													);

CREATE TABLE erp_system.dbo.contact_person_mobile			(	sales_person_id INT,
														branch_serial INT,
														contact_id INT,
														telephone_id INT,
														mobile VARCHAR(50),
														date_added DATETIME DEFAULT getdate(),
														FOREIGN KEY (sales_person_id,branch_serial,contact_id) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id),
														PRIMARY KEY (sales_person_id,branch_serial,contact_id,telephone_id)
													);	
													
CREATE TABLE erp_system.dbo.contact_person_personal_emails	(	sales_person_id INT,
														branch_serial INT,
														contact_id INT,
														email_id INT,
														personal_email VARCHAR(50),
														date_added DATETIME DEFAULT getdate(),
														FOREIGN KEY (sales_person_id,branch_serial,contact_id) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id),
														PRIMARY KEY (sales_person_id,branch_serial,contact_id,email_id)
													);	
													
CREATE TABLE erp_system.dbo.contact_person_comment	(	sales_person_id INT,
														branch_serial INT,
														contact_id INT,
														comment_id INT,
														comment_on_contact VARCHAR(150),
														date_added DATETIME DEFAULT getdate(),
														FOREIGN KEY (sales_person_id,branch_serial,contact_id) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id),
														PRIMARY KEY (sales_person_id,branch_serial,contact_id,comment_id)
													);								

--GOVERMENT ENTITIES
CREATE TABLE erp_system.dbo.gonvernmental_entities	(	entity_serial INT PRIMARY KEY,
														entity_name NVARCHAR(100),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
														
													);
													
CREATE TABLE erp_system.dbo.government_contacts	(	entity_serial INT,
													contact_id INT,
													contact_name NVARCHAR(100),
													contact_phone VARCHAR(100),
													added_by INT REFERENCES employees_info(employee_id),
													date_added DATETIME DEFAULT getdate(),
													PRIMARY KEY (entity_serial, contact_id)
													
												);	
													
--MY COMPANY WORK
CREATE TABLE erp_system.dbo.rfqs								(	issue_date DATETIME DEFAULT getdate(),
															sales_person INT,
															rfq_serial INT,
															rfq_version INT,
															assigned_engineer INT REFERENCES employees_info(employee_id),
															rfq_id VARCHAR(50),
															branch_serial INT,
															contact_id INT, 
															project_serial INT,
															contract_type INT REFERENCES contracts_type(id),
															deadline_date DATETIME,
															rfq_status INT REFERENCES rfqs_status(id),
															rfq_notes VARCHAR(150),
															FOREIGN KEY (sales_person,branch_serial,contact_id) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id),
															FOREIGN KEY (project_serial) REFERENCES client_projects(project_serial),															
															PRIMARY KEY (sales_person,rfq_serial,rfq_version)
														);	
														
CREATE TABLE erp_system.dbo.rfqs_products_info		(	    sales_person INT,
															rfq_serial INT,
															rfq_version INT,
															
															product_number INT,
															product_category INT,
															product_type INT,
															product_brand INT,
															product_model INT,
															
															product_quantity INT,
															
															date_added DATETIME DEFAULT getdate(),
															
															FOREIGN KEY (product_category) REFERENCES products_category(id),
															FOREIGN KEY (product_type,product_brand,product_model) REFERENCES brands_models(product_id,brand_id,model_id),
															FOREIGN KEY (sales_person,rfq_serial,rfq_version) REFERENCES rfqs(sales_person,rfq_serial,rfq_version),
															PRIMARY KEY (sales_person,rfq_serial,rfq_version,product_number)
														);
		
CREATE TABLE erp_system.dbo.unsuccessful_rfqs		(	sales_person INT,
												rfq_serial INT,
												rfq_version INT,
												failure_reason INT REFERENCES rfq_failure_reasons(id),
												failure_date DATETIME DEFAULT getdate(),
												FOREIGN KEY (sales_person,rfq_serial,rfq_version) REFERENCES rfqs(sales_person,rfq_serial,rfq_version),
												PRIMARY KEY (sales_person,rfq_serial,rfq_version)
																	
											);	
											
CREATE TABLE erp_system.dbo.updated_rfqs_assignees	(	sales_person INT,
												rfq_serial INT,
												rfq_version INT,
												update_serial INT,
												old_assignee INT REFERENCES employees_info(employee_id),
												new_assignee INT REFERENCES employees_info(employee_id),
												update_date DATETIME DEFAULT getdate(),
												FOREIGN KEY (sales_person,rfq_serial,rfq_version) REFERENCES rfqs(sales_person,rfq_serial,rfq_version),
												PRIMARY KEY (sales_person,rfq_serial,rfq_version,update_serial)
											);	
																			
											
CREATE TABLE erp_system.dbo.outgoing_qoutations		(	issue_date DATETIME DEFAULT getdate(),											

												offer_proposer INT REFERENCES employees_info(employee_id),
												offer_serial INT,
												offer_version INT,
												
												sales_person INT,
												branch_serial INT,
												contact_id INT,
												project_serial INT,
												
												offer_id VARCHAR(50),
												
												price_currency INT REFERENCES currencies_type(id),
												price_value MONEY,
												
												percent_down_payment INT,
												percent_on_delivery INT,
												percent_on_installation INT,
												
												isDrawing BIT,
												
												delivery_period_minimum INT,
												delivery_period_maximum INT,
												delivery_time_unit INT REFERENCES time_units(id),
												
												delivery_point INT REFERENCES delivery_points(id),
												contract_type INT REFERENCES contracts_type(id),
												
												warranty_period INT,
												warranty_time_unit INT REFERENCES time_units(id),
												
												offer_validity_period INT,
												offer_validity_unit INT REFERENCES time_units(id),
												
												delivery_time_condition INT,
												warranty_period_condition INT,
												drawing_submission_deadline_condition INT,
												shipment_type INT,
												vat_condition INT,
												
												offer_status INT REFERENCES offers_status(id),
												offer_notes VARCHAR(150),
												
												FOREIGN KEY (sales_person,branch_serial,contact_id) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id),
												FOREIGN KEY (project_serial) REFERENCES client_projects(project_serial),
												PRIMARY KEY (offer_proposer,offer_serial,offer_version)
											);

							
CREATE TABLE erp_system.dbo.outgoing_quotations_items		(offer_proposer INT REFERENCES employees_info(employee_id),
	                                                         offer_serial INT,
	                                                         offer_version INT,
	                                                         
	                                                         product_number INT,
															 product_category INT,
	                                                         product_type INT,
	                                                         product_brand INT,
	                                                         product_model INT,
	                                                         product_spec INT,
															 
	                                                         product_quantity INT,
	                                                         product_price MONEY,
	                                                         
	                                                         date_added DATETIME DEFAULT getdate(),
	                                                         
	                                                         FOREIGN KEY (product_category,product_type,product_brand,product_model,product_spec) REFERENCES model_specs(category_id, product_id,brand_id,model_id,spec_id),
	                                                         FOREIGN KEY (offer_proposer,offer_serial,offer_version) REFERENCES outgoing_quotations(offer_proposer,offer_serial,offer_version),
	                                                         PRIMARY KEY (offer_proposer,offer_serial,offer_version,product_number)
);

CREATE TABLE erp_system.dbo.quotations_drawings		(	offer_proposer INT REFERENCES employees_info(employee_id),
															offer_serial INT,
															offer_version INT,
															
															drawing_period_minimum INT,
															drawing_period_maximum INT,
															time_unit INT,
															time_condition INT,
															
															date_added DATETIME DEFAULT getdate(),
															
															FOREIGN KEY (offer_proposer,offer_serial,offer_version) REFERENCES outgoing_quotations(offer_proposer,offer_serial,offer_version),
															FOREIGN KEY (time_condition) REFERENCES condition_start_dates(id),
															PRIMARY KEY (offer_proposer,offer_serial,offer_version)
														);

													
CREATE TABLE erp_system.dbo.quotations_rfqs			(	offer_proposer INT REFERENCES employees_info(employee_id),
															offer_serial INT,
															offer_version INT,
															
															sales_person INT,
															rfq_serial INT,
															rfq_version INT,
															
															date_added DATETIME DEFAULT getdate(),
															
															FOREIGN KEY (sales_person,rfq_serial,rfq_version) REFERENCES rfqs(sales_person,rfq_serial,rfq_version),
															FOREIGN KEY (offer_proposer,offer_serial,offer_version) REFERENCES outgoing_quotations(offer_proposer,offer_serial,offer_version),
															PRIMARY KEY (offer_proposer,offer_serial,offer_version)
														);												
													
											
CREATE TABLE erp_system.dbo.unsucessful_quotations			(	failure_date DATETIME DEFAULT getdate(),
															offer_proposer INT,
															offer_serial INT,
															offer_version INT,
															failure_reason INT REFERENCES offer_failure_reasons(id),
															FOREIGN KEY (offer_proposer,offer_serial,offer_version) REFERENCES outgoing_quotations(offer_proposer,offer_serial,offer_version),
															PRIMARY KEY (offer_proposer,offer_serial,offer_version)
															
														);
														
											

CREATE TABLE erp_system.dbo.work_orders				(	issue_date DATETIME DEFAULT getdate(),											

															order_serial INT PRIMARY KEY,
															
															sales_person INT,
															branch_serial INT,
															contact_id INT,
															
															order_id VARCHAR(50),
															
															price_currency INT REFERENCES currencies_type(id),
															price_value MONEY,
															
															vat_condition BIT,
															
															percent_down_payment INT,
															percent_on_delivery INT,
															percent_on_installation INT,
															
															isDrawing BIT,
															
															contract_type INT REFERENCES contracts_type(id),
															
															delivery_period_minimum INT,
															delivery_period_maximum INT,
															delivery_time_unit INT REFERENCES time_units(id),
															delivery_time_condition INT REFERENCES condition_start_dates(id),
															
															delivery_point INT REFERENCES delivery_points(id),
															shipment_type INT REFERENCES shipment_types(id),
															
															warranty_period INT,
															warranty_time_unit INT REFERENCES time_units(id),
															warranty_period_condition INT REFERENCES condition_start_dates(id),
															
															order_status INT REFERENCES orders_status(id),
															order_notes NVARCHAR(250),
															
															FOREIGN KEY (sales_person,branch_serial,contact_id) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id)
														);
															
CREATE TABLE erp_system.dbo.work_orders_edit_log	(	issue_date DATETIME DEFAULT getdate(),											

															order_serial INT,
															edit_serial INT,
															
															sales_person INT,
															branch_serial INT,
															contact_id INT,
															
															order_id VARCHAR(50),
															
															price_currency INT REFERENCES currencies_type(id),
															price_value MONEY,
															
															vat_condition BIT,
															
															percent_down_payment INT,
															percent_on_delivery INT,
															percent_on_installation INT,
															
															isDrawing BIT,
															
															contract_type INT REFERENCES contracts_type(id),
															
															delivery_period_minimum INT,
															delivery_period_maximum INT,
															delivery_time_unit INT REFERENCES time_units(id),
															delivery_time_condition INT REFERENCES condition_start_dates(id),
															
															delivery_point INT REFERENCES delivery_points(id),
															shipment_type INT REFERENCES shipment_types(id),
															
															warranty_period INT,
															warranty_time_unit INT REFERENCES time_units(id),
															warranty_period_condition INT REFERENCES condition_start_dates(id),
															
															order_status INT REFERENCES orders_status(id),
															order_notes NVARCHAR(250),
															
															PRIMARY KEY (order_serial, edit_serial),
															FOREIGN KEY (order_serial) REFERENCES work_orders(order_serial),
															FOREIGN KEY (sales_person,branch_serial,contact_id) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id)
														);	
											
CREATE TABLE erp_system.dbo.work_orders_quotations		(	order_serial INT PRIMARY KEY,
															
															offer_proposer INT,
															offer_serial INT,
															offer_version INT,
															date_added DATETIME DEFAULT getdate(),
															
															FOREIGN KEY (offer_proposer,offer_serial,offer_version) REFERENCES outgoing_quotations(offer_proposer,offer_serial,offer_version),
															FOREIGN KEY (order_serial) REFERENCES incoming_purchase_orders(order_serial)
														);
														
CREATE TABLE erp_system.dbo.work_orders_quotations_edit_log		(	order_serial INT,
																	edit_serial INT,
																	
															offer_proposer INT,
															offer_serial INT,
															offer_version INT,
															date_added DATETIME DEFAULT getdate(),
															
															PRIMARY KEY (order_serial, edit_serial),
															FOREIGN KEY (order_serial) REFERENCES work_orders(order_serial),
															FOREIGN KEY (offer_proposer,offer_serial,offer_version) REFERENCES outgoing_quotations(offer_proposer,offer_serial,offer_version)
														);														

CREATE TABLE erp_system.dbo.work_orders_products_info (order_serial INT,
															
															product_number INT,
															product_category INT,
															product_type INT,
															product_brand INT,
															product_model INT,
															
															product_quantity INT,
															product_price MONEY,
															
															date_added DATETIME DEFAULT getdate(),
															
															FOREIGN KEY (product_category) REFERENCES products_category(id),
															FOREIGN KEY (product_type,product_brand,product_model) REFERENCES brands_models(product_id,brand_id,model_id),
															FOREIGN KEY (order_serial) REFERENCES work_orders(order_serial),
															PRIMARY KEY (order_serial,product_number)
															);
															
CREATE TABLE erp_system.dbo.work_orders_products_edit_log (	order_serial INT,
															edit_serial INT,
															
															product_number INT,
															product_category INT,
															product_type INT,
															product_brand INT,
															product_model INT,
															
															product_quantity INT,
															product_price MONEY,
															
															date_added DATETIME DEFAULT getdate(),
															
															PRIMARY KEY (order_serial, edit_serial, product_number),
															FOREIGN KEY (order_serial) REFERENCES work_orders(order_serial),
															FOREIGN KEY (product_category) REFERENCES products_category(id),
															FOREIGN KEY (product_type,product_brand,product_model) REFERENCES brands_models(product_id,brand_id,model_id),
															);															

CREATE TABLE erp_system.dbo.work_orders_products_serials (	order_serial INT,
															product_number INT, 
															serial_id INT,
															serial varchar(100),
															serial_status INT REFERENCES erp_system.dbo.orders_status(id),

															date_added DATETIME DEFAULT getdate(),
															FOREIGN KEY (order_serial, product_number) REFERENCES erp_system.dbo.work_orders_products_info(order_serial, product_number),
															PRIMARY KEY (order_serial, product_number, serial_id)
														 );														


CREATE TABLE erp_system.dbo.work_orders_project_locations	(	order_serial INT REFERENCES work_orders(order_serial),
																project_serial INT,
																location_id INT,
																date_added DATETIME default getdate(),
																FOREIGN KEY (project_serial, location_id) REFERENCES client_project_locations(project_serial, location_id),
																PRIMARY KEY (order_serial, project_serial, location_id)
															);

CREATE TABLE erp_system.dbo.work_orders_project_edit_log	(	order_serial INT,
																edit_serial INT,
																
																project_serial INT,
																location_id INT,
																date_added DATETIME default getdate(),
																PRIMARY KEY (order_serial, edit_serial, location_id),
																FOREIGN KEY (order_serial) REFERENCES work_orders(order_serial),
																FOREIGN KEY (project_serial, location_id) REFERENCES client_project_locations(project_serial, location_id),
															);															

CREATE TABLE dbo.work_orders_drawings						(	order_serial int PRIMARY KEY,
																drawing_period_minimum int,
																drawing_period_maximum int,
																time_unit int ,
																time_condition INT REFERENCES condition_start_dates(id),
																date_added datetime DEFAULT getdate()
															);

CREATE TABLE erp_system.dbo.maintenance_offers		(	issue_date DATETIME DEFAULT getdate(),											

																	offer_serial INT,
																	offer_proposer INT,
																	offer_version INT,
																	
																	sales_person INT,
																	branch_serial INT,
																	contact_id INT,
																	project_serial INT,
												
																	offer_id VARCHAR(50),
																	
																	price_currency INT REFERENCES currencies_type(id),
																	price_value MONEY,
												
																	warranty_period INT,
																	warranty_time_unit INT REFERENCES time_units(id),
																	warranty_period_condition INT REFERENCES condition_start_dates(id),
																	
																	including_vat BIT,
																	including_spare_parts BIT,
																	including_batteries BIT,
																	
																	no_of_visits INT,
																	no_of_payments INT,
																	no_of_emergencies INT,

																	offer_status INT REFERENCES offers_status(id),
																	offer_notes NVARCHAR(250),
																	
																	FOREIGN KEY (sales_person,branch_serial,contact_id) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id),
																	FOREIGN KEY (project_serial) REFERENCES client_projects(project_serial),
																	PRIMARY KEY (offer_proposer,offer_serial,offer_version)
																);

CREATE TABLE erp_system.dbo.maintenance_offers_products_info	(	offer_proposer INT,
																	offer_serial INT,
																	offer_version INT,
																	
																	product_number INT,
																	product_category INT REFERENCES products_category(id),
																	product_type INT,
																	product_brand INT,
																	product_model INT,
																	
																	product_quantity INT,
																	product_price MONEY,
																	
																	date_added DATETIME DEFAULT getdate(),
																	
																	FOREIGN KEY (product_type,product_brand,product_model) REFERENCES brands_models(product_id,brand_id,model_id),
																	FOREIGN KEY (offer_proposer,offer_serial,offer_version) REFERENCES maintenance_offers(offer_proposer,offer_serial,offer_version),
																	PRIMARY KEY (offer_proposer,offer_serial,offer_version,product_number)
																);	
																

CREATE TABLE erp_system.dbo.maintenance_offers_rfqs			(	offer_proposer INT REFERENCES employees_info(employee_id),
															offer_serial INT,
															offer_version INT,
															
															sales_person INT,
															rfq_serial INT,
															rfq_version INT,
															
															date_added DATETIME DEFAULT getdate(),
															
															FOREIGN KEY (sales_person,rfq_serial,rfq_version) REFERENCES rfqs(sales_person,rfq_serial,rfq_version),
															FOREIGN KEY (offer_proposer,offer_serial,offer_version) REFERENCES maintenance_offers(offer_proposer,offer_serial,offer_version),
															PRIMARY KEY (offer_proposer,offer_serial,offer_version)
														);

CREATE TABLE erp_system.dbo.unsucessful_maintenance_offers			(	failure_date DATETIME DEFAULT getdate(),
															offer_proposer INT,
															offer_serial INT,
															offer_version INT,
															failure_reason INT REFERENCES offer_failure_reasons(id),
															FOREIGN KEY (offer_proposer,offer_serial,offer_version) REFERENCES maintenance_offers(offer_proposer,offer_serial,offer_version),
															PRIMARY KEY (offer_proposer,offer_serial,offer_version)
															
														);		
														
CREATE TABLE erp_system.dbo.maintenance_contracts		(	issue_date DATETIME DEFAULT getdate(),											

															contract_serial INT,
															contract_version INT, 
															
															sales_person INT,
															branch_serial INT,
															contact_id INT,
															
															contract_id VARCHAR(50),
															
															price_currency INT REFERENCES currencies_type(id),
															price_value MONEY,
												
															warranty_period INT,
															warranty_time_unit INT REFERENCES time_units(id),
															warranty_period_condition INT REFERENCES condition_start_dates(id),
															
															including_vat BIT,
															including_spare_parts BIT,
															including_batteries BIT,
															
															no_of_visits INT,
															no_of_payments INT,
															no_of_emergencies INT,
															

															contract_status INT REFERENCES orders_status(id),
															contract_notes NVARCHAR(250),
															
															pre_sales INT REFERENCES employees_info(employee_id),
															project_serial INT REFERENCES client_projects(project_serial),

															automatically_renewed BIT,
															increase_rate INT,

															FOREIGN KEY (sales_person,branch_serial,contact_id) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id),
															PRIMARY KEY (contract_serial, contract_version)
														);
														
CREATE TABLE erp_system.dbo.maintenance_contracts_offers	(	contract_serial INT,
																contract_version INT, 
															
																offer_proposer INT,
																offer_serial INT,
																offer_version INT,

																date_added DATETIME DEFAULT getdate(),
																
																FOREIGN KEY (offer_proposer,offer_serial,offer_version) REFERENCES maintenance_offers(offer_proposer,offer_serial,offer_version),
																FOREIGN KEY (contract_serial, contract_version) REFERENCES maintenance_contracts(contract_serial, contract_version),
																PRIMARY KEY (contract_serial, contract_version)
															);														

CREATE TABLE erp_system.dbo.maintenance_contracts_products_info	(	contract_serial INT,
																	contract_version INT, 
																	
																	product_number INT,
																	product_category INT REFERENCES products_category(id),
																	product_type INT,
																	product_brand INT,
																	product_model INT,
																	
																	product_quantity INT,
																	product_price MONEY,
																	
																	date_added DATETIME DEFAULT getdate(),
																	
																	FOREIGN KEY (product_type,product_brand,product_model) REFERENCES brands_models(product_id,brand_id,model_id),
																	FOREIGN KEY (contract_serial, contract_version) REFERENCES maintenance_contracts(contract_serial, contract_version),
																	PRIMARY KEY (contract_serial, contract_version, product_number)
																);	

CREATE TABLE erp_system.dbo.maintenance_contracts_products_serials(	contract_serial INT,
																	contract_version INT, 
																	
																	product_number INT,
																	serial_id INT,
																	serial varchar(100),

																	date_added DATETIME DEFAULT getdate(),
																	FOREIGN KEY (contract_serial, contract_version, product_number) REFERENCES maintenance_contracts_products_info(contract_serial, contract_version, product_number),
																	PRIMARY KEY (contract_serial, contract_version, product_number, serial_id)
																);														

CREATE TABLE erp_system.dbo.maintenance_contracts_projects_locations	(	contract_serial INT,
																			contract_version INT,
																			project_serial INT,
																			location_id INT,
																			date_added DATETIME DEFAULT getdate(),
																			
																			FOREIGN KEY (contract_serial, contract_version) REFERENCES maintenance_contracts(contract_serial, contract_version),
																			FOREIGN KEY (project_serial,location_id) REFERENCES client_project_locations(project_serial,location_id),
																			PRIMARY KEY (contract_serial, contract_version, project_serial, location_id)
																		);

																		
CREATE TABLE erp_system.dbo.client_visits				(	issue_date DATETIME DEFAULT getdate(),
															sales_person INT,
															visit_serial INT,
															branch_serial INT,
															contact_id INT, 
															visit_purpose INT REFERENCES visits_purpose(id),
															visit_result INT REFERENCES visits_result(id),
															visit_note VARCHAR(150),
															date_of_visit DATETIME,
															FOREIGN KEY (sales_person,branch_serial,contact_id) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id),
															PRIMARY KEY (sales_person,visit_serial)
														);																	

CREATE TABLE erp_system.dbo.client_visits_approvals_rejections	(	sales_person INT ,
																	visit_serial INT,
																	approving_personnel INT REFERENCES employees_info(employee_id),
																	comments VARCHAR(150),
																	date_added DATETIME DEFAULT getdate(),
																	FOREIGN KEY (sales_person,visit_serial) REFERENCES client_visits(sales_person,visit_serial),
																	PRIMARY KEY (sales_person,visit_serial,approving_personnel)
																);
														
CREATE TABLE erp_system.dbo.client_calls				(	issue_date DATETIME DEFAULT getdate(),
															sales_person INT,
															call_serial INT,
															branch_serial INT,
															contact_id INT, 
															call_purpose INT REFERENCES calls_purpose(id),
															call_result INT REFERENCES calls_result(id),
															call_note VARCHAR(150),
															date_of_call DATETIME,
															FOREIGN KEY (sales_person,branch_serial,contact_id) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id),
															PRIMARY KEY (sales_person,call_serial)
														);																	

CREATE TABLE erp_system.dbo.client_calls_approvals_rejections	(	sales_person INT ,
																	call_serial INT,
																	approving_personnel INT REFERENCES employees_info(employee_id),
																	comments VARCHAR(150),
																	date_added DATETIME DEFAULT getdate(),
																	FOREIGN KEY (sales_person,call_serial) REFERENCES client_calls(sales_person,call_serial),
																	PRIMARY KEY (sales_person,call_serial,approving_personnel)
																);
																
CREATE TABLE erp_system.dbo.office_meetings				(	issue_date DATETIME DEFAULT getdate(),
															meeting_serial INT,
															called_by INT REFERENCES employees_info(employee_id),
															meeting_purpose INT REFERENCES meetings_purpose(id),
															meeting_note VARCHAR(150),
															date_of_meeting DATETIME,
															PRIMARY KEY (meeting_serial)
														);

CREATE TABLE erp_system.dbo.office_meetings_approvals_rejections(	meeting_serial INT,
																	approving_personnel INT REFERENCES employees_info(employee_id),
																	comments VARCHAR(150),
																	date_added DATETIME DEFAULT getdate(),
																	FOREIGN KEY (meeting_serial) REFERENCES office_meetings(meeting_serial),
																	PRIMARY KEY (meeting_serial,approving_personnel)
																);
--PROJECTS
CREATE TABLE erp_system.dbo.consultant_names		(	consultant_serial int PRIMARY KEY,
														consultant_name NVARCHAR(100),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.owner_names				(	owner_serial int PRIMARY KEY,
														owner_name NVARCHAR(100),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.general_contractor_names(	contractor_serial int PRIMARY KEY,
														contractor_name NVARCHAR(100),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
													);
CREATE TABLE erp_system.dbo.company_projects	    (   project_serial INT PRIMARY KEY,
														project_name NVARCHAR(100),
														project_id VARCHAR(50),
														consultant_serial INT REFERENCES consultant_names(consultant_serial),
														owner_serial INT REFERENCES owner_names(owner_serial),
													    contractor_serial INT REFERENCES general_contractor_names(contractor_serial),
														contract_value money,
														date_added DATETIME DEFAULT getdate()
													);

CREATE TABLE erp_system.dbo.company_project_locations(	project_serial INT REFERENCES company_projects(project_serial),
														location_id INT,
														project_location INT REFERENCES ditricts(id),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (project_serial,location_id)
													);


CREATE TABLE erp_system.dbo.client_projects			(	project_serial INT PRIMARY KEY,
															project_name NVARCHAR(50),
															project_id VARCHAR(15),
															date_added DATETIME DEFAULT getdate()
														);
														
CREATE TABLE erp_system.dbo.client_project_locations			(	project_serial INT REFERENCES projects(project_serial),
															location_id INT,
															project_location INT REFERENCES districts(id), 
															date_added DATETIME DEFAULT getdate()
															PRIMARY KEY (project_serial,location_id),
														);
														
CREATE TABLE erp_system.dbo.projects_assignees		(   employee_id INT REFERENCES employees_info(employee_id),
														project_serial INT,
														location_id INT,
														is_valid BIT,
														added_by INT REFERENCES employees_info(employee_id),
														date_added datetime DEFAULT GETDATE(),
														FOREIGN KEY (project_serial,location_id) REFERENCES company_project_locations(project_serial,location_id),
														PRIMARY KEY (employee_id,project_serial,location_id)
													);
													
CREATE TABLE erp_system.dbo.projects_assignees_log	(   update_serial INT PRIMARY KEY,
														employee_id INT,
														project_serial INT,
														location_id INT,
														is_new_join BIT,
														is_abort BIT,
														is_reassigned BIT,
														updated_by INT REFERENCES employees_info(employee_id),
														update_date datetime DEFAULT GETDATE(),
														FOREIGN KEY (employee_id,project_serial,location_id) REFERENCES projects_assignees(employee_id,project_serial,location_id)
													);													
														

--INVENTORY
CREATE TABLE erp_system.dbo.pricing_criteria		(	id INT PRIMARY KEY,
														pricing_criteria VARCHAR(50),
														date_added DATETIME DEFAULT GETDATE()
													);

CREATE TABLE erp_system.dbo.stock_categories		(	category_id INT PRIMARY KEY,
														category_name NVARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
													);
													
CREATE TABLE erp_system.dbo.generic_products_category	(	category_id INT PRIMARY KEY,
															category_name NVARCHAR(50),
															date_added DATETIME DEFAULT GETDATE()
														);
													
CREATE TABLE erp_system.dbo.generic_products_type	(	category_id INT REFERENCES generic_products_category(category_id),
														product_id INT,
														product_name NVARCHAR(50),
														date_added DATETIME DEFAULT GETDATE(),
														PRIMARY KEY (category_id,product_id)
													);

CREATE TABLE erp_system.dbo.generic_brands			(	brand_id INT PRIMARY KEY,
														brand_name NVARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT GETDATE()
														
													);
													
CREATE TABLE erp_system.dbo.generic_products_brand (	category_id INT,
														product_id INT,
														brand_id INT REFERENCES generic_brands(brand_id),
														date_added DATETIME DEFAULT GETDATE(),
														FOREIGN KEY (category_id,product_id) REFERENCES generic_products_type(category_id,product_id),
														PRIMARY KEY (category_id,product_id, brand_id)
													);

CREATE TABLE erp_system.dbo.generic_products_model	(	category_id INT,
														product_id INT,
														brand_id INT,
														model_id INT,
														model_name NVARCHAR(150),
														
														item_unit INT REFERENCES measure_units(id),
														
														has_serial_number BIT,
														
														pricing_criteria INT REFERENCES pricing_criteria(id),
														
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
														
														FOREIGN KEY (category_id,product_id, brand_id) REFERENCES generic_products_brand(category_id,product_id, brand_id),
														PRIMARY KEY (category_id,product_id, brand_id, model_id)
													);


CREATE TABLE erp_system.dbo.warehouse_locations		(	location_id INT REFERENCES districts(id),
														nickname NVARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (location_id)
													);

CREATE TABLE erp_system.dbo.material_entry_permits	(	transaction_date DATETIME DEFAULT GETDATE(),
														
														entry_permit_serial INT PRIMARY KEY,
														
														warehouse_location INT REFERENCES warehouse_locations(location_id),
														
														added_by INT REFERENCES employees_info(employee_id)
													);
													
CREATE TABLE erp_system.dbo.material_entry_permit_items		(	entry_permit_serial INT REFERENCES material_entry_permits(entry_permit_serial),
																entry_permit_item_serial INT,
																
																generic_category_id INT,
																generic_product_id INT,
																generic_brand_id INT,
																generic_model_id INT,
																
																company_product_id INT,
																company_brand_id INT,
																company_model_id INT,
																
																product_serial_number VARCHAR(50),
																
																quantity INT,
																
																item_price MONEY,
																item_currency INT REFERENCES currencies_type(id),
																
																rfp_requestor_team INT,
																rfp_serial INT,
																rfp_version INT,
																rfp_item_no INT,
																	
																added_by INT REFERENCES employees_info(employee_id),
																
																FOREIGN KEY (generic_category_id, generic_product_id, generic_brand_id, generic_model_id) REFERENCES generic_products_model(category_id,product_id, brand_id, model_id),
																FOREIGN KEY (company_product_id, company_brand_id, company_model_id) REFERENCES brands_models(product_id, brand_id, model_id),
																FOREIGN KEY (rfp_requestor_team,rfp_serial,rfp_version,rfp_item_no) REFERENCES rfps_items_mapping(rfp_requestor_team,rfp_serial,rfp_version,item_no),
																PRIMARY KEY (entry_permit_serial, entry_permit_item_serial)
															);		


																
CREATE TABLE erp_system.dbo.material_release_permits	(	release_date DATETIME DEFAULT GETDATE(),
														
															release_serial INT PRIMARY KEY,
														
															material_receiver INT REFERENCES employees_info(employee_id),
															
															release_by INT REFERENCES employees_info(employee_id)
														);
													
CREATE TABLE erp_system.dbo.material_release_permit_items	(	release_serial INT REFERENCES material_release_permits(release_serial),
																release_item_serial INT,
																
																entry_permit_serial INT,
																entry_permit_item_serial INT,
																
																quantity INT,
																
																rfp_requestor_team INT,
																rfp_serial INT,
																rfp_version INT,
																rfp_item_no INT,
																
																wo_serial INT,
																wo_product_no INT,
																
																order_serial INT,
																order_project_serial INT,
																order_location_id INT,
																
																company_project_serial INT,
																company_project_location_id INT,
															
																contract_serial INT,
																contract_version INT,
																contract_project_serial INT,
																contract_location_id INT,
																		
																date_added DATETIME DEFAULT GETDATE(),
																
																FOREIGN KEY (entry_permit_serial, entry_permit_item_serial) REFERENCES material_entry_permit_items(entry_permit_serial, entry_permit_item_serial),
																FOREIGN KEY (rfp_requestor_team,rfp_serial,rfp_version,rfp_item_no) REFERENCES rfps_items_mapping(rfp_requestor_team,rfp_serial,rfp_version,item_no),
																FOREIGN KEY (wo_serial,wo_product_no) REFERENCES work_orders_products_info(order_serial,product_number),
																FOREIGN KEY (order_serial, order_project_serial, order_location_id) REFERENCES work_orders_project_locations(order_serial, project_serial, location_id),
																FOREIGN KEY (contract_serial, contract_version, contract_project_serial, contract_location_id) REFERENCES maintenance_contracts_projects_locations(contract_serial, contract_version, project_serial, location_id),
																FOREIGN KEY (company_project_serial, company_project_location_id) REFERENCES company_project_locations(project_serial,location_id),
																PRIMARY KEY (release_serial, release_item_serial)
															);	
													
CREATE TABLE erp_system.dbo.material_reservation		(	reservation_date DATETIME DEFAULT GETDATE(),
														
															reservation_serial INT PRIMARY KEY,
															
															entry_permit_serial INT,
															entry_permit_item_serial INT,
													
															quantity INT,
															
															rfp_requestor_team INT,
															rfp_serial INT,
															rfp_version INT,
															rfp_item_no INT,
															
															order_serial INT,
															order_product_no INT,
															
															offer_proposer INT,
	                                                        offer_serial INT,
	                                                        offer_version INT, 
	                                                        offer_product_no INT,
									
															reserved_by INT REFERENCES employees_info(employee_id),
															
															is_released BIT,
															is_cancelled BIT,

															hold_until DATE,
															
															FOREIGN KEY (order_serial,order_product_no) REFERENCES work_orders_products_info(order_serial,product_number),
															FOREIGN KEY (offer_proposer,offer_serial,offer_version,offer_product_no) REFERENCES outgoing_quotations_items(offer_proposer,offer_serial,offer_version,product_number),
															FOREIGN KEY (entry_permit_serial, entry_permit_item_serial) REFERENCES material_entry_permit_items(entry_permit_serial, entry_permit_item_serial)
														);
														
--PROCUREMENT													
CREATE TABLE erp_system.dbo.supplier_name			(	supplier_serial INT PRIMARY KEY,
														supplier_name NVARCHAR(50),
														supplier_field INT REFERENCES supplier_fields(id),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
													);

CREATE TABLE erp_system.dbo.supplier_brands			(	supplier_serial INT REFERENCES supplier_name(supplier_serial),
														brand_serial INT,
														
														generic_category_id INT,
														generic_product_id INT,
														generic_brand_id INT,
														
														company_product_id INT,
														company_brand_id INT,
																
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
														
														FOREIGN KEY (generic_category_id, generic_product_id, generic_brand_id) REFERENCES generic_products_brand(category_id,product_id, brand_id),
														FOREIGN KEY (company_product_id, company_brand_id) REFERENCES products_brands(product_id, brand_id),
														PRIMARY KEY (supplier_serial,brand_serial)
													);
													
CREATE TABLE erp_system.dbo.supplier_branches		(	branch_serial INT PRIMARY KEY,
														supplier_serial INT REFERENCES supplier_name(supplier_serial),
														address INT REFERENCES ditricts(id),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate()
													);
	
													
CREATE TABLE erp_system.dbo.supplier_fax			(	branch_serial INT REFERENCES supplier_branches(branch_serial),
														fax VARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (branch_serial,fax)
													);
											
											
CREATE TABLE erp_system.dbo.supplier_telephone		(	branch_serial INT REFERENCES supplier_branches(branch_serial),
														telephone_number VARCHAR(50),
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
														PRIMARY KEY (branch_serial,telephone_number)
													);
													
CREATE TABLE erp_system.dbo.supplier_contact_person_info(	branch_serial INT REFERENCES supplier_branches(branch_serial),
															contact_id INT,
															email VARCHAR(50),
															name VARCHAR(50),
															gender VARCHAR(10),
															department INT REFERENCES departments_type(id),
															is_valid BIT,
															added_by INT REFERENCES employees_info(employee_id),
															date_added DATETIME DEFAULT getdate(),
															PRIMARY KEY (branch_serial,contact_id)
													);

CREATE TABLE erp_system.dbo.supplier_contact_person_mobile(	branch_serial INT,
															contact_id INT,
															telephone_id INT,
															mobile VARCHAR(50),
															added_by INT REFERENCES employees_info(employee_id),
															date_added DATETIME DEFAULT getdate(),
															FOREIGN KEY (branch_serial,contact_id) REFERENCES supplier_contact_person_info(branch_serial,contact_id),
															PRIMARY KEY (branch_serial,contact_id,telephone_id)
															);	
													

														
CREATE TABLE erp_system.dbo.rfps						(	issue_date DATETIME DEFAULT getdate(),
															rfq_requestor_team INT REFERENCES teams_type(id),
															rfp_serial INT,
															rfp_version INT,
															requestor_id INT REFERENCES employees_info(employee_id),
															assigned_officer INT REFERENCES employees_info(employee_id),
															work_form INT REFERENCES work_forms(id),
															order_serial INT REFERENCES work_orders(order_serial),
															maintenance_contract INT,
															project_serial INT REFERENCES company_projects(project_serial),
															rfp_id VARCHAR(50),
															rfp_status INT REFERENCES rfps_status(id),
															rfp_notes NVARCHAR(350),
															deadline_date DATETIME,
															maintenance_contract_version INT,
															FOREIGN KEY (maintenance_contract,maintenance_contract_version) REFERENCES maintenance_contracts(contract_serial, contract_version),
															PRIMARY KEY (rfq_requestor_team,rfp_serial,rfp_version)
														);

CREATE TABLE erp_system.dbo.rfps_items					(	rfp_requestor_team INT,
															rfp_serial INT,
															rfp_version INT,
															item_no INT,
															item_description VARCHAR(150),
															item_quantity INT ,
															measure_unit INT REFERENCES measure_units(id),
															item_notes VARCHAR(150),
															item_status INT REFERENCES rfps_status(id),
															date_added DATETIME DEFAULT getdate(),
															FOREIGN KEY (rfp_requestor_team,rfp_serial,rfp_version) REFERENCES rfps(rfp_requestor_team,rfp_serial,rfp_version),
															PRIMARY KEY (rfp_requestor_team,rfp_serial,rfp_version,item_no)
														);
														
CREATE TABLE erp_system.dbo.rfps_item_vendors			(	rfp_requestor_team INT,
															rfp_serial INT,
															rfp_version INT,
															item_no INT,
															brand_id INT REFERENCES generic_brands(brand_id),
															FOREIGN KEY (rfp_requestor_team,rfp_serial,rfp_version,item_no) REFERENCES rfps_items(rfp_requestor_team,rfp_serial,rfp_version,item_no),
															PRIMARY KEY (rfp_requestor_team,rfp_serial,rfp_version,item_no,vendor_id)
														);

CREATE TABLE erp_system.dbo.rfps_items_mapping			(	rfp_requestor_team INT,
															rfp_serial INT,
															rfp_version INT,
															item_no INT,
															
															generic_category_id INT,
															generic_product_id INT,
															generic_brand_id INT,
															generic_model_id INT,
															
															company_product_id INT,
															company_brand_id INT,
															company_model_id INT,
																
															added_by INT REFERENCES employees_info(employee_id),
															date_added DATETIME DEFAULT getdate(),
															
															FOREIGN KEY (generic_category_id, generic_product_id, generic_brand_id, generic_model_id) REFERENCES generic_products_model(category_id,product_id, brand_id, model_id),
															FOREIGN KEY (company_product_id, company_brand_id, company_model_id) REFERENCES brands_models(product_id, brand_id, model_id),	
															FOREIGN KEY (rfp_requestor_team,rfp_serial,rfp_version,item_no) REFERENCES rfps_items(rfp_requestor_team,rfp_serial,rfp_version,item_no),
															PRIMARY KEY (rfp_requestor_team,rfp_serial,rfp_version,item_no)
														);
														
CREATE TABLE erp_system.dbo.incoming_quotations (	issue_date datetime,

													qoutation_serial int PRIMARY KEY,
													quotation_id varchar(50),
													
													procurement_officer int FOREIGN KEY REFERENCES employees_info(employee_id),
													
													supplier_address_serial int,
													supplier_contact int,
													
													price_currency int FOREIGN KEY REFERENCES currencies_type(id),
													price_value money,
													vat_condition int FOREIGN KEY REFERENCES vat_condition(id),
													
													percent_down_payment int,
													percent_on_delivery int,
													percent_payable int,
													payable_period int,
													payable_time_unit int FOREIGN KEY REFERENCES time_units(id),
													payable_time_condition int FOREIGN KEY REFERENCES condition_start_dates(id),
													
													delivery_period_min int,
													delivery_period_max int,
													delivery_time_unit int FOREIGN KEY REFERENCES time_units(id),
													delivery_time_condition int FOREIGN KEY REFERENCES condition_start_dates(id),
													
													delivery_point int FOREIGN KEY REFERENCES delivery_points(id),
													
													contract_type int FOREIGN KEY REFERENCES contracts_type(id),
													
													warranty_period int,
													warranty_time_unit int FOREIGN KEY REFERENCES time_units(id),
													warranty_period_condition int FOREIGN KEY REFERENCES condition_start_dates(id),
													
													validity_period int,
													validity_time_unit int FOREIGN KEY REFERENCES time_units(id),
													
													qoutation_status int FOREIGN KEY REFERENCES offers_status(id),
													
													notes nvarchar(150),
													
													added_by INT REFERENCES employees_info(employee_id),
													date_added DATETIME DEFAULT getdate(),
															
													FOREIGN KEY (supplier_address_serial, supplier_contact) REFERENCES supplier_contact_person_info(branch_serial, contact_id)
													);

			
CREATE TABLE erp_system.dbo.incoming_quotations_items ( qoutation_serial int REFERENCES incoming_quotations(qoutation_serial),
														quotation_item_no int,
														
														rfp_requestor_team int,
														rfp_serial int,
														rfp_version int,
														rfp_item_no int,
														
														quantity int,
														measure_unit int FOREIGN KEY REFERENCES measure_units(id),
														price_value money,
														
														supplier_serial INT,
														brand_serial INT,
														
														notes NVARCHAR(150),
														
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
													
														FOREIGN KEY (rfp_requestor_team,rfp_serial,rfp_version,rfp_item_no) REFERENCES rfps_items_mapping(rfp_requestor_team,rfp_serial,rfp_version,item_no),
														FOREIGN KEY (supplier_serial, brand_serial) REFERENCES supplier_brands(supplier_serial, brand_serial),
														PRIMARY KEY(qoutation_serial, quotation_item_no)
														);
														

														
CREATE TABLE erp_system.dbo.outgoing_purchase_orders	(	issue_date DATETIME DEFAULT getdate(),											

															order_serial INT PRIMARY KEY,
															order_id VARCHAR(50),
															
															procurement_officer int FOREIGN KEY REFERENCES employees_info(employee_id),
															
															supplier_address_serial INT,
															supplier_contact INT,
															
															price_value MONEY,
															price_currency INT REFERENCES currencies_type(id),
															vat_condition int FOREIGN KEY REFERENCES vat_condition(id),
															
															percent_down_payment INT,
															percent_on_delivery INT,
															percent_payable int,
															payable_period int,
															payable_time_unit int FOREIGN KEY REFERENCES time_units(id),
															payable_time_condition int FOREIGN KEY REFERENCES condition_start_dates(id),
															
															delivery_period_minimum INT,
															delivery_period_maximum INT,
															delivery_time_unit INT REFERENCES time_units(id),
															delivery_time_condition int FOREIGN KEY REFERENCES condition_start_dates(id),
															
															
															delivery_point INT REFERENCES delivery_points(id),
															contract_type INT REFERENCES contracts_type(id),
															
															warranty_period INT,
															warranty_time_unit INT REFERENCES time_units(id),
															warranty_time_condition int FOREIGN KEY REFERENCES condition_start_dates(id),
															
															delivered BIT,
															documents_received BIT,
															payment_done BIT,
															invoice_received BIT,
															
															notes NVARCHAR(150),
															
															po_status INT REFERENCES pos_status(id),
															
															added_by INT REFERENCES employees_info(employee_id),
															date_added DATETIME DEFAULT getdate(),
															
															FOREIGN KEY (supplier_address_serial, supplier_contact) REFERENCES supplier_contact_person_info(branch_serial, contact_id),
														);														
														
CREATE TABLE erp_system.dbo.outgoing_purchase_orders_items		(	order_serial INT REFERENCES outgoing_purchase_orders(order_serial),
																	order_item_no INT,
																	
																	rfp_requestor_team INT,
																	rfp_serial INT,
																	rfp_version INT,
																	rfp_item_no INT,
																	
																	supplier_serial INT,
																	brand_serial INT,
																	
																	quantity int,
																	measure_unit int FOREIGN KEY REFERENCES measure_units(id),
																	price_value money,
														
																	notes NVARCHAR(150),
																	
																	added_by INT REFERENCES employees_info(employee_id),
																	date_added DATETIME DEFAULT getdate(),
																	
																	FOREIGN KEY (supplier_serial, brand_serial) REFERENCES supplier_brands(supplier_serial, brand_serial),
																	FOREIGN KEY (rfp_requestor_team,rfp_serial,rfp_version,rfp_item_no) REFERENCES rfps_items_mapping(rfp_requestor_team,rfp_serial,rfp_version,item_no),
																	PRIMARY KEY (order_serial,order_item_no)
																);

														
CREATE TABLE erp_system.dbo.cash_settlements(	issue_date DATETIME DEFAULT getdate(),
												settlement_serial INT PRIMARY KEY,
												
												custody_of INT REFERENCES erp_system.dbo.employees_info(employee_id),
												
												settlement_status INT REFERENCES settlements_status(id),

												added_by INT REFERENCES erp_system.dbo.employees_info(employee_id),
												date_added DATETIME DEFAULT getdate()
											);	

CREATE TABLE erp_system.dbo.cash_settlements_items(	issue_date DATETIME DEFAULT getdate(),
													
													settlement_serial INT REFERENCES cash_settlements(settlement_serial),
													product_serial INT, 
													
													rfp_requestor_team INT,
													rfp_serial INT,
													rfp_version INT,
													rfp_item_no INT,
													
													supplier_serial INT,
													brand_serial INT,
													
													quantity INT,

													payment_value MONEY,
													price_currency int FOREIGN KEY REFERENCES currencies_type(id),

													payment_date DATETIME,
	
													added_by INT REFERENCES erp_system.dbo.employees_info(employee_id),
													date_added DATETIME DEFAULT getdate(),
													
													FOREIGN KEY (supplier_serial,brand_serial) REFERENCES supplier_brands(supplier_serial,brand_serial),
													FOREIGN KEY (rfp_requestor_team,rfp_serial,rfp_version,rfp_item_no) REFERENCES rfps_items_mapping(rfp_requestor_team,rfp_serial,rfp_version,item_no),
													PRIMARY KEY (settlement_serial, product_serial)
													
												);		
												
												
--PRODUCT SUPPORT		
CREATE TABLE erp_system.dbo.service_reports_type    (	id INT PRIMARY KEY,
														report_type VARCHAR(50),
														date_added DATETIME DEFAULT getdate()
													);
													
CREATE TABLE erp_system.dbo.service_reports				(	report_serial INT PRIMARY KEY,
															report_date DATETIME,

															report_id varchar(50),

															mission_serial INT REFERENCES erp_system.dbo.missions(mission_serial),

															release_serial INT,
															release_item_serial INT,

															mc_serial INT,
															mc_version INT,
															mc_prod_id INT,
															mc_prod_serial INT,

															sales_person INT,
															branch_serial INT,
															contact_person INT,

															employee_id INT REFERENCES erp_system.dbo.employees_info(employee_id),
															
															reason_of_report INT REFERENCES erp_system.dbo.missions_types(id),
															
															--UPS GENERAL REPORT
															ups_input_v1 INT,
															ups_input_v2 INT,
															ups_input_v3 INT,
															ups_input_a1 INT,
															ups_input_a2 INT,
															ups_input_a3 INT,
															ups_input_freq INT,
															ups_input_pe_n INT,
															
															ups_output_v1 INT,
															ups_output_v2 INT,
															ups_output_v3 INT,
															ups_output_a1 INT,
															ups_output_a2 INT,
															ups_output_a3 INT,
															ups_output_freq INT,
															ups_output_pe_n INT,
															
															ups_bypass_v1 INT,
															ups_bypass_v2 INT,
															ups_bypass_v3 INT,

															ups_room_temp BIT,
															ups_cleaning_ups BIT,
															ups_battery_temp BIT,
															ups_battery_pos BIT,
															ups_battery_neg BIT,

															--GENSET GENERAL REPORT
															genset_running_hours INT,
															genset_battery_condition_and_volt INT,
															genset_oil_pressure INT,
															genset_coolant_temp INT,
															genset_output_voltage INT,
															genset_output_frequency INT,
															genset_load INT,
															genset_filters_and_radiator_condition INT,
															
															genset_maint_air_filter NVARCHAR(150),
															genset_maint_oil_filter NVARCHAR(150),
															genset_maint_fuel_filter NVARCHAR(150),
															genset_maint_unit_cleaning NVARCHAR(150),
															genset_maint_unit_operation NVARCHAR(150),
															genset_maint_coolant NVARCHAR(150),
															genset_maint_other_repairs NVARCHAR(300),

															genset_manual BIT,
															genset_automatic BIT,
															genset_on_load BIT,

															--GENSET CHECKUP
															genset_engine_model NVARCHAR(300),
															genset_engine_sn NVARCHAR(300),
															genset_alternator_model NVARCHAR(300),
															genset_alternator_sn NVARCHAR(300),
															genset_checkup_battery NVARCHAR(300),
															genset_checkup_battery_charger NVARCHAR(300),
															genset_checkup_exhaust_flexible_joint NVARCHAR(300),
															genset_checkup_diesel_indicator_and_tank_door NVARCHAR(300),
															genset_checkup_other_defects NVARCHAR(300),
															
															genset_checkup_electrical_gas_pump BIT,
															genset_checkup_mechanical_gas_pump BIT,
															genset_checkup_exhaust_container BIT,
															genset_checkup_diesel_hoses BIT,
															genset_checkup_radiator_status BIT,
															genset_checkup_radiator_cap BIT,
															genset_checkup_catalogs BIT,
															
															--GENSET LOAD TEST
															genset_control_module NVARCHAR(300),

															genset_load_test_sudden_load_at_80 BIT,
															genset_load_test_oil_press BIT,
															genset_load_test_coolant_temp BIT,
															genset_load_test_emergency_stop BIT,

															genset_load_test_current_r_t5_l0 INT,
															genset_load_test_current_r_t5_l25 INT,
															genset_load_test_current_r_t5_l50 INT,
															genset_load_test_current_r_t5_l75 INT,
															genset_load_test_current_r_t15_l100 INT,
															genset_load_test_current_r_t15_l110 INT,
															
															genset_load_test_current_s_t5_l0 INT,
															genset_load_test_current_s_t5_l25 INT,
															genset_load_test_current_s_t5_l50 INT,
															genset_load_test_current_s_t5_l75 INT,
															genset_load_test_current_s_t15_l100 INT,
															genset_load_test_current_s_t15_l110 INT,
															
															genset_load_test_current_t_t5_l0 INT,
															genset_load_test_current_t_t5_l25 INT,
															genset_load_test_current_t_t5_l50 INT,
															genset_load_test_current_t_t5_l75 INT,
															genset_load_test_current_t_t15_l100 INT,
															genset_load_test_current_t_t15_l110 INT,
															
															genset_load_test_voltage_t5_l0 INT,
															genset_load_test_voltage_t5_l25 INT,
															genset_load_test_voltage_t5_l50 INT,
															genset_load_test_voltage_t5_l75 INT,
															genset_load_test_voltage_t15_l100 INT,
															genset_load_test_voltage_t15_l110 INT,
															
															genset_load_test_frequency_t5_l0 INT,
															genset_load_test_frequency_t5_l25 INT,
															genset_load_test_frequency_t5_l50 INT,
															genset_load_test_frequency_t5_l75 INT,
															genset_load_test_frequency_t15_l100 INT,
															genset_load_test_frequency_t15_l110 INT,
															
															genset_load_test_rpm_t5_l0 INT,
															genset_load_test_rpm_t5_l25 INT,
															genset_load_test_rpm_t5_l50 INT,
															genset_load_test_rpm_t5_l75 INT,
															genset_load_test_rpm_t15_l100 INT,
															genset_load_test_rpm_t15_l110 INT,
															
															genset_load_test_power_t5_l0 INT,
															genset_load_test_power_t5_l25 INT,
															genset_load_test_power_t5_l50 INT,
															genset_load_test_power_t5_l75 INT,
															genset_load_test_power_t15_l100 INT,
															genset_load_test_power_t15_l110 INT,
															
															genset_load_test_cos_t5_l0 INT,
															genset_load_test_cos_t5_l25 INT,
															genset_load_test_cos_t5_l50 INT,
															genset_load_test_cos_t5_l75 INT,
															genset_load_test_cos_t15_l100 INT,
															genset_load_test_cos_t15_l110 INT,

															equipment_status_before_service NVARCHAR(300),
															equipment_status_after_service NVARCHAR(300),

															report_notes NVARCHAR(1000),

															report_status INT REFERENCES erp_system.dbo.approvals_status(id),
															service_report_type INT REFERENCES erp_system.dbo.service_reports_type(id),

															added_by INT REFERENCES erp_system.dbo.employees_info(employee_id),
															
															date_added DATETIME DEFAULT getdate(),
															
															FOREIGN KEY (mc_serial, mc_version, mc_prod_id) REFERENCES erp_system.dbo.maintenance_contracts_products_info(contract_serial, contract_version, product_number),
															FOREIGN KEY (mc_serial, mc_version, mc_prod_id, mc_prod_serial) REFERENCES erp_system.dbo.maintenance_contracts_products_serials(contract_serial, contract_version, product_number, serial_id),
															
															FOREIGN KEY (sales_person, branch_serial, contact_person) REFERENCES contact_person_info(sales_person_id,branch_serial,contact_id),
															FOREIGN KEY (release_serial, release_item_serial) REFERENCES material_release_permit_items(release_serial, release_item_serial)
														);
CREATE TABLE erp_system.dbo.service_reports_approvals_rejections (   report_serial INT REFERENCES service_reports(report_serial),
																     approving_personnel INT REFERENCES employees_info,
																	 approval_serial INT,
																	 comments nvarchar(150),
																	 date_added DATETIME DEFAULT GETDATE(),
																	 PRIMARY KEY(report_serial, approving_personnel, approval_serial)
																 );

CREATE TABLE erp_system.dbo.inspection_service_reports	(	report_serial INT REFERENCES service_reports(report_serial),
															problem_serial INT,
															spare_part_serial INT,
															problem NVARCHAR(300),
															spare_parts_used NVARCHAR(300),
															quantity INT,
															alternative_spare_parts NVARCHAR(300),
															time_taken INT,
															time_taken_unit INT FOREIGN KEY REFERENCES time_units(id),
														    date_added DATETIME DEFAULT GETDATE(),
														    PRIMARY KEY(report_serial, problem_serial, spare_part_serial)
														);
--SAMEH
CREATE TABLE erp_system.dbo.incoming_quotations (	issue_date datetime,
													
													rfp_requestor_team int,
													rfp_serial int,
													rfp_version int,
													
													qoutation_serial int PRIMARY KEY,
													quotation_id varchar(50),
													
													procurement_officer int FOREIGN KEY REFERENCES employees_info(employee_id),
													
													supplier_address_serial int,
													supplier_contact int,
													
													
													price_currency int FOREIGN KEY REFERENCES currencies_type(id),
													price_value money,
													vat_condition int FOREIGN KEY REFERENCES vat_condition(id),
													
													percent_down_payment int,
													percent_on_delivery int,
													percent_payable int,
													payable_period int,
													payable_time_unit int FOREIGN KEY REFERENCES time_units(id),
													payable_time_condition int FOREIGN KEY REFERENCES condition_start_dates(id),
													
													delivery_period_min int,
													delivery_period_max int,
													delivery_time_unit int FOREIGN KEY REFERENCES time_units(id),
													delivery_time_condition int FOREIGN KEY REFERENCES condition_start_dates(id),
													
													delivery_point int FOREIGN KEY REFERENCES delivery_points(id),
													
													contract_type int FOREIGN KEY REFERENCES contracts_type(id),
													
													warranty_period int,
													warranty_time_unit int FOREIGN KEY REFERENCES time_units(id),
													warranty_period_condition int FOREIGN KEY REFERENCES condition_start_dates(id),
													
													validity_period int,
													validity_time_unit int FOREIGN KEY REFERENCES time_units(id),
													
													qoutation_status int FOREIGN KEY REFERENCES offers_status(id),
													
													notes nvarchar(150),
													
													added_by INT REFERENCES employees_info(employee_id),
													date_added DATETIME DEFAULT getdate(),
															
													FOREIGN KEY (rfp_requestor_team, rfp_serial, rfp_version) REFERENCES rfps(rfp_requestor_team, rfp_serial, rfp_version),
													FOREIGN KEY (supplier_address_serial, supplier_contact) REFERENCES supplier_contact_person_info(branch_serial, contact_id)
													);

--SAMEH
CREATE TABLE erp_system.dbo.incoming_quotations_items ( rfp_requestor_team int,
														rfp_serial int,
														rfp_version int,
														
														rfp_item_number int,
														
														qoutation_serial int REFERENCES incoming_quotations(qoutation_serial),
														quotation_item_number int,
														
														quantity int,
														measure_unit int FOREIGN KEY REFERENCES measure_units(id),
														price_value money,
														
														supplier_serial INT,
														brand_serial INT,
														
														added_by INT REFERENCES employees_info(employee_id),
														date_added DATETIME DEFAULT getdate(),
													
														FOREIGN KEY (supplier_serial, brand_serial) references supplier_brands(supplier_serial, brand_serial),
														FOREIGN KEY(rfp_requestor_team, rfp_serial, rfp_version, rfp_item_number) REFERENCES rfps_items(rfp_requestor_team, rfp_serial, rfp_version, item_no),
														PRIMARY KEY(qoutation_serial, quotation_item_number)
														);
														

														
CREATE TABLE erp_system.dbo.outgoing_purchase_orders	(	issue_date DATETIME DEFAULT getdate(),											

															order_serial INT PRIMARY KEY,
															order_id VARCHAR(50),
															
															procurement_officer int FOREIGN KEY REFERENCES employees_info(employee_id),
															
															supplier_address_serial INT,
															supplier_contact INT,
															
															price_value MONEY,
															price_currency INT REFERENCES currencies_type(id),
													        vat_condition int FOREIGN KEY REFERENCES vat_condition(id),
															
															percent_down_payment INT,
															percent_on_delivery INT,
															percent_payable int,
															payable_period int,
															payable_time_unit int FOREIGN KEY REFERENCES time_units(id),
															payable_time_condition int FOREIGN KEY REFERENCES condition_start_dates(id),
															
															isDrawing BIT,
															
															delivery_period_minimum INT,
															delivery_period_maximum INT,
															delivery_time_unit INT REFERENCES time_units(id),
															
															delivery_point INT REFERENCES delivery_points(id),
															contract_type INT REFERENCES contracts_type(id),
															
															warranty_period INT,
															warranty_time_unit INT REFERENCES time_units(id),
															warranty_time_condition int FOREIGN KEY REFERENCES condition_start_dates(id),
															
															delivered BIT,
															documents_received BIT,
															payment_done BIT,
															invoice_received BIT,
															
															order_notes VARCHAR(150),
															
															added_by INT REFERENCES employees_info(employee_id),
															date_added DATETIME DEFAULT getdate(),
															
															FOREIGN KEY (supplier_address_serial, supplier_contact) REFERENCES supplier_contact_person_info(branch_serial, contact_id),
														);														
														
CREATE TABLE erp_system.dbo.outgoing_purchase_orders_items		(	order_serial INT REFERENCES outgoing_purchase_orders(order_serial),
																	order_item_no INT,
																	
																	rfp_requestor_team INT,
																	rfp_serial INT,
																	rfp_version INT,
																	rfp_item_no INT,
																	
																	supplier_serial INT,
																	brand_serial INT,
																	
																	quantity int,
																	measure_unit int FOREIGN KEY REFERENCES measure_units(id),
																	price_value money,
														
																	added_by INT REFERENCES employees_info(employee_id),
																	date_added DATETIME DEFAULT getdate(),
																	
																	FOREIGN KEY (supplier_serial, brand_serial) references supplier_brands(supplier_serial, brand_serial),
																	FOREIGN KEY (rfp_requestor_team,rfp_serial,rfp_version,rfp_item_no) REFERENCES rfps_items(rfp_requestor_team,rfp_serial,rfp_version,item_no),
																	PRIMARY KEY (order_serial,order_item_no)
																);
