trigger TriggerExamplePrefixName on Account (before insert) {

    // for every new account
    for(Account acc:trigger.new){
        // append 'Mr.' with every account name
        acc.Name = 'Mr.'+acc.Name;
    }
}