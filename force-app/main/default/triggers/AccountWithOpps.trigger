trigger AccountWithOpps on Account (after insert) {

    List<Opportunity> OppList = new List<Opportunity>();
    if(trigger.isAfter && trigger.isInsert){
        for(Account acc : trigger.new){
            if(acc.NumberOfEmployees > 0){
                for(Integer i=0;i<acc.NumberOfEmployees ; i++){
                    Opportunity opp = new Opportunity();
                    opp.AccountId = acc.Id;
                    opp.Name = acc.Name+i;
                    opp.StageName = 'Prospecting';
                    opp.CloseDate = System.today().addDays(10);
                   OppList.add(opp);
                }
            }
        }
        insert OppList;
    }
}