public class OpenWeatherMap {
    public String city{get;set;}
    public String temp{get;set;}
    public String pressure{get;set;}
    public String humidity{get;set;}
    public String temp_min{get;set;}
    public String temp_max{get;set;}
    public String main{get;set;} 
    public String visibility{get;set;}
    
    public OpenWeatherMap(ApexPages.StandardController stdController){
        
        // Getting Current Account Record
        Account acc=(Account)stdController.getRecord();
        acc = [SELECT Id,ShippingCity FROM Account WHERE Id = '0015j00000cWkiT'];
        
        String accCity = acc.ShippingCity; 
        String apiKey = '7922a6f34bd3c614da44adc633a1db82';
        
        // Creating Rest EndPoint
        String requestEndPoint = 'http://api.openweathermap.org/data/2.5/weather';
        requestEndPoint +='?q='+accCity;
        requestEndPoint +='&units=metric';
        requestEndPoint +='&APPID='+apiKey;
        
        // Create Http class For Sending & Receving The Response.
        Http http = new Http();
        // for Sending Request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(requestEndPoint);
        request.setMethod('GET');
        // for Receving Response
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200){
            // for Storing Response , we have to deserialize JSON String into Collection of Primitive data type.
            Map<String,Object> results = (Map<String,Object>)JSON.deserializeUntyped(response.getBody()); // Here we are use Type Casting
         
            System.debug('body output---->'+response.getBody());
            city = String.valueOf(results.get('name'));
            Map<String,Object> mainresults = (Map<String,Object>)(results.get('main'));

            visibility = String.valueOf(results.get('visibility'));
            System.debug('the dew point value----->'+response.getBody());
            System.debug('the visibility value----->'+results.get('visibility'));
            temp = String.valueOf(mainresults.get('temp'));
            pressure = String.valueOf(mainresults.get('pressure'));
            humidity = String.valueOf(mainresults.get('humidity'));
            temp_min = String.valueOf(mainresults.get('temp_min'));
            temp_max = String.valueOf(mainresults.get('temp_max'));
        }
    }
}