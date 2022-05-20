public class CreateOpportunityForm {
    

    @RemoteAction 
    public static String CreateAccount(String name,String website, String fax, string industry, integer annualRevenue){

        Account acc = new Account(Name = name, Website = website,Industry = industry, AnnualRevenue = annualRevenue);
        insert acc;
        return acc.Id;
    }

    @RemoteAction
    public static string  createOpportunity(String name, decimal amount, date closedate, string description,String phone,string type,Decimal probability, String leadsource, String stagename){
        try{
            Opportunity opp = new Opportunity(Name = name, Amount = amount, CloseDate = closedate, Description = description,Phone__c = phone, Type = type, Probability = probability,  LeadSource = leadsource, StageName = stagename );
            insert opp;
            return opp.Id;
        }catch(Exception  e){
            return e.getStackTraceString();
            
        }
        
    } 
}