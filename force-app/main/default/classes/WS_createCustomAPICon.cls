@RestResource(urlMapping='/customAPICon/*')
global class WS_createCustomAPICon {
 @HttpPost
    global static String ConCreate(){
        ContactInfo conInfo = ContactInfo.MethodCon(RestContext.request.RequestBody.tostring());
        
        Contact con = new Contact();
        con.FirstName = conInfo.FirstName;
        con.LastName = conInfo.LastName;
        con.Phone = conInfo.Phone;
        con.Email =  conInfo.Email;
        con.AccountId = conInfo.AccountId;  
        insert con;
        return con.Id;
    }
}