trigger StudentEmailTrigger on Student__c (after update) {
    
    if(trigger.isAfter && trigger.isUpdate){
        List<Student__c> stuList = new List<Student__c>();
        List<Account> accList = new List<Account>();
        
        for(Student__c sc : [SELECT Name, Status__c,Account__r.Name,Account__r.Phone,Account__r.Email__c FROM Student__c WHERE Account__r.id != NULL] )
        {
            if(sc.Status__c ==null){
                sc.Status__c = 'old';
            }
            {
                               
               
                /*List<Messaging.Email> emailList = new List<Messaging.Email>();
               
                        Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                        
                        String[] toAddress = new String[]{sc.Account__r.Email__c};
                            emailMsg.setToAddresses(toAddress);
                        
                        String emailSub = 'Welcome' + sc.Name;
                        emailMsg.setSubject(emailSub);
                        
                        String disName = 'Mukesh Chawla';
                        emailMsg.setSenderDisplayName(disName);
                        
                        string content = 'Hi' + sc.Name + ',<br/><br/>' +
                            'Welcome to salesforce Ecosystem! <br/><br/>' +
                            'Begin your salesforce Admin and Developer Journey with' +
                            'Happy Learning!!! <br/><br/>' +
                            'Thank You!! <br/><br/>';
                        emailMsg.setHtmlBody(content);
                        
                        emailList.add(emailMsg);
                  
              
                Messaging.sendEmail(emailList);*/
                
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                list<Messaging.SingleEmailMessage> mailList = new list<Messaging.SingleEmailMessage>();
                EmailTemplate emailTemp = [SELECT Id, Subject, Body FROM EmailTemplate WHERE DeveloperName= 'Demo_Template'];
                String[] toAddress = new String[]{sc.Account__r.Email__c};
                mail.setToAddresses(toAddress);
                //mail.setTemplateId(emailTemp.Id);
                mail.setPlainTextBody(emailTemp.Body);
                mailList.add(mail);
                Messaging.sendEmail(mailList);
                System.debug('the mailList--->'+mailList);
            }
            
        }
    }
}