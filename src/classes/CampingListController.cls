public class CampingListController {
    
    @AuraEnabled
    public static List<Camping_Item__c> getItems(){
        return [select id, Packed__c, Price__c, Quantity__c, name from Camping_Item__c];
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c campingListItem){
     	upsert campingListItem;
        return campingListItem;
    }

}