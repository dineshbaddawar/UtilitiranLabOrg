public class FieldSetController {
  
    public static List<Schema.FieldSetMember> getFieldSet(){
        System.debug('Values-->'+SobjectType.Opportunity.FieldSets.FiledSet_Opp.getFields());
        return SobjectType.Opportunity.FieldSets.FiledSet_Opp.getFields();
    }

    @AuraEnabled(cacheable=true)
    public static List<string> getFieldsData(){
    
         List<Schema.FieldSetMember> fieldSet = FieldSetController.getFieldSet();
         List<String> fieldList = new List<String>();
         
         for(Schema.FieldSetMember field : fieldSet){
            fieldList.add(String.valueOf(field.sobjectfield));
         }

         System.debug('FIELDLIST-----'+fieldList);

         return fieldList;

    }
   
}