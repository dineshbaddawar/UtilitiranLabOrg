trigger TriggerExampleContactDel on Account (before insert) {

    // define list to store all the new account names
    List<String> mynames = new List<String>();
    // bulkifying for every new account record
    for(Account acc:trigger.new){
        // add all account name in the list
        mynames.add(acc.Name);
    }
    // Query to get all the list of contacts where Name like inside mynames
    List<Contact> mycontacts = [SELECT Id,Name FROM Contact WHERE Name IN : mynames];
    // delete all the mycontacts list from salesforce
    delete mycontacts;
}