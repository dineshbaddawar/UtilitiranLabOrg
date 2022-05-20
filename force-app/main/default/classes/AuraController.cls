public class AuraController {

    @AuraEnabled
    Public Static List<Contact> getContactList(String accId){
        List<Contact> conList = [SELECT Id,FirstName,LastName,Phone,Email FROM Contact WHERE AccountId =:accId];
        return conList;
    }
    
    @AuraEnabled
    public static List<Opportunity> getOppList(String accId){
        List<Opportunity> oppList = [SELECT Id,Name,StageName, Amount FROM Opportunity WHERE AccountId =:accId];
        return oppList;
    }
    
    @AuraEnabled
    public static Contact createContact(Contact con,Id accId){
        con.AccountId = accId;
        return con;
    }
    
    @AuraEnabled
    public static Opportunity createOpportunity(Opportunity oppRecord, Id accId){
        oppRecord.AccountId = accId;
        return oppRecord;
    }
    
    @AuraEnabled
    public static List<Contact> findContactByName(String searchconKey, String accId){
        String name = '&' + searchconKey + '%';
        return [SELECT AccountId,Name FROM Contact WHERE Name LIKE:name AND AccountId =:accId];
    }
    
    @AuraEnabled
    public static List<Opportunity> findOpportunityByName(String searchoppKey, String accId){
        String name = '%' + searchoppKey + '%';
        return [SELECT AccountId,Name FROM Opportunity WHERE Name LIKE:name AND AccountId =:accId];
    }
}