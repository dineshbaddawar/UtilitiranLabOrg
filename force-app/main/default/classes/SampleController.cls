public class SampleController {
     
    Public string selectedObj {get;set;}
    public String selectedField {get; set;}
     
    Public List<Selectoption> getObjList(){
        List<Schema.SObjectType> objList = Schema.getGlobalDescribe().Values();     
        List<SelectOption> objNames = new List<SelectOption>();
        objNames.add(new SelectOption('','-- Select --'));
        integer counter = 0;
        for(Schema.SObjectType obj : objList)
        {
            ++counter;
            if(counter == 1000)
                break;
            objNames.add(new SelectOption(obj.getDescribe().getName(),obj.getDescribe().getLabel()));
        	
        }
        system.debug('objNames::'+objNames);
        system.debug('objNames::size'+objNames.size());
        objNames.sort();
        return objNames;
    }
     
    public List<SelectOption> getObjectFields() {
        List<SelectOption> fieldNames = new List<SelectOption>();
        fieldNames.add(new SelectOption('','-- Select --'));
        if(!String.isBlank(selectedObj)){
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType ObjSchema = schemaMap.get(selectedObj);
            Map<String, Schema.SObjectField> fieldMap = ObjSchema.getDescribe().fields.getMap();
            for (String fieldName: fieldMap.keySet()) 
            {  
                fieldNames.add(new SelectOption(fieldName, fieldMap.get(fieldName).getDescribe().getLabel()));
            }
            system.debug('fieldNames::'+fieldNames);
        }
        return fieldNames;
    }      
}