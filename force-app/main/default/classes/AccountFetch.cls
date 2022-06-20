public class AccountFetch {

    @AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT Id,Name,Phone FROM Account WHERE Phone !=null LIMIT 10];
    }
}