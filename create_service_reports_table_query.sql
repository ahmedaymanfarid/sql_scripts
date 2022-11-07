

CREATE TABLE erp_system.dbo.service_reports				(	report_serial INT PRIMARY KEY,
															report_date DATETIME,

															report_id varchar(50),

															work_order_serial INT,
															work_order_product_number INT,
															work_order_model_serial_id INT,

															maintenance_contract_serial INT,
															maintenance_contract_version INT,
															maintenance_contract_product_number INT,
															maintenance_contract_model_serial_id INT,

															branch_serial INT REFERENCES erp_system.dbo.company_address(address_serial),
															employee_id INT REFERENCES erp_system.dbo.employees_info(employee_id),
															
															reason_of_report INT REFERENCES erp_system.dbo.missions_types(id),
															
															input_v1 INT,
															input_v2 INT,
															input_v3 INT,
															input_a1 INT,
															input_a2 INT,
															input_a3 INT,
															input_freq INT,
															input_pe_n INT,
															
															output_v1 INT,
															output_v2 INT,
															output_v3 INT,
															output_a1 INT,
															output_a2 INT,
															output_a3 INT,
															output_freq INT,
															output_pe_n INT,
															
															bypass_v1 INT,
															bypass_v2 INT,
															bypass_v3 INT,

															room_temp BIT,
															cleaning_ups BIT,
															battery_temp BIT,
															battery_pos BIT,
															battery_neg BIT,

															equipment_status_before_service NVARCHAR(300),
															equipment_status_after_service NVARCHAR(300),

															report_notes NVARCHAR(1000),

															added_by INT REFERENCES erp_system.dbo.employees_info(employee_id),
															report_status INT REFERENCES erp_system.dbo.approvals_status(id),
															date_added DATETIME DEFAULT getdate(),

															FOREIGN KEY (maintenance_contract_serial, maintenance_contract_version, maintenance_contract_product_number, maintenance_contract_model_serial_id) REFERENCES erp_system.dbo.maintenance_contracts_products_serials(contract_serial, contract_version, product_number, serial_id),
															
															FOREIGN KEY (work_order_serial, work_order_product_number, work_order_model_serial_id) REFERENCES erp_system.dbo.work_orders_products_serials(order_serial, product_number, serial_id)
														);
														