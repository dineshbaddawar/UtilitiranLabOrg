public class JsonToApexClass {
    
    public String FirstName;
    Public String LastName;
}
    /*
JSON Data
{"FirstName":"Dinesh","LastName":"Baddawar"}

Apex Code:

String JsonToApex = '{"FirstName":"Dinesh","LastName":"Baddawar"}';
JsonToApexClass var = (JsonToApexClass)System.JSON.deserialize(JsonToApex, JsonToApexClass.class);
System.debug('the Data is ---->'+var.FirstName);
System.debug('the Data ---->'+var.LastName);
*/