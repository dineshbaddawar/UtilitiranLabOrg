@RestResource(urlMapping='/showAccountDetails/*')
global  class GetAccountUsingRESTApi {
    // Here we are getting List of Account Record
    @HttpGet
    global static List<Account> getAccount(){
        List<Account> accList;
        try{
         accList =[SELECT Id,Name,Phone,Site,Rating FROM Account];
         return accList;
        }catch(Exception ex){
            System.debug('Error occurs--->'+ex.getMessage());
        }
        return accList;
    }
    
}