@RestResource(urlMapping='/showAccountDetailsRecord/*')
global  class GetAccountUsingRESTApi_1 {
    // Here we are getting account Details by passing accountId in the URL
    @HttpGet
    global static Account GetAccountDetails(){
      RestRequest req = RestContext.request;
      RestResponse res = RestContext.response;
      String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
      System.debug('AccountId -->'+accountId);
      Account Result = [SELECT Id,Name,Phone FROM Account WHERE ID =:accountId];
      return Result;
    }

    // Here we are Creating new Account Record.
    @HttpPost
    global static String InsertAccount(String name,String phone,String website){
        Account acc = new Account();
        acc.Name = name;
        acc.phone = phone;
        acc.website = website;
        insert acc;
        return acc.Id;
    }

    // Here we are deleting Account Record using AccountId
    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
  }
}