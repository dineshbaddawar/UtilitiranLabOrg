public class ConnectToOtherOrg_1 {
    
    public static string getAccessToken(){
        string clientId= '3MVG9pRzvMkjMb6kGZzZoCQDzSrtcKe9lMPP_Z66cb4Cy778UbvEWYnxjSnmcV.h2lCW9rsmOR8Flsm8rJnrA';
        string clientSecret = '48B40EF73F685911FAE84F5B23AF47B69F2EF4C45E911D7E70DCF9BEC137E7A2';
        string username ='isha.raj@utilitarianlab.com';
        string password = '11IRs@123';
        
        
        Http ATHttp = new Http();
        HttpRequest ATRequest = new HttpRequest();
        ATRequest.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        ATRequest.setMethod('POST');
        string reqBody = 'grant_type=password' +
            '&client_id=' + ClientId +
            '&client_secret=' + ClientSecret +
            '&username=' + username +
            '&password=' + password ;
        
        ATRequest.setBody(reqBody);
        HttpResponse ATResponse = ATHttp.send(ATRequest);
        
        if(ATResponse.getStatusCode()==200){
            Map<String, Object> getResult = (Map<String, Object>)JSON.deserializeUntyped(ATResponse.getBody());
            String accessToken = (string) getResult.get('access_token');
            System.debug('ACCESS TOKEN:: ' + accessToken);
            return accessToken;
        }
        return null;
    }
    
    public Static Void getRecords(){
        String endPoint = 'https://utilitarianlabspvtltd3-dev-ed.my.salesforce.com/services/data/v54.0/query/?q=select+name+from+account';
        Http newHttp = new Http();
        HttpRequest newRequest = new HttpRequest();
        newRequest.setEndpoint(endPoint);
        newRequest.setMethod('GET');
        newRequest.setHeader('Authorization','Bearer '+getAccessToken());
        
        HttpResponse newResponse = newHttp.send(newRequest);
        System.debug('Response:: '+newResponse.getBody()+newResponse.getStatusCode());
        
        if(newResponse.getStatusCode()==200){
            Map<String, Object> getResult = (Map<String, Object>)JSON.deserializeUntyped(newResponse.getBody());
            System.debug('RESULTS:: ' + getResult);
        
        }
    }
    
    public Static void updateRecords(){
        String endPoint ='https://utilitarianlabspvtltd3-dev-ed.my.salesforce.com/services/data/v54.0/sobjects/account/0015j00000dtZ4fAAE';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('PATCH');
        request.setHeader('Authorization','Bearer '+getAccessToken());
        request.setHeader('Content-Type', 'application/json');
        String reqBody = '{"Name":"Tilak Varma","Phone":"123456789"}';
        request.setBody(reqBody);
        
        HttpResponse response = http.send(request);
        System.debug('Response--->'+response.getBody()+'Response code--'+response.getStatusCode());
        if(response.getStatusCode() == 200){
            Map<String,Object> result = (Map<String,object>)JSON.deserializeUntyped(response.getBody());
            System.debug('Result--->'+result);
        }
    }
}