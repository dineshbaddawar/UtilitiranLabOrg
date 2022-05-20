@RestResource(urlMapping='/createSchool/*')
global class WS_createSchoolAPI {

    @HttpPost
    global static String SchoolCreate(){
        system.debug('SchoolRequestList--->'+RestContext.request.requestBody.tostring());
        SchoolInfo schInfoRec = SchoolInfo.parse(RestContext.request.RequestBody.tostring());
        system.debug('schInfoRec---->'+schInfoRec.Email);
        
        School__c schRec = new School__c();
        schRec.Name = schInfoRec.Name;
        schRec.Phone__c = schInfoRec.Phone;
        schRec.Email__c = schInfoRec.Email;
        
        insert schRec;
        return schRec.Id;
    }
}