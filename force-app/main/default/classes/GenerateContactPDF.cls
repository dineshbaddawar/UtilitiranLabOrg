public class GenerateContactPDF {

     public String currentRecordId {get;set;}
     public Contact ContactDetails {get;set;}
    // public ResumeWrapper rWrapper {get;set;}

    public GenerateContactPDF(){
         currentRecordId = ApexPages.currentPage().getparameters().get('0035j00000RMlkFAAT');

         ContactDetails = [SELECT Id,FirstName, LastName, Phone, Email, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry FROM 
         Contact WHERE Id =: '0035j00000RMlkFAAT'];
    }

}