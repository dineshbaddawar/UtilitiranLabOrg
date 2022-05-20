public with sharing class AngularAccountCreation {
   
    @RemoteAction 
    public Static String createAccount(String name, String email, String phone){
        Account acc = new Account(Name = name, Email__c = email, Phone = phone);
        insert acc;
        return acc.Id;
    }

    @RemoteAction 
    public static List<Account> fetchAllAccounts(){
        return [SELECT Id,Name,Email__c,Phone FROM Account LIMIT 10];
    }
}
