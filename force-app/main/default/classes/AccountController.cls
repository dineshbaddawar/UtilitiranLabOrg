public with sharing class AccountController {
    public AccountController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        return [SELECT Id,Name FROM Account LIMIT 10];
    }

    @AuraEnabled
    public static List<Contact> getContacts(String accountId){
        return [SELECT Id,FirstName,LastName FROM Contact WHERE AccountId =:AccountId];
    }
   /*
    @AuraEnabled
    public static List<Opportunity> getOpportunity(String accountId){
        return [SELECT Id,Name,CloseDate,StageName FROM Opportunity WHERE AccountId =:AccountId];
    }
    */
}