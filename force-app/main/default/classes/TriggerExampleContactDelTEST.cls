@isTest
public class TriggerExampleContactDelTEST {

    public static testmethod void deleteContact(){
        // Store any string name
        String myname = 'Salesforce';
        // pass the string name as a input to account
        Account acc = new Account(name = myname);
        // pass lastname to contact as a string
        Contact con = new Contact(LastName ='Salesforce');
        insert con;
        // Find out the contact with same name as Account string myname
        Contact c = [SELECT Id,Name FROM Contact WHERE Name =:myname LIMIT 1];
        if(c != null){
            // Check whether the value of contact and account is similar
            system.assertEquals(c.Name, acc.Name);
            // delete the contact if its not null
            delete c;
        }
        // then lastly insert the Record
        insert acc;
    }
}