@RestResource(urlMapping='/Cases/*')
global class CaseService {

    @HttpGet // Get Record By Using Id
    global static Case getCaseById(){
        RestRequest request = RestContext.request; 
        // grab the caseId from the end of the URL
        String cId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
         Case result = [SELECT CaseNumber,Subject,Status FROM Case WHERE Id =:cId];
        return result;
    }
    
    @HttpPost  // Create Record By Passing the Body 
    global static Id createCase(String subject, String status, String origin, String priority){
        Case thisCase = new Case(Subject=subject,Status=status,Origin=origin,Priority=priority);
        insert thisCase;
        return thisCase.Id;
    }
    
    @HttpDelete
    global static void deleteCase(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];
        delete thisCase;
    }
    
    @HttpPut
    global static Id upsertCase(String subject,String status,String origin,String priority,String id){
        Case thisCase = new Case(Id=id,Subject=subject,Status=status,Origin=origin,Priority=priority);
            // Match case by Id, if present
            // Otherwise, create new case.
            upsert thisCase;
            // Return the case Id.
            return thisCase.Id;
    }
    
    @HttpPatch
    global static Id updateCaseField(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case thiscase = [SELECT Id FROM Case WHERE Id =:caseId];
        // Deserialize the JSON string into name-value pairs
        Map<String,Object> params =(Map<String,Object>)JSON.deserializeUntyped(request.requestBody.tostring());
        // Iterate through each parameter field and value
        for(String fieldName : params.keySet()){
            // Set the field value on the Case Object
            thisCase.put(fieldName, params.get(fieldName));
        }
        update thisCase;
        return thisCase.Id;
    }
}