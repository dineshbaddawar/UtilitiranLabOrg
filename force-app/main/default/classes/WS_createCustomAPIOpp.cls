@RestResource(urlMapping='/customAPIOpp/*')
global class WS_createCustomAPIOpp {

   @HttpPost
    global static String OppCreate(){
        OpportunityInfo oppInfo = OpportunityInfo.MethodOpp(RestContext.request.RequestBody.tostring());
        
        Opportunity opp = new Opportunity();
        opp.Name = oppInfo.Name;
        opp.StageName = oppInfo.StageName;
        opp.CloseDate = oppInfo.CloseDate;
        opp.Phone__c = oppInfo.Phone;
        opp.AccountId = oppInfo.AccountId;
        insert opp;
        return opp.Id;
    }
}