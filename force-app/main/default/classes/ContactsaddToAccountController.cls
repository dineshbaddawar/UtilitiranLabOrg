public class ContactsaddToAccountController {
    @AuraEnabled
    public static List<contact> getContacts() {
        List<contact> totalList = new List<contact>();
        for(Contact cc : [SELECT Id,Name,Email from contact limit 20]){
            totalList.add(cc);
        }	
        return totalList;
    }
    
    @AuraEnabled
    public static void addParentAccount(String ParentId , List<String> lstOfContactIds){
        list<Contact> lstContacts = new list<Contact>();
        for(string sContactId : lstOfContactIds){
            Contact oContact = new contact();
            oContact.Id = sContactId;
            oContact.AccountId = ParentId;
            lstContacts.add(oContact);
        }
        update lstContacts;
    }
}