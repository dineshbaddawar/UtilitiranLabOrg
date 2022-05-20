public with sharing class AccountList {
    public AccountList() {

    }
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT Id,Name,Phone,Rating From Account];
    }
}