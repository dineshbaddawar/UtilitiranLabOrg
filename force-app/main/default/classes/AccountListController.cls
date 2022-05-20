public class AccountListController {

    @AuraEnabled
    
    public static List<Account>  GetAccounts(){
        List<Account> accList = [SELECT Id,Name,Phone, Industry,Type FROM Account LIMIT 15];
        return accList;
    }
}