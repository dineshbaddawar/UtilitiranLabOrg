global class ContactRenderAsPDF {

    public String currentRecordId {get;set;}
    public contact ContactDetails {get;set;}
    
    global ContactRenderAsPDF(){
        ContactDetails = [SELECt Id,FirstName,LastName,Name,BirthDate,Date__c,Date_Time__c,Department,Description,MailingStreet,
                         MailingCity,MailingState FROM Contact WHERE Id ='0035j00000Nx0nUAAR'];
    }
}