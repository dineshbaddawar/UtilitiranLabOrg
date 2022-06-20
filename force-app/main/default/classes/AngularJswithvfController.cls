Public with sharing class AngularJswithvfController {
    
    public static String getContacts() {
        
        return JSON.serialize([select id, name, email
                               
                               from contact ]);
        
    }
    
}