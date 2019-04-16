@RestResource(urlMapping='/project/*')
global class ProjectRESTService {
    
    @HttpPost
    global static String postProjectData(String ProjectRef, String ProjectName, String OpportunityId, Date StartDate, Date EndDate, Double Amount, String status){        
		String result;                
        Project__c project = new Project__c(ProjectRef__c=ProjectRef,
                                            Name = ProjectName,
                                            Opportunity__c = OpportunityId,
                                            Start_Date__c = startDate,
                                            End_Date__c = endDate,
                                            Billable_Amount__c = Amount,
                                            Status__c = status);
        List<Project__c> proj = [select id, name, opportunity__c, start_date__c, end_date__c, billable_Amount__c, status__c from Project__c 
                           where Name =:projectName limit 1];
        /*if(!proj.isEmpty()){
            project.Id = proj[0].Id;
        }*/
        Savepoint sp =  Database.setSavepoint(); 
        try{            
            upsert project;
                       
            Opportunity opp = new Opportunity(id=OpportunityId);
            opp.DeliveryInstallationStatus__c = 'In Progress';            
            update opp;
            
            result =  'OK';
            
        }
        catch(DmlException e){
            result = 'error';
            Database.rollback(sp);
        }   
        return result;
    }
}