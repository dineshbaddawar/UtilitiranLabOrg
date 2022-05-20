public with sharing class GetPicklistTypeFields {
   
    @AuraEnabled(cacheable=true)
    // Method to get PickList type fields from Object
    public static Map<String, String> getPicklistTypeFields(String strObjectName){
        Map<String, Schema.SObjectType> detail = Schema.getGlobalDescribe();
        Map<String, String> mapOfPicklistTypeFields = new Map<String,String>();

        for(Schema.SObjectField fields : detail.get(strObjectName).getDescribe().fields.getMap().values()){
            if(fields.getDescribe().getType() == Schema.DisplayType.PICKLIST){
                mapOfPicklistTypeFields.put(fields.getDescribe().getName(), fields.getDescribe().getName());
            }
        }
        return mapOfPicklistTypeFields;
    }

    @AuraEnabled(cacheable=true)
    // Method to get pickList options for selected picklist field.
    public static Map<String, String> getPickListvaluesByFieldName(String ObjectName, String pickListFieldName){
        try{

            System.debug('ObjectName is '+ObjectName);
            System.debug('pickListFieldName is '+pickListFieldName);

            Map<String, String> pickListFields = new Map<String, String>();
            Map<String, Schema.SObjectField> mapFields = Schema.getGlobalDescribe().get(ObjectName).getDescribe().fields.getMap();
            Schema.DescribeFieldResult pickFieldResult = mapFields.get(pickListFieldName).getDescribe();
            List<Schema.PicklistEntry> picklistFieldsEntry1 = pickFieldResult.getPicklistValues();
            for( Schema.PicklistEntry picklistFieldsEntry2 : picklistFieldsEntry1){
                pickListFields.put(picklistFieldsEntry2.getLabel(), picklistFieldsEntry2.getValue());
            }
            return pickListFields;

        }catch(Exception e){
            System.debug('The Error was : '+e.getMessage());
            return null;
        }
    }
}