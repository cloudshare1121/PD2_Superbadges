trigger ProjectTrigger on Project__c (after update) {
    List<id> billableProjectIds = new List<id>();
    for(Project__c p:Trigger.New){
        if((Trigger.oldMap.get(p.Id)).Status__c<>'Billable' && p.status__c=='Billable'){
            billableProjectIds.add(p.Id);
        }
    }
    if(!BillingCalloutService.isRecursive){
        BillingCalloutService.callBillingService(billableProjectIds);
    }
}