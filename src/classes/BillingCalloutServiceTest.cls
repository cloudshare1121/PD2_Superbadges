@isTest
private class BillingCalloutServiceTest {
  @TestSetup
    private static void setup(){
        List<Account> accList = TEST_SETUP.createAccount(1);
        List<Opportunity> oppList = TEST_SETUP.createOpportunity(1, accList);
        List<Project__c> projectList = TEST_SETUP.createProject(1, oppList);
        ServiceCredentials__c sc = new ServiceCredentials__c();
        sc.Name = 'BillingServiceCredential';
        sc.Username__c = '123';
        sc.Password__c = '123';
        insert sc;
        
    }
  
    @isTest
    private static void sendForInvoiceCreation(){
        Test.setMock(WebServiceMock.class, new BillingCalloutServiceMock());
        List<Project__c> projectList = [select id from Project__c limit 1];
        Test.startTest();        
        projectList[0].status__c = 'Billable';        
        update projectList;
        Test.stopTest();
        
        
        System.assertEquals('Billed', [select status__c from Project__c where id=:projectList[0].Id limit 1].Status__c);
    }
    
    
    @isTest
    private static void sendForInvoiceCreationFailed(){
        Test.setMock(WebServiceMock.class, new BillingCalloutServiceMockFailure());
        List<Project__c> projectList = [select id from Project__c limit 1];
        Test.startTest();        
        projectList[0].status__c = 'Billable';        
        update projectList;
        Test.stopTest();
        
        
        System.assertNotEquals('Billable', [select status__c from Project__c where id=:projectList[0].Id limit 1].Status__c);
    }
}