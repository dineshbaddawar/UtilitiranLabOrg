public with sharing class Future_Apex_1 {
   @future
    public static void updateAccount(Set<Id> IdSet){
        List<Account> accList = [SELECT Id,Name,No_of_Contacts__c,(SELECT Id FROM Contacts) FROM Account WHERE Id IN :IdSet];
       for(Account acc:accList){
           List<Contact> conList = acc.Contacts;
           acc.No_of_Contacts__c = conList.size();
       }
       update accList;
    }
}