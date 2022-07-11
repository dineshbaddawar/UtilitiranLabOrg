public with sharing class StudentController {
   
    @AuraEnabled(cacheable=true)
    public static List<Student__c> StudentRecord(){
        return [SELECT Id,Name,Phone__c FROM Student__c LIMIT 5 ];
    }

    @AuraEnabled(cacheable=true)
    public Static List<School__c> getSchoolRec(){
        return [SELECT Id,Name,Email__c,Phone__c  FROM School__c];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactRec(Id RecordId, String searchKeys){
        // If searchKey is Available
        if(searchKeys != null && searchKeys != '' ){
          String key = '%'+ searchKeys +'%'; // Search Key
          List<Contact> conSearchList = [SELECT Id,Name,AccountId FROM Contact WHERE AccountId =: RecordId AND Name LIKE :key];
          return conSearchList;
        }
        // If Search Key not found
        else{
            List<Contact> conList =  [SELECT Id,FirstName,LastName,Email,AccountId FROM Contact WHERE AccountId =: RecordId LIMIT 5];
            // Null Check
            if(!conList.isEmpty()){
                return conList;
            }
            return null;
        }
     
    }

    @AuraEnabled 
    public static List<Opportunity> getOppRecord(){
        return [SELECT Id,StageName,Name,CloseDate FROM Opportunity LIMIT 5];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccRecord(){
        return [SELECT Id,Name,Phone FROM Account ];
    }

    @AuraEnabled 
    public static List<Contact> getContactsRecord(Id SelectedAccountId){
         return [SELECT Id,FirstName,LastName,Email,AccountId FROM Contact WHERE AccountId =:SelectedAccountId];
    }




}