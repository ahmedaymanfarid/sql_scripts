DECLARE @contract_serial INT = 9898;

DELETE erp_system.dbo.inspection_service_reports
FROM erp_system.dbo.inspection_service_reports
INNER JOIN erp_system.dbo.service_reports
ON inspection_service_reports.report_serial = service_reports.report_serial
INNER JOIN erp_system.dbo.material_release_permit_items
ON service_reports.release_serial = material_release_permit_items.release_serial
AND service_reports.release_item_serial = material_release_permit_items.release_item_serial
INNER JOIN erp_system.dbo.material_entry_permit_items
ON material_release_permit_items.entry_permit_serial = material_entry_permit_items.entry_permit_serial
AND material_release_permit_items.entry_permit_item_serial = material_entry_permit_items.entry_permit_item_serial
INNER JOIN erp_system.dbo.rfps_items_mapping
ON material_entry_permit_items.rfp_serial = rfps_items_mapping.rfp_serial
AND material_entry_permit_items.rfp_version = rfps_items_mapping.rfp_version
AND material_entry_permit_items.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
INNER JOIN erp_system.dbo.rfps
ON rfps.rfp_serial = rfps_items_mapping.rfp_serial
AND rfps.rfp_version = rfps_items_mapping.rfp_version
AND rfps.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
WHERE rfps.maintenance_contract = @contract_serial

DELETE erp_system.dbo.service_reports_approvals_rejections
FROM erp_system.dbo.service_reports_approvals_rejections
INNER JOIN erp_system.dbo.service_reports
ON service_reports_approvals_rejections.report_serial = service_reports.report_serial
INNER JOIN erp_system.dbo.material_release_permit_items
ON service_reports.release_serial = material_release_permit_items.release_serial
AND service_reports.release_item_serial = material_release_permit_items.release_item_serial
INNER JOIN erp_system.dbo.material_entry_permit_items
ON material_release_permit_items.entry_permit_serial = material_entry_permit_items.entry_permit_serial
AND material_release_permit_items.entry_permit_item_serial = material_entry_permit_items.entry_permit_item_serial
INNER JOIN erp_system.dbo.rfps_items_mapping
ON material_entry_permit_items.rfp_serial = rfps_items_mapping.rfp_serial
AND material_entry_permit_items.rfp_version = rfps_items_mapping.rfp_version
AND material_entry_permit_items.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
INNER JOIN erp_system.dbo.rfps
ON rfps.rfp_serial = rfps_items_mapping.rfp_serial
AND rfps.rfp_version = rfps_items_mapping.rfp_version
AND rfps.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
WHERE rfps.maintenance_contract = @contract_serial

DELETE erp_system.dbo.service_reports_submitters
FROM erp_system.dbo.service_reports_submitters
INNER JOIN erp_system.dbo.service_reports
ON service_reports_submitters.report_serial = service_reports.report_serial
INNER JOIN erp_system.dbo.material_release_permit_items
ON service_reports.release_serial = material_release_permit_items.release_serial
AND service_reports.release_item_serial = material_release_permit_items.release_item_serial
INNER JOIN erp_system.dbo.material_entry_permit_items
ON material_release_permit_items.entry_permit_serial = material_entry_permit_items.entry_permit_serial
AND material_release_permit_items.entry_permit_item_serial = material_entry_permit_items.entry_permit_item_serial
INNER JOIN erp_system.dbo.rfps_items_mapping
ON material_entry_permit_items.rfp_serial = rfps_items_mapping.rfp_serial
AND material_entry_permit_items.rfp_version = rfps_items_mapping.rfp_version
AND material_entry_permit_items.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
INNER JOIN erp_system.dbo.rfps
ON rfps.rfp_serial = rfps_items_mapping.rfp_serial
AND rfps.rfp_version = rfps_items_mapping.rfp_version
AND rfps.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
WHERE rfps.maintenance_contract = @contract_serial


