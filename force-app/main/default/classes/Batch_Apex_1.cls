public with sharing class Batch_Apex_1  implements Database.Batchable <Sobject> {
   
    public Database.QueryLocator Start(Database.BatchableContext bc){
        String var = 'SELECT Name,StageName,CloseDate,Amount FROM Opportunity WHERE Amount = null';
        return Database.GetQueryLocator(var);
    }

    public void Execute(Database.BatchableContext bc, List<Opportunity> oppList){
      if(oppList.size()>0){

        for(Opportunity opp:oppList)
       opp.Amount = 11000;
    }
    update oppList;
      }
       

    public void Finish(Database.BatchableContext bc){
        System.System.debug('The Record is Successfully Updated Amount');
    }
}