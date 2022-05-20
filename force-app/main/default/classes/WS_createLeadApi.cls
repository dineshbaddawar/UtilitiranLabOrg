@RestResource(urlMapping='/createLead/*')
global class WS_createLeadApi {
@HttpPost
    global static String leadCreate(){
        system.debug('LeadRequestList-->'+RestContext.request.requestBody.tostring());
        LeadInfo leadInfoRec = LeadInfo.parse(RestContext.request.RequestBody.tostring());
        system.debug('leadInfoRec---->'+leadInfoRec.EmailAddress);
        
        Lead leadRec = new Lead();
        leadRec.FirstName = leadInfoRec.FirstName;
        leadRec.LastName = leadInfoRec.LastName;
        leadRec.Email = leadInfoRec.EmailAddress;
        leadRec.Company = 'Salesforce CRM';
        leadRec.Phone = leadInfoRec.Phone;
        leadRec.mx_State__c = leadInfoRec.mx_State;
        leadRec.mx_Class_Course__c = leadInfoRec.mx_Class_Course;
        
        insert leadRec;
        return leadRec.Id;
    }
}