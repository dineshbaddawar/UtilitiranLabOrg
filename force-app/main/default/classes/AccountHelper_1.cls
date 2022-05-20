public with sharing class AccountHelper_1 {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name, Type, Rating,
                Phone, Website, AnnualRevenue
            FROM Account LIMIT 5];
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getNewAccountList(Integer lim) {
        return [SELECT Id, Name, Type, Rating,
                Phone, Website, AnnualRevenue
            FROM Account LIMIT : lim];
    }

}