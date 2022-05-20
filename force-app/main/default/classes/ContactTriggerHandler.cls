public with sharing class ContactTriggerHandler {
    
    // Create Case Whenever we Change LeadSource as Other .
    public static void createCase(Map<Id,Contact> contactNewMap, Map<Id,Contact> contactOldMap){
        List<Case> caseList = new List<Case>();
        for(Contact conObj : contactNewMap.values()){
            if(contactNewMap.get(conObj.Id).LeadSource != contactOldMap.get(conObj.Id).LeadSource &&
             contactNewMap.get(conObj.Id).LeadSource == 'Other'){
                Case caseObj = new Case();
                caseObj.Status = 'Open';
                caseObj.Priority = 'High';
                caseObj.Origin = 'Other';
                caseObj.Subject = 'Contact Created From Lead Source Other';
                caseObj.ContactId = conObj.Id;
                caseList.add(caseObj);
            }
        }
        if(!caseList.isEmpty()){
            insert caseList;
        }
    }

    // if isPrimary is Check & if try to delete to will throw an error.
    public static void preventDeletePrimaryContact(List<Contact> contactList){
        for(Contact conObj : contactList){
            if(conObj.IsPrimary__c){
                conObj.addError('IsPrimary__c Contact can not be Deleted');
            }
        }
    }
}