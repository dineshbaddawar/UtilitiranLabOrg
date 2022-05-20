public class OpportunityInfo {

    public String Name;
    public String Phone;
    public Date CloseDate;
    public String StageName;
    public String AccountId;
    
    public Static OpportunityInfo MethodOpp(String json){
        return (OpportunityInfo) System.JSON.deserialize(json, OpportunityInfo.class);
    }
}