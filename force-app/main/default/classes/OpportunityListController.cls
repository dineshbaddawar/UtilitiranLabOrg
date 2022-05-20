public class OpportunityListController {

    @AuraEnabled
    public static List<Opportunity> GetOpportunity(){
        return [SELECT Id,Name,Amount,StageName FROM Opportunity LIMIT 15];
    }
}