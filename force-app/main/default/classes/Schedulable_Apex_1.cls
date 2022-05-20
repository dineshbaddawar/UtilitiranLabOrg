public with sharing class Schedulable_Apex_1 implements Schedulable {
   
    public void Execute(SchedulableContext bc){
       
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Schedulable Account';
        accList.add(acc);

        Account ac = new Account();
        ac.Name = 'Account Schedulable';
        accList.add(ac);
        insert accList;
    }
    
}