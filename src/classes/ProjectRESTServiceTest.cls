@isTest
private class ProjectRESTServiceTest {
    
    @TestSetup
    private static void setup(){
        List<Account> accList = TEST_SETUP.createAccount(1);
        List<Opportunity> oppList = TEST_SETUP.createOpportunity(1, accList);                
    }
  
    @isTest
    private static void postProjectDataTest(){
        String result;
       List<Opportunity> oppList = [select id, DeliveryInstallationStatus__c from Opportunity limit 1];               
       Test.startTest();
       result = ProjectRESTService.postProjectData('abc', 'ANC',oppList[0].id , Date.valueOf('2018-09-20'), Date.valueOf('2019-08-19'), 500000, 'Running');
       Test.stopTest();
       System.assertEquals('In progress', [select DeliveryInstallationStatus__c from Opportunity where id =:oppList[0].id].DeliveryInstallationStatus__c);
       System.assertEquals('OK', result);
    }
    
    @isTest
    private static void postProjectDataTestFailed(){
        String result;
       List<Opportunity> oppList = [select id, DeliveryInstallationStatus__c from Opportunity limit 1];               
       Test.startTest();
       result = ProjectRESTService.postProjectData('', '',null , Date.valueOf('2018-09-20'), Date.valueOf('2019-08-19'), 500000, 'Running');       
       Test.stopTest();       
       System.assertEquals('error', result);
    }
}