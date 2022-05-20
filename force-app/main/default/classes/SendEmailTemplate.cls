public class SendEmailTemplate {

    public static void SendEmail(){
          EmailTemplate tpl = (EmailTemplate)[select Id, Subject, Body FROM EmailTemplate 
                                        WHERE Name = 'Onboarding Template' ];
        Contact con = [SELECT Id,LastName,Email FROM Contact WHERE LastName = 'Email'];
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        string[] toaddresses = new string[]{'dinesh.butilitarianlab@gmail.com'};
        message.setToAddresses(toaddresses);
        message.setTemplateId(tpl.id);	
        message.setTargetObjectId(con.id);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{message});
                
    }
}