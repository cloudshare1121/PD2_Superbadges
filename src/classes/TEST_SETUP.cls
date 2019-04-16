@isTest
public class TEST_SETUP {
    
    public static List<Opportunity> createOpportunity(Integer count, List<Account> accList){
        List<Opportunity> oppToInsertList = new List<Opportunity>();
        for(Integer i=0;i<count;i++){
        	oppToInsertList.add(new Opportunity(Name = 'Test Opportunity'+i,
                                               Type = 'New Project',
                                               closeDate = System.today()+30,
                                               Amount = 150000,
                                               StageName = 'Prospecting',
                                               AccountId = accList[i].Id));
        }
        
        insert oppToInsertList;
        return oppToInsertList;
        
    }
    
    public static List<Account> createAccount(Integer count){
        List<Account> accToInsertList = new List<Account>();
        for(Integer i=0;i<count;i++){
        	accToInsertList.add(new Account(Name = 'Test Account'+i));
        }
        
        insert accToInsertList;
        return accToInsertList;        
    }
    
    
    public static List<Project__c> createProject(Integer count, List<Opportunity> oppList){
        List<Project__c> projectToInsertList = new List<Project__c>();
        for(Integer i=0;i<count;i++){
        	projectToInsertList.add(new Project__c(Name = 'Test Project'+i,
                                                  Opportunity__c= oppList[i].Id,
                                                  ProjectRef__c = 'AB'+i));            
        }
        insert projectToInsertList;
        return projectToInsertList;            
    }
}