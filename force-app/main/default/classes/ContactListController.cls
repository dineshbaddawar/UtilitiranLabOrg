public class ContactListController {

    @AuraEnabled
    public Static List<Contact> getContacts(String accountId){
        return [Select Id,FirstName,LastName,Email,Phone From Contact WHERE  AccountId =:accountId];
    }
}