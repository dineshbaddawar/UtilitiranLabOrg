public with sharing class Batch_Apex_3 implements Database.Batchable <Sobject> {
    
    public Database.QueryLocator Start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id,LastName FROM Contact LIMIT 10]);
    }

    public void Execute(Database.BatchableContext bc, List<Contact> conList){
        for(Contact con:conList){
            con.LastName = 'DreamForce';
        }
        update conList;
    }

    public void Finish(Database.BatchableContext bc){
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        mail.setToAddresses(new String[] {'dinesh.butilitarianlab@gmail.com'});
        
        mail.setSenderDisplayName('Batch Processing');
        
        mail.setSubject('Batch Process Completed');
        
        mail.setPlainTextBody('Batch Process has completed');
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        System.debug('Email Has Send Successfully ');
    }
    
}