public class GenerateResumeController {

     public String currentRecordId {get; set;}
    public Contact contactDetails {get; set;}
    
       public GenerateResumeController(){
        currentRecordId =  ApexPages.CurrentPage().getparameters().get('id');
        system.debug('currentRecordId===>'+currentRecordId);
        contactDetails = [select Id,FirstName,LastName,Name,MailingStreet,MailingCity,MailingState,MailingPostalCode,MailingCountry,Phone,Email,MobilePhone FROM Contact where id='0035j00000PU2XZAA1'];
      
    }
}