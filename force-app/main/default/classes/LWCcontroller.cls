public with sharing class LWCcontroller {
    public LWCcontroller() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsRelatedToAccount(String accId){
        return [SELECT Id,FirstName,LastName, Email FROM Contact WHERE AccountId =:accId];
    }
}