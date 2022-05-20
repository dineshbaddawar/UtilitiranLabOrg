public with sharing class AccountContactUsingAngularJS {
    
    @RemoteAction 
    public static string createAccountRec(String name, String phone, String email){
        Account accRec = new Account(Name = name, Phone = phone, Email__c = email);
        insert accRec;
        return accRec.Id;
    } 

    @RemoteAction
    public static String CreteOpportunity(String name, date closedate, string stagename, String accountId){
        Opportunity oppRec = new Opportunity(Name = name, CloseDate = closedate, StageName = stagename, AccountId = accountId);
        insert oppRec;
        return oppRec.Id;
    }
}
