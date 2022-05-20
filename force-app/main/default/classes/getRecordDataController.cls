public with sharing class getRecordDataController {
    
    @AuraEnabled(cacheable=true)
    public Static List<Account> getAccounts(){
        return [SELECT Id,Name FROM Account LIMIT 5];
    }

    @AuraEnabled(cacheable=true)
    public Static List<Contact> getContacts(){
        return [SELECT Id,LastName,FirstName FROM Contact WHERE LastName != null LIMIT 5];
    }
}