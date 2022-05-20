public class RetriveContacts {

    public List<Contact> contactList{get;set;}  
    public RetriveContacts(){
        contactList = [SELECT Id,FirstName,LastName,Phone FROM Contact WHERE FirstName != null];
    }
}