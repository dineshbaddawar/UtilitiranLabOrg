public with sharing class AccountActionsHandler {
    
    // Creating Contact When Account is Created.
    public static void createContacts(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account acc: accList){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            conList.add(con);
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }

    // Whenever is Account Rating is Change from oldone to Warm then it will create Opportunity.
    public static void createOpportunity(Map<Id,Account> newAccountMap, Map<Id,Account> oldAccountMap){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc : newAccountMap.values()){
            if(newAccountMap.get(acc.id).Rating != oldAccountMap.get(acc.Id).Rating && newAccountMap.get(acc.Id).Rating=='warm'){
                Opportunity opp = new Opportunity();
                opp.AccountId = acc.Id;
                opp.Name = acc.Name;
                opp.StageName = 'Prospecting';
                opp.CloseDate = System.today();
                oppList.add(opp);
            }
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
}