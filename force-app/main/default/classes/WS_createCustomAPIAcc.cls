@RestResource(urlMapping='/customAPIAcc/*')
global class WS_createCustomAPIAcc {

   @HttpPost
    global static String AccCreate(){
        AccountInfo accInfo = AccountInfo.MethodAcc(RestContext.request.RequestBody.tostring());
        Account acc = new Account();
        acc.Name = accInfo.Name;
        acc.Phone = accInfo.Phone;
        acc.Email__c = accInfo.Email;
        acc.Rating = accInfo.Rating;
        Database.SaveResult results = Database.insert(acc,false);
        if(results.isSuccess()){
            System.debug('The Record Inserted & Id--->'+results.getId());
        }else{
            System.debug('The Error Occured is--'+results.getErrors());
        }
        
        return acc.Id;
    }
}