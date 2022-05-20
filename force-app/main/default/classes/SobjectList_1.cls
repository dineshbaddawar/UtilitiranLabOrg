public class SobjectList_1 {

     public Map<String, Schema.SObjectType> objs {get; set;}
    public List<SelectOption> objList{get;set;} 
    public String obj {get;set;}
    public List<String> objFields {get;set;}
    public List<String> selFieldNames = new List<String>();
    public List<String> selAvaFieldNames = new List<String>();
    
    public List<String> availableFieldNames = new List<String>();
    public String sql = '';
    
    public SobjectList_1()
    {
        objList = new List<SelectOption>();
        objs = Schema.getGlobalDescribe();
        List<Schema.Sobjecttype> temp = objs.values();
        //To Extract all the Sobject from the org.
        for(Schema.SObjectType objec: objs.values()){
            
            objList.add(new SelectOption(String.valueOf(objec),String.valueOf(objec)));
        }
        obj = 'Account';
        fetchFields();
    }
    
    //Fetch all the fields associated with selected sobject
    public void fetchFields()
    {
        availableFieldNames.clear();
        Map<String , Schema.SObjectType> globalDescription = Schema.getGlobalDescribe();
        Schema.sObjectType objType = globalDescription.get(obj); 
        Schema.DescribeSObjectResult r1 = objType.getDescribe(); 
        Map<String , Schema.SObjectField> mapFieldList = r1.fields.getMap();
        objFields = new List<String>();
        for(Schema.SObjectField field : mapFieldList.values())  
        {  
            Schema.DescribeFieldResult fieldResult = field.getDescribe();
            if(fieldResult.isAccessible())  
            {  
                objFields.add(fieldResult.getName());
            }  
        }
    }
    
    // Export records by parsing selected subject.
    public pageReference exportFun()
    {
        if(obj == null) obj='Account';
        Integer i =0;
        Integer len = availableFieldNames.size() - 1;
        sql = 'SELECT ';
        for(i = 0; i < availableFieldNames.size(); i++)
        {   
            if(i != len)
            {
                sql = sql + availableFieldNames[i] + ',';
            }
            else
            {
                sql = sql + availableFieldNames[i] + ' FROM ' + obj;
            }
        }
        
        //Call Export Csv Visual force page  
        pageReference pg = new pageReference('/apex/ExportAsCSV?objName='+obj+'&soql='+sql);
        pg.setRedirect(true);
        return pg;
    } 
    
    //Get all the fields value with associate sobjects
    public List<SelectOption>getsoFieldNames()    
    {          
        List<SelectOption> options = new List<SelectOption>();
        for(String temp:objFields)
        {     
            options.add(new SelectOption(temp,temp));
        }      
        return options;    
    }
    
    public List<SelectOption>getsoAvailablefieldNames()    
    {          
        List<SelectOption> options = new List<SelectOption>();
        for(String tmp:selFieldNames)
        {
            availableFieldNames.add(tmp);
        }
        for(String temp:availableFieldNames)
        {     
            options.add(new SelectOption(temp,temp));
        }      
        selFieldNames.clear();
        return options;    
    }   
    
    public List<String>getselFieldNames()     
    {      
        return selFieldNames;    
    }        
    public void setselFieldNames(List<String> selFieldNames)     
    {      
        this.selFieldNames = selFieldNames;    
    } 
    
    public List<String>getselAvaFieldNames()     
    {      
        return selAvaFieldNames;    
    }        
    public void setselAvaFieldNames(List<String> selAvaFieldNames)     
    {      
        this.selAvaFieldNames = selAvaFieldNames; 
    }
    
    public void addFields()
    {
        Integer i = 0;
        for(String tmp:selFieldNames)
        {
            selAvaFieldNames.add(tmp);
            for(i = 0; i<objFields.size(); i++)
            {
                if(objFields[i] == tmp)
                {
                    objFields.remove(i);
                }
            }                          
        }      
    }
    
    public void removeFields()
    {
        Integer i = 0;
        for(String tmp:selAvaFieldNames)
        {
            objFields.add(tmp);
            for(i = 0; i<availableFieldNames.size(); i++)
            {
                if(availableFieldNames[i] == tmp)
                {
                    availableFieldNames.remove(i);
                }
            }                          
        }
    }
}