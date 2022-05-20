trigger AccountTypeUpdate on Account (before insert) {

    for(Account acc:trigger.new){
        if(acc.Type == 'Prospect'){
            acc.Website = 'Salesforce';
        }else if(acc.AccountNumber == null){
            acc.AccountNumber ='1235645678';
        }else{
            acc.Description = 'Updated Description';
        }
        
        
    }
}