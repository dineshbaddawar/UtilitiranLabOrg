public with sharing class ApexCallouts {
    
    public static void getCallout(){
        Http http = new Http();
        HttpRequest Request = new HttpRequest();
        Request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        Request.setMethod('GET');
        HttpResponse Response = http.send(Request);

        // if the request is successful, parse the JSON response.
        if(Response.getStatusCode()==200){
            // Deserialize the JSON string into collection of primitive data types.
            // Method to deserialize JSON String
          //  Map<String,Object> Results = (Map<String,Object>) JSON.deserializeUntyped(Response.getBody());

           // Method 2
           ApexCalloutsJSONWrapper.Animals animalPayLoad = (ApexCalloutsJSONWrapper.Animals)JSON.deserialize(Response.getBody(), ApexCalloutsJSONWrapper.Animals.class);
           System.debug('animalPayLoad List--->'+animalPayLoad);
           for(String animal :animalPayLoad.animals){
               System.debug('Animals are--->'+animal);
           } 

            /*
            // Cast the values in the 'Animals' Key as a List Method 1
            List<Object> animals = (List<Object>) Results.get('animals');
            System.debug('following Animals are Received--->');
            for(Object animal: animals){
                System.debug('the Animals are--->'+animal);
            }  */
        }
    }
}