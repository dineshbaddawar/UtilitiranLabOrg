public without sharing class Queueable_Apex_1 implements Queueable {

    public void Execute(QueueableContext bc){
        List<Account> accList =  [SELECT Name,Industry FROM Account ];
        system.debug('accList.size()---'+accList.size());
        for(Account acc:accList){
            // update the account fields
           if(acc.Industry ==null){
               acc.Industry = 'Energy';
           }
        }
        update accList;
    }
}