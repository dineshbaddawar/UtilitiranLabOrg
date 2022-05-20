@isTest
public class TriggerExamplePrefixNameTEST {

    public static testmethod void testinsert(){
        // Create new Account
        Account acc = new Account(Name='Fabien Allen');
        acc.Name = 'Mr.'+acc.Name;
        insert acc;
    }
}