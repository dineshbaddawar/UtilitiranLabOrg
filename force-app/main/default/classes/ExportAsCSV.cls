public class ExportAsCSV 
{
    public List<sObject> objLst {get;set;} 
    public String obj;
    public String soql;
    public String fieldNames {get;set;}
    public List<String> flds {get;set;}
    public String coma {get;set;}
    public String newLine {get;set;}
    
    public ExportAsCSV()
    {
        coma = ',';
        newLine = '\n';
        obj = System.currentPageReference().getParameters().get('objName');
        soql = System.currentPageReference().getParameters().get('soql');
        System.debug('Selected Object is ' + obj);  
    }
    
    public void exportToCSV()
    {
        fieldNames = soql.subString(7,soql.indexOf(' FROM'));
        flds = fieldNames.split(',');
        objLst = Database.Query(soql);
    }
}