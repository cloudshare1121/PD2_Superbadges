public class BillingCalloutServiceMockFailure implements WebserviceMock{
    
    public void doInvoke(Object stub, Object request, Map<String, Object> response, String endpoint, String soapAction, String requestName, String response_Ns, String responseName, String responseType){
		BillingServiceProxy.billProjectResponse_element response_x = new BillingServiceProxy.billProjectResponse_element();
        response_x.status = 'NOK';
        response.put('response_x',response_x);
    }
   
}