DELETE erp_system.dbo.material_release_permit_items
FROM erp_system.dbo.material_release_permit_items
INNER JOIN erp_system.dbo.material_entry_permit_items
ON material_release_permit_items.entry_permit_serial = material_entry_permit_items.entry_permit_serial
AND material_release_permit_items.entry_permit_item_serial = material_entry_permit_items.entry_permit_item_serial
INNER JOIN erp_system.dbo.rfps_items_mapping
ON material_entry_permit_items.rfp_serial = rfps_items_mapping.rfp_serial
AND material_entry_permit_items.rfp_version = rfps_items_mapping.rfp_version
AND material_entry_permit_items.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
INNER JOIN erp_system.dbo.rfps
ON rfps.rfp_serial = rfps_items_mapping.rfp_serial
AND rfps.rfp_version = rfps_items_mapping.rfp_version
AND rfps.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
WHERE rfps.maintenance_contract = @contract_serial


DELETE erp_system.dbo.material_entry_permit_items
FROM erp_system.dbo.material_entry_permit_items
INNER JOIN erp_system.dbo.rfps_items_mapping
ON material_entry_permit_items.rfp_serial = rfps_items_mapping.rfp_serial
AND material_entry_permit_items.rfp_version = rfps_items_mapping.rfp_version
AND material_entry_permit_items.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
INNER JOIN erp_system.dbo.rfps
ON rfps.rfp_serial = rfps_items_mapping.rfp_serial
AND rfps.rfp_version = rfps_items_mapping.rfp_version
AND rfps.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
WHERE rfps.maintenance_contract = @contract_serial

DELETE erp_system.dbo.incoming_quotations_items
FROM erp_system.dbo.incoming_quotations_items
INNER JOIN erp_system.dbo.rfps_items_mapping
ON incoming_quotations_items.rfp_serial = rfps_items_mapping.rfp_serial
AND incoming_quotations_items.rfp_version = rfps_items_mapping.rfp_version
AND incoming_quotations_items.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
INNER JOIN erp_system.dbo.rfps
ON rfps.rfp_serial = rfps_items_mapping.rfp_serial
AND rfps.rfp_version = rfps_items_mapping.rfp_version
AND rfps.rfp_requestor_team = rfps_items_mapping.rfp_requestor_team
WHERE rfps.maintenance_contract = @contract_serial

DELETE erp_system.dbo.rfps_item_brands
FROM erp_system.dbo.rfps_item_brands
INNER JOIN erp_system.dbo.rfps
ON rfps.rfp_serial = rfps.rfp_serial
AND rfps.rfp_version = rfps.rfp_version
AND rfps.rfp_requestor_team = rfps.rfp_requestor_team
WHERE rfps.maintenance_contract = @contract_serial

DELETE erp_system.dbo.missions_approvals_rejections
FROM erp_system.dbo.missions_approvals_rejections
INNER JOIN erp_system.dbo.missions
ON missions.mission_serial = missions_approvals_rejections.mission_serial
WHERE missions.maintenance_contract = @contract_serial

DELETE FROM erp_system.dbo.missions
WHERE missions.maintenance_contract = @contract_serial

DELETE FROM erp_system.dbo.maintenance_contracts_offers
WHERE maintenance_contracts_offers.contract_serial = @contract_serial

DELETE FROM erp_system.dbo.maintenance_contracts_products_serials
WHERE maintenance_contracts_products_serials.contract_serial = @contract_serial

DELETE FROM erp_system.dbo.maintenance_contracts_products_info
WHERE maintenance_contracts_products_info.contract_serial = @contract_serial

DELETE FROM erp_system.dbo.maintenance_contracts_projects_locations
WHERE maintenance_contracts_projects_locations.contract_serial = @contract_serial


DELETE FROM erp_system.dbo.maintenance_contracts
WHERE maintenance_contracts.contract_serial = @contract_serial
