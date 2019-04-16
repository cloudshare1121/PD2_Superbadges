public class BoatSearchFormController {
     
    @AuraEnabled
    public static List<BoatType__c> GetBoatTypes(){
        return [select id, name from BoatType__c];
    }        
        

}