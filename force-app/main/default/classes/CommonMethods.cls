public with sharing class CommonMethods {
    
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
        return mapOfAllObject;
    }
}