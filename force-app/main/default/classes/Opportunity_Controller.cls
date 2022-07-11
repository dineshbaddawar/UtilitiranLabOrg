public with sharing class Opportunity_Controller {
    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppList(String accId){
        return [SELECT Id,AccountId,Name,StageName,CloseDate FROM Opportunity WHERE AccountId =: accId];
    }

   

}