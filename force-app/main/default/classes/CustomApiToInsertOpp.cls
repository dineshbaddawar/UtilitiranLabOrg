@RestResource(urlMapping='/CustomOpportunityAPI/*')
global class CustomApiToInsertOpp {
    @httpPost
    global static responseWrapper OppCreate(){
        responseWrapper responseJSON = new responseWrapper();
        try{
            OppHelper oppdata = OppHelper.parse(RestContext.request.requestBody.toString());

            if(oppdata !=null){
                Opportunity opp = new Opportunity();
                if(oppdata.AccountId !=null){
                    opp.AccountId = oppdata.AccountId;
                    System.debug('opp.AccountId ---> '+ opp.AccountId);
                }
                if(oppdata.Name !=null){
                    opp.Name = oppdata.Name;
                    System.debug('opp.Name ---> '+ opp.Name);
                }
               if(oppdata.closedate !=null){
                  opp.CloseDate = oppdata.closedate;
                  System.debug('opp.CloseDate ---> '+ opp.CloseDate);
               }
               if(oppdata.stage !=null){
                opp.StageName = oppdata.stage;
                System.debug('opp.StageName ---> '+ opp.StageName);
               }
                    opp.Amount = oppdata.amount;
                    opp.NextStep = oppdata.nextstep;
                    opp.Type = oppdata.type;
                    opp.Probability = oppdata.probability;
                    opp.LeadSource = oppdata.leadsource;
                    opp.Phone__c = oppdata.phone;
                    insert opp;
                    responseJSON.Message = 'Record Inserted Successfully';
                    responseJSON.OpportunityId = opp.Id;
            }
            else{
                responseJSON.Message = 'Something went Wrog';

            }

        }catch(Exception e){
            System.debug('Error is Occured '+e.getMessage());
            System.debug('The Line Number '+e.getLineNumber());
            responseJSON.Message = e.getMessage();
            
        }
        return responseJSON;
    }
    global Class responseWrapper{
        global String Message;
        global String OpportunityId;
       
    }

    /*

    Request Body: For Inserting Opportunity Record

    {
"Name": "Vignrdh Naik",
"Accountid": "0015j00000ez6ECAAY",
"closedate": "2021-02-12",
"Stage":"Prospecting",
"Amount":"3400",
"NextStep":"First",
"Type": "New Customer",
"Probability": "35",
"LeadSource": "Web",
"phone": "8446557829"
}

    */
}