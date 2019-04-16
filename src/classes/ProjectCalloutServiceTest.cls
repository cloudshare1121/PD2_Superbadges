@isTest
private class ProjectCalloutServiceTest {
    
    @TestSetup
    private static void setup(){
        List<Account> accList = TEST_SETUP.createAccount(1);
        List<Opportunity> oppList = TEST_SETUP.createOpportunity(1, accList);
        ServiceTokens__c sc = new ServiceTokens__c();
        sc.Name = 'ProjectServiceToken';
        sc.Token__c = '123';
        insert sc;
        
    }
  
    @isTest
    private static void postOpportunityToPMSTest(){
        Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMock());
        List<Opportunity> oppList = [select id, stageName from Opportunity limit 1];
        Test.startTest();        
        oppList[0].stageName = 'Closed Won';        
        update oppList;
        Test.stopTest();
        
        System.assertEquals('Submitted Project', [select stageName from Opportunity where id=:oppList[0].Id limit 1].stageName);
    }
    
    @isTest
    private static void postOpportunityToPMSTestFailure(){
        Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMockFailure());
        List<Opportunity> oppList = [select id, stageName from Opportunity limit 1];
        Test.startTest();        
        oppList[0].stageName = 'Closed Won';        
        update oppList;
        Test.stopTest();
        
        System.assertEquals('Resubmit Project', [select stageName from Opportunity where id=:oppList[0].Id limit 1].stageName);
    }
}