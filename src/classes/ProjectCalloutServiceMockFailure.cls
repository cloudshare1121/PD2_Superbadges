public class ProjectCalloutServiceMockFailure implements HttpCalloutMock{
    public HttpResponse respond(HttpRequest req){
        HttpResponse res = new HttpResponse();
        res.setBody('Failed');
        res.setStatusCode(400);        
        return res;
    }
    
}