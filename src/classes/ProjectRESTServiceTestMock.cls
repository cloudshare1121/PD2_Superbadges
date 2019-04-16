public class ProjectRESTServiceTestMock implements HttpCalloutMock{
    public HttpResponse respond(HttpRequest req){
        HttpResponse res = new HttpResponse();
        res.setBody('Created');
        res.setStatusCode(201);        
        return res;
    }
    
}