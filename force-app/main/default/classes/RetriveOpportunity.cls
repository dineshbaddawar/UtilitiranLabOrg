public class RetriveOpportunity {

    public List<Opportunity> oppList{get;set;}
    public RetriveOpportunity(){
        oppList = [SELECT Id,Name,StageName,Amount,CloseDate FROM Opportunity ];
    }
}