/**
 * Createds on 26/03/2019.
 */

public with sharing class BoatReviews {

    @AuraEnabled
    public static List<BoatReview__c> getAll(Id boatId){
        system.Debug('boatId: '+boatId);
        return [select Id, Name, Comment__c, Rating__c, LastModifiedDate, CreatedDate, CreatedBy.Name, CreatedBy.SmallPhotoUrl, CreatedBy.CompanyName
            from BoatReview__c where Boat__c=:boatId];
    }
}