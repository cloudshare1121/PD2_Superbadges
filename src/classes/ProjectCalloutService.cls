public class ProjectCalloutService {
    
    @InvocableMethod
    public static void postOpportunityToPMS(List<Id> oppIds){        
        List<Opportunity> opp = [select id, name, account.name, closedate, amount from Opportunity where id in:oppIds];
        OpportunityRequest req = new OpportunityRequest();
        req.opportunityId = opp[0].id;
        req.opportunityName = opp[0].Name;
        req.accountName = opp[0].Account.Name;
        req.closeDate = opp[0].CloseDate;
        req.amount = opp[0].Amount;         
        String reqBody = JSON.serialize(req);
        QueueablePMSCall qPms = new QueueablePMSCall(reqBody,opp[0].Id);
        Id jobid = System.enqueueJob(qPms);
        
    }
    
    public class QueueablePMSCall implements Queueable, Database.AllowsCallouts{
        private String requestBody {get;set;}
        private String oppId {get;set;}
        
        public QueueablePMSCall(String reqBody, Id opporId){
            this.requestBody = reqBody;
            this.oppId = opporId;
        }
        
        public void execute(QueueableContext context){
            Opportunity opp = new Opportunity(Id=oppId);
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:ProjectService');
            request.setMethod('POST');  
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            String tokenString = ServiceTokens__c.getValues('ProjectServiceToken').Token__c;
            request.setHeader('token', tokenString);                                  
            request.setBody(requestBody);    
            try{
                HttpResponse res = http.send(request);
								
                if(res.getStatusCode() == 201){
                    opp.StageName = 'Submitted Project';
                    system.debug('response body: '+res.getBody());
                }
                else{
                    opp.StageName = 'Resubmit Project';
                }
            }
            catch(CalloutException e){
                System.debug('Callout Exception: '+e.getMessage());
                opp.StageName = 'Resubmit Project';
            }
            
            update opp;
        }
    }
    
    public class OpportunityRequest{
        public String opportunityId {get;set;}
        public String opportunityName {get;set;}
        public String accountName {get;set;}
        public Date closeDate {get;set;}
        public Double amount {get;set;}
    }
    
}