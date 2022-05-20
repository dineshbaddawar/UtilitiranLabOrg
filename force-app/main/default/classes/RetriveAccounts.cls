public class RetriveAccounts {

    public List<Account> accList{get;set;}  
    public RetriveAccounts(){
        accList = [SELECT Id,Name,Phone,Type,Rating FROM Account];
    }
}