public class Spoonacular_API {
     
    private static final String SpoonacularAPI = 'https://api.spoonacular.com';
    private static final String API_KEY = '90574c4474684409a6e4eef1692c390a';
    
    public Static String getRandomReceipe(){  // Method 1
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SpoonacularAPI+'/recipes/random?apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            return response.getBody();
        }
        return '';
    }
    
    public Static String getReceipe(String receipeId){  // Method 2
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SpoonacularAPI+'/recipes/'+receipeId+'/information?apiKey='+API_KEY);
        request.setMethod('GET');
        // https://api.spoonacular.com/recipes/{id}/information 
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
           return response.getBody();
        }
        return '';
    }
    
    public Static String getReceipeByIngredient(String ingredients){  // Method 3
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SpoonacularAPI+'/recipes/findByIngredients?apiKey='+API_KEY+'&ingredients='+ingredients );
        //  https://api.spoonacular.com/recipes/findByIngredients
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
           return response.getBody();
        }
        return '';
    }
}