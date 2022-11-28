public class EmailUtilty {
    
    
    // Sending Email without Email Template
    public Static void SendEmailWithoutTemplate(){
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        String[] EmialAddress = new String[]{'dinesh.b@utilitarianlab.com'};
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Interview Letter');
        mail.setPlainTextBody('You have been Selected For the Interview.');
        mail.setToAddresses(EmialAddress);
        mailList.add(mail);
        if(!mailList.isEmpty())
            Messaging.sendEmail(mailList);
    }
    
    // Sending Email with Email Template
    public Static void SendEmailWithTemplate(){
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        EmailTemplate temp = [SELECT Id,Subject,Body FROM EmailTemplate WHERE Name ='Offer Letter'];
        List<Contact> conList = [SELECT Name,id,createdDate From Contact Where CreatedDate = today];
        
        for(Contact con : conList){
            
            Messaging.SingleEmailMessage mailTemp = new Messaging.SingleEmailMessage();
            mailTemp.setTemplateId(temp.id);
            mailTemp.setTargetObjectId(con.id);
            mailList.add(mailTemp);
            
            
        }
        if(!mailList.isEmpty())
            Messaging.sendEmail(mailList);
    }
    
    // Sending Email with Email Template & Using Helper Class
    public Static void SendEmailWithTemplateHelper(List<String> ids, String templateName){
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        EmailTemplate temp = [SELECT Id,Subject,Body FROM EmailTemplate WHERE Name =: templateName];
        List<Contact> conList = [SELECT Name,id,createdDate From Contact Where id IN : ids];
        
        for(Contact con : conList){
            Messaging.SingleEmailMessage mailTemp = new Messaging.SingleEmailMessage();
            mailTemp.setTemplateId(temp.id);
            mailTemp.setTargetObjectId(con.id);
            mailList.add(mailTemp);
        }
        if(!mailList.isEmpty())
            Messaging.sendEmail(mailList);
    }
    
    // Sending Email with Email Template for Custom Objects
    
     public Static void SendEmailWithTemplateForCustomObject(){
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        EmailTemplate temp = [SELECT Id,Subject,Body,HTMLValue FROM EmailTemplate WHERE Name ='Offer Letter'];
        List<Student__c> conList = [SELECT Name,Email__c,createdDate From Student__c Where CreatedDate = today];
         String str = temp.HTMLValue;
            String body = temp.body;
        for(Student__c con : conList){
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
             mail.setHtmlBody(str);
             mail.setSubject(temp.Subject);
             mail.setPlainTextBody(body);
             mail.toAddresses = new String[] {con.Email__c};
             mailList.add(mail);
             if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList);
           }
            
        }
        if(!mailList.isEmpty())
            Messaging.sendEmail(mailList);
    }
    
    // Sending Email with Email Template for Custom Objects Alos Replacing Plaintext Body with Current Value
    
    Public Static void SendEmailToWithEmialTemplate(){
        
        try{
            List<Student__c> conList = [SELECT Name,Email__c,createdDate From Student__c Where createdDate = TODAY];
            List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
            EmailTemplate temp = [SELECT Id,Subject,Body,HTMLValue FROM EmailTemplate WHERE Name ='Offer Letter'];
            String htmlBody = temp.HTMLValue;
            String subject = temp.Subject;
            String plainTextBody = temp.body;
            for(Student__c stu : conList){
              //  htmlBody = htmlBody.replace('{!Student__c.Name}', stu.Name);
                plainTextBody = plainTextBody.replace('{!Student__c.Name}', stu.Name);
                Messaging.SingleEmailMessage mailTemp = new Messaging.SingleEmailMessage();
                mailTemp.setHtmlBody(htmlBody);
                mailTemp.setSubject(temp.subject);
                mailTemp.setPlainTextBody(plainTextBody);
                mailTemp.toAddresses = new String[] {stu.Email__c};
                mailList.add(mailTemp);
            }
            if(!mailList.isEmpty()){
                Messaging.sendEmail(mailList);
            }
        }catch(Exception e){
            System.debug('The Error ::'+e.getMessage() +' Erron Line :: = ::'+e.getLineNumber());
        }
    }    
   
}