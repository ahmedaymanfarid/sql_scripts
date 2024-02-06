DECLARE @old_team_id INT = 10603;
DECLARE @new_team_id INT = 1060102;

--BE AWARE OF MERGING NEW AND OLD TEAM MEMBERS IF NEW EMPLOYEES WHERE MANUALLY ADDED TO THE OLD TEAM ID
UPDATE erp_system.dbo.employees_info
SET employee_team = @new_team_id
WHERE employee_team = @old_team_id

INSERT INTO erp_system.dbo.rfps
SELECT [issue_date]
      ,@new_team_id
      ,[rfp_serial]
      ,[rfp_version]
      ,[assigned_officer]
      ,[order_serial]
      ,[maintenance_contract]
      ,[project_serial]
      ,[rfp_id]
      ,[rfp_status]
      ,[rfp_notes]
      ,[deadline_date]
      ,[requestor_id]
      ,[work_form]
      ,[maintenance_contract_version]
      ,[rfp_year_serial]
  FROM [erp_system].[dbo].[rfps]
  WHERE rfps.rfp_requestor_team = @old_team_id


  INSERT INTO erp_system.dbo.rfps_items
SELECT @new_team_id
      ,[rfp_serial]
      ,[rfp_version]
      ,[item_no]
      ,[item_description]
      ,[item_quantity]
      ,[measure_unit]
      ,[item_notes]
      ,[item_status]
      ,[date_added]
  FROM [erp_system].[dbo].[rfps_items]
  WHERE rfps_items.rfp_requestor_team = @old_team_id



  UPDATE erp_system.dbo.rfps_item_brands
SET rfps_item_brands.rfp_requestor_team = @new_team_id
WHERE rfps_item_brands.rfp_requestor_team = @old_team_id


  UPDATE erp_system.dbo.missions
SET missions.rfp_requestor = @new_team_id
WHERE missions.rfp_requestor = @old_team_id


UPDATE erp_system.dbo.rfps_approvers
SET rfps_approvers.team_id = @new_team_id
WHERE rfps_approvers.team_id = @old_team_id

UPDATE erp_system.dbo.rfps_requestors
SET rfps_requestors.team_id = @new_team_id
WHERE rfps_requestors.team_id = @old_team_id


DELETE FROM erp_system.dbo.rfps_items
WHERE rfps_items.rfp_requestor_team = @old_team_id

UPDATE erp_system.dbo.rfps_items
SET rfp_requestor_team = @new_team_id
WHERE rfp_requestor_team = @old_team_id

DELETE FROM erp_system.dbo.rfps
WHERE rfps.rfp_requestor_team = @old_team_id

UPDATE erp_system.dbo.missions_allowed_types
SET missions_allowed_types.team_id = @new_team_id
WHERE missions_allowed_types.team_id = @old_team_id

DELETE FROM erp_system.dbo.teams_type
WHERE teams_type.id = @old_team_id