global with sharing class ConnectToOtherOrg {
    
    public static String GetAccessToken(){
        String clientId ='3MVG9pRzvMkjMb6nfg4PCd8R8nwSYULuCNwGyP5.saiPez9bL.hehIzBKFRnp314n4JMgJpM5_B0AegS5xmsz';
        String clientSecret = 'C059717D19DAB550F2746F94CEAC7C70FA0FB8BF5D13FC39F206F654CC4CB77E';
        String username = 'anjali@utilitarianlab.com';
        String password = 'AnjuUtil7678';

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        request.setMethod('POST');

        String requestBody = 'grant_type=password'+'&client_id=' + clientId + '&client_secret='+ clientSecret+'&username='+username +
        '&password='+ password;

        request.setBody(requestBody);

        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200 && response.getBody() !=null){
            Map<String,Object> getResult = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            String AccessToken = (String) getResult.get('access_token');
            System.debug('ACCESS Token--->'+AccessToken);
            return AccessToken;
        }
        return null;
    }

    
    global static void GetRecords(){
        String EndPoint = 'https://utilitarianlabspvtltd2-dev-ed.my.salesforce.com//services/data/v54.0/query/?q=SELECT+LastName,Id+from+Contact';

        Http http = new Http();
        HttpRequest Request = new HttpRequest();
        Request.setEndpoint(EndPoint);
        Request.setMethod('GET');
        Request.setHeader('Authorization','Bearer '+GetAccessToken());

        HttpResponse newResponse = http.send(Request);
        System.debug('Response-->'+newResponse.getBody()+newResponse.getStatus());

        if(newResponse.getStatusCode() == 200){
            Map<String,Object> getResult = (Map<String,Object>)JSON.deserializeUntyped(newResponse.getBody());
            System.debug('Result-->'+getResult);
        }
    } 

    public static void UpdateRecords(){
        String endpoint = 'https://utilitarianlabspvtltd2-dev-ed.my.salesforce.com/services/data/v54.0/sobjects/Contact/0035j00000Nob6SAAR';

        Http http = new Http();
        HttpRequest newRequest = new HttpRequest();
        newRequest.setEndpoint(endpoint);
        newRequest.setMethod('PATCH');
        newRequest.setHeader('Authorization','Bearer '+GetAccessToken());
        newRequest.setHeader('Content-Type', 'application/json');
        newRequest.setBody('{"FirstName":"Bhaskar","LastName":"Kumar","Phone":"7588229058","Email":"dbaddawar@gmail.com"}');
      //  String reqBody='{"FirstName":"Aakash","LastName":"Jain","Phone":"7588229058","Email":"aakashjain@gmail.com"}';

        HttpResponse response = http.send(newRequest);
        System.debug('Response-->'+response.getBody()+'Response code--->'+response.getStatusCode());

        if(response.getStatusCode() == 200){
            Map<String,Object> result = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            System.debug('Result-->'+result);
        }
    }

    public static void DeleteRecords(String idToDelete){
        String endPoint = 'https://utilitarianlabspvtltd2-dev-ed.my.salesforce.com/services/data/v54.0/sobjects/Contact/0035j00000NoMOmAAN';
        Http http = new Http();
        HttpRequest Request = new HttpRequest();
        Request.setEndpoint(endpoint);
        Request.setMethod('DELETE');
        Request.setHeader('Authorization','Bearer '+GetAccessToken());

        HttpResponse response = http.send(Request);
        System.debug('Response-->'+response.getBody());

        if(response.getStatusCode() == 200){
            Map<String,Object> result = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            System.debug('Result-->'+result);
        }
    }
}