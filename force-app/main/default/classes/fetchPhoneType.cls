public with sharing class fetchPhoneType {
    
    public static void fetchPhoneType(String objectAPIName){
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(objectAPIName).getDescribe().fields.getMap();
        for (String fieldName : fieldMap.keySet()) {
        DescribeFieldResult descFieldRes = fieldMap.get(fieldName).getDescribe();
        
        if (descFieldRes.getType() == Schema.DisplayType.Phone) {
        System.debug(fieldName);
        }
        }
        }
}