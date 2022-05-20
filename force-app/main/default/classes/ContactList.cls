public with sharing class ContactList {
    public ContactList() {

    }
    @AuraEnabled
    public static List<Contact> getContacts(){
        return [SELECT Id,FirstName,LastName,Email,Phone From Contact Limit 10];
    }
}