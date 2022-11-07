--DROP NEW UPDATED RFQS ASSIGNEES
delete from dbo.updated_rfqs_assignees where sales_person > 0

--DROP NEW SALES WORK ORDER 
delete from dbo.work_orders where sales_person > 0

--DROP NEW SALES WORK OFFER 
delete from dbo.unsucessful_work_offers where offer_proposer > 0
delete from dbo.work_offers_rfqs where offer_proposer > 0
delete from dbo.work_offers_products_info where offer_proposer > 0
delete from dbo.work_offers where offer_proposer > 0

--DROP NEW RFQS
delete from dbo.unsuccessful_rfqs where sales_person > 0
delete from dbo.rfqs where rfqs.sales_person > 0

--DROP NEW SUCCESSFUL VISIT PLANS
delete from dbo.successful_visit_plans where successful_visit_plans.sales_person > 0

--DROP NEW VISIT PLAN
delete from dbo.visit_plans where visit_plans.sales_person > 0

--DROP NEW CONTACT PHONE ENTRY
delete from crm.dbo.contact_person_mobile where contact_person_mobile.sales_person_id > 0;

--DROP NEW CONTACT PERSONAL EMAIL ENTRY
delete from crm.dbo.contact_person_personal_emails where branch_serial > 0;

--DROP NEW CONTACT COMMENTS
delete from crm.dbo.contact_person_comment where contact_person_comment.sales_person_id > 0;

--DROP NEW CONTACT ENTRY
delete from dbo.contact_person_info where contact_person_info.branch_serial > 0;

--DROP NEW COMPANY ENTRY
delete from dbo.company_telephone where branch_serial >0
delete from dbo.company_fax where branch_serial > 0
delete from dbo.company_address where address_serial > 0
delete from dbo.company_field_of_work where company_serial > 0
delete from dbo.company_name where company_serial > 0
