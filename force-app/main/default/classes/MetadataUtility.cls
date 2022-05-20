public class MetadataUtility{
    // For text Field
    public static void generateTextField(String objectAPIName, String fieldAPIName, String fieldDescription, String fieldLabel){
        String metadata = '{"Metadata" : {"type" : "Text","description" : "'+fieldDescription+'", "inlineHelpText" : "","precision" : null,"label" : "'
            +fieldLabel+'","length" : 255,"required" : false}, "FullName" : "'+objectAPIName+'.'+fieldAPIName+'"}';
        
        String responseBody = createField(metadata);
    }
    // For Formula Field
    public static void generateFormulaField(String objectAPIName, String fieldAPIName, String fieldDescription, String fieldLabel, String retrunType, String validFormula){
        
        String metadata = '{"Metadata" : {"type" : "'+retrunType+'","description" : "'+fieldDescription+'", "formula" : "'
        +String.escapeSingleQuotes(validFormula)+'","formulaTreatBlanksAs" : "BlankAsZero","label" : "'+fieldLabel+'"}, "FullName" : "'
            +objectAPIName+'.'+fieldAPIName+'"}';
        String responseBody = createField(metadata);
    }
    // For Date Field
    public static void generateDateField(String objectAPIName, String fieldAPIName, String fieldDescription, String fieldLabel){
         String metadata = '{"Metadata" : {"type" : "Date","description" : "'+fieldDescription+'", "inlineHelpText" : "","precision" : null,"label" : "'
            +fieldLabel+'","required" : false}, "FullName" : "'+objectAPIName+'.'+fieldAPIName+'"}';
        String responseBody = createField(metadata);
    }
    
    // for Number Field
    public static void generateNumberField(String objectAPIName, String fieldAPIName, String fieldDescription, String fieldLabel){
        
        try{
           String metadata = '{"Metadata" : {"type" : "Number","description" : "'+fieldDescription+'", "inlineHelpText" : "","precision" : null,"label" : "'
            +fieldLabel+'","length" : 18,"required" : false}, "FullName" : "'+objectAPIName+'.'+fieldAPIName+'"}';
        String responseBody = createField(metadata);
        System.debug('Response--->'+responseBody);
        }catch(Exception e){
            System.debug('The Error '+e.getMessage());
            System.debug('The Field '+e.getLineNumber());
        }
         
    }
    
    public static String createField(String metadata) {
        HttpRequest request = new HttpRequest();
        request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        request.setHeader('Content-Type', 'application/json');
        request.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v46.0/tooling/sobjects/CustomField');
        request.setMethod('POST');
        
        request.setBody(metadata);
        
        Http http = new Http();
        HTTPResponse res = http.send(request);
        return res.getBody();
    }
}