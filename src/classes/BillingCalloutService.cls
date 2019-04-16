public class BillingCalloutService {
    
    public static boolean isRecursive = false;
    
    public static void callBillingService(List<Id> projectIdList){  
        makeCalloutToBillingService(projectIdList);
    }
    
    @future (callout=true)    
    public static void makeCalloutToBillingService(List<Id> projectIdList){  
        isRecursive = true;
        Map<String,String> mpResult = new Map<String,String>();
        List<Project__c> projectList = [select id, ProjectRef__c, Opportunity__r.Amount, Status__c from Project__c where id in :projectIdList];
        for(Project__c project: projectList){
            BillingServiceProxy.Project pr = new BillingServiceProxy.Project();
                pr.username = ServiceCredentials__c.getValues('BillingServiceCredential').Username__c;
            pr.password = ServiceCredentials__c.getValues('BillingServiceCredential').Password__c;
            pr.projectid = project.projectRef__c;
            pr.billAmount = project.Opportunity__r.amount;
            try
            {
                BillingServiceProxy.InvoicesPortSoap11 invoice = new BillingServiceProxy.InvoicesPortSoap11();
                String status = invoice.billProject(pr);   
                mpResult.put(project.Id,status);
                project.Status__c = 'Billed';
                update project;
            }
            catch(CalloutException e){
                System.debug('Exception when making SOAP callout');	
            }
        }        
    }        
}