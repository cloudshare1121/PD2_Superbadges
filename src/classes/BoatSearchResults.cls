/**
 * Created on 20/03/2019.
 */

public with sharing class BoatSearchResults {

    @AuraEnabled
    public static List<Boat__c> getBoats(String boatTypeId){
        if(boatTypeId<>null && boatTypeId<>'') {
            return [select id, name, Picture__c from Boat__c where BoatType__c = :boatTypeId];
        }
        else{
            return [select id, name, Picture__c from Boat__c];
        }
    }
}