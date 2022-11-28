public class Utility {
     // Creating new Account Record
    public static Account newAccount(String name, String phone){
        Account acc = new Account(Name = name, Phone = phone);
        return acc;
   }
 // Creating new Contact Record
   public static Contact newContact(String firstname, String lastname,String email,String Phone){
       Contact con = new Contact(LastName = lastname, FirstName = firstname,Email = email, Phone = phone);
       return con;
   }
 // Creating new Opportunity Record
   public static Opportunity newOpp(String name, String stagename,Date closedate,Decimal amount){
       Opportunity opp = new Opportunity(Name = name, StageName = stagename, CloseDate = closedate,Amount = amount);
       return opp;
   }
    
    // Getting all Objects available in Salesforce
     @AuraEnabled(cacheable=true)
    // Method to get all Objects Available in Salesforce Org.
    public static Map<String, String> getAllObjectList(){
        Map<String, String> mapOfAllObject = new Map<String, String>();
        for(Schema.SObjectType objType : Schema.getGlobalDescribe().values()){
            Schema.DescribeSObjectResult describeSobjectResultObj = objType.getDescribe();
            String name = objType.getDescribe().getLocalName();
            String label = objType.getDescribe().getLabel();
            mapOfAllObject.put(name,label);
        }
        System.debug('mapOfAllObject ::'+mapOfAllObject);
        return mapOfAllObject;
    }
}