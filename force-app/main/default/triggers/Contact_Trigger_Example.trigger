trigger Contact_Trigger_Example on Contact (after insert,after update,after delete,after undelete) {

    // this trigger will Count no of Contact asscociated with that account after insert,delete.
    // Method 1
    /*
    if(trigger.isAfter){
        Set<Id> IdSet = new Set<Id>();
        List<Contact> conList = new List<Contact>();
        
        if(trigger.isDelete){
            conList = trigger.old;
        }else{
            conList = trigger.new;
        }
        
        for(Contact con:conList){
            if(con.AccountId != null){
                IdSet.add(con.AccountId);
            }
            
            if(trigger.isUpdate){
                Contact oldContact=(Contact)trigger.oldmap.get(con.id);
                if(oldContact.AccountId != con.AccountId){
                    IdSet.add(oldContact.AccountId);
                }
            }
            
            List<Account> accList = [SELECT Id,No_of_Contacts__c,(SELECT AccountId FROM Contacts) FROM Account WHERE Id IN:IdSet];
            for(Account acc:accList){
                List<Contact> relContact = acc.Contacts;
                if(relContact != null){
                    acc.No_of_Contacts__c = relContact.size();
                }else{
                    acc.No_of_Contacts__c=0;
                }
            }
            update accList;
        }
    }
    */

    
}