trigger TriggerAccountInsert on Account (before insert) {
//  Preventing from inserting duplicate Name.
    // Checking all the new account record in for Loop
    for(Account acc:trigger.new){
        // Query
        List<Account> accList = [SELECT Id,Name FROM Account Where Name =:acc.Name];
        if(accList.size()>0){
            // add Error message if there us record after querying
            acc.Name.addError('Account with Name is Existing');
        }
    }
}