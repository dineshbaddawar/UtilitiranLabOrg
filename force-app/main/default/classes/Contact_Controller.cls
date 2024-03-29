public with sharing class Contact_Controller {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accId) {
        return [
            SELECT AccountId, Id, FirstName, LastName, Title, Phone, Email FROM Contact WHERE AccountId = :accId ];
    }

   
}