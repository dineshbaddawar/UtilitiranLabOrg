public class AccountCreationController {

    public Account actObj{get;set;}
    public AccountCreationController(){
        actObj = new Account();
    } 
    public pageReference saveAccountRec(){
        insert actObj;
        return new Pagereference('/'+actObj.Id);
    }
    
}