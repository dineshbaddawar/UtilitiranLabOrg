public class APIHelper {
    
    Public static String getAccessToken(){
        String endpoint = 'https://login.salesforce.com/services/oauth2/token';
        String clientId = '3MVG9pRzvMkjMb6kGZzZoCQDzSrtcKe9lMPP_Z66cb4Cy778UbvEWYnxjSnmcV.h2lCW9rsmOR8Flsm8rJnrA';
        String clientSecret = '48B40EF73F685911FAE84F5B23AF47B69F2EF4C45E911D7E70DCF9BEC137E7A2';
        String username = 'isha.raj@utilitarianlab.com';
        String password = '11IRs@1236Xim1SLIOc0CLmu1LUArYBbP';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
        request.setBody(reqbody);
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            String access_token = (String) results.get('access_token');
            System.debug('access_token=>'+access_token);
            return access_token;
        }
        return null;
    }
    Public static void getAccount(){
        String endpoint = 'https://utilitarianlabspvtltd3-dev-ed.my.salesforce.com/services/data/v54.0/query/?q=SELECT+name,id,AnnualRevenue,Type,website,Rating,AccountNumber+from+Account';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer '+getAccessToken());
        HttpResponse response = http.send(request);
        System.debug('response'+response.getBody());
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('results'+results);
            
        }
    }
    
    public static void updateRecords()
    {
        string endPoint = 'https://utilitarianlabsprivatelimit-dev-ed.my.salesforce.com/services/data/v54.0/sobjects/Contact/0035j00000NlfrJAAR';
        Http newHttp = new Http();
        HttpRequest newRequest = new HttpRequest();
        newRequest.setEndpoint(endPoint);
        newRequest.setMethod('PATCH');
        newRequest.setHeader('Authorization','Bearer '+getAccessToken());
        newRequest.setHeader('Content-Type', 'application/json');
        
        
        
        
        newRequest.setBody('{ "FirstName" : "Updated", "LastName" : "Contact", "Phone" : "5555555", "Email" : "updation@util.com" }');
        
        /*string reqBody = '{ "FirstName" : "Updated", "LastName" : "Contact", "Phone" : "5555555", "Email" : "updation@util.com" }' ;*/
        
        HttpResponse newResponse = newHttp.send(newRequest);
        System.debug('Response:: '+newResponse.getBody());
        
        if(newResponse.getStatusCode()==200)
        {
            Map<String, Object> getResult = (Map<String, Object>)JSON.deserializeUntyped(newResponse.getBody());
            System.debug('RESULTS:: ' + getResult);
        }
    }
    
    public static void deleteRecords(String idToDelete)
    {
        string endPoint = 'https://utilitarianlabsprivatelimit-dev-ed.my.salesforce.com/services/data/v54.0/sobjects/Contact/'+idToDelete;
        Http newHttp = new Http();
        HttpRequest newRequest = new HttpRequest();
        newRequest.setEndpoint(endPoint);
        newRequest.setMethod('DELETE');
        newRequest.setHeader('Authorization','Bearer '+getAccessToken());
        
        HttpResponse newResponse = newHttp.send(newRequest);
        System.debug('Response:: '+newResponse.getBody());
        
        if(newResponse.getStatusCode()==200)
        {
            Map<String, Object> getResult = (Map<String, Object>)JSON.deserializeUntyped(newResponse.getBody());
            System.debug('RESULTS:: ' + getResult);
        }
    }
    
}