public with sharing class DynamicAccountHelper {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        return [SELECT Id,Name,Phone FROM Account LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public Static List<Account> getNewAccountList(Integer accNo){
        return [SELECT Id,Name,Phone FROM Account LIMIT : accNo ];
    }
}