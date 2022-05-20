trigger TriggerScenario_Examples on Lead (before insert) {

    /*
     
    # UseCase 1

 trigger ContactAccountRelation on Contact (before insert) {

// when a new contact is created for a existing account then set contact otherphone as account phone.

    Set<Id> IdSet=new Set<Id>();
    for(Contact con:trigger.new){
        if(con.AccountId !=null){
            IdSet.add(con.AccountId);
        }
    }

        if(IdSet.size()>0){
            Map<Id,Account> AccMap= new Map<Id,Account>([Select Id,Phone From Account Where Id IN:IdSet]);
            for(Contact con:trigger.new){
                if(con.AccountId !=null && AccMap.containsKey(con.AccountId)){
                    if(AccMap.get(con.AccountId).Phone !=null){
                        con.OtherPhone=AccMap.get(con.AccountId).Phone;
                    }
                }
            }
        }
    
}



# UseCase 2

trigger OpportunityAccountRelation on Opportunity (before insert) {

    // when a new Opportunity is created for a existing account then set Opportunity Amount as Account AnnualRevenue.

    Set<Id> IdSet=new Set<Id>();
    for(Opportunity opp:trigger.new){
        if(opp.AccountId !=null){
            IdSet.add(opp.AccountId);
        }
    }

    if(IdSet.size()>0){
        Map<Id,Account> accMap=new Map<Id,Account>([Select Id,AnnualRevenue From Account Where Id IN:IdSet]);
        for(Opportunity opp1:trigger.new){
            if(opp1.AccountId !=null && accMap.containsKey(opp1.AccountId)){
                if(accMap.get(opp1.AccountId).AnnualRevenue !=null){
                    opp1.Amount=accMap.get(opp1.AccountId).AnnualRevenue;
                }
            }
        }
    }
}



# UseCase 3

trigger AccountUpdateUsingContact on Contact (after insert) {

// when a new Contact is created for a existing account then set Account Phone as Contact OtherPhone.

    List<Account> accList=new List<Account>();
    for(Contact con:trigger.new){
        Account acc=[Select Id,Phone From Account Where Id =:con.AccountId];
        acc.phone=con.otherphone;
        accList.add(acc);
    }
    update accList;
}


# UseCase 4


trigger AccountUpdateUsingOpportunity on Opportunity (after insert) {

    // when a new Opportunity is created for a existing account then set Account AnnualRevenue as Opportunity Amount.

    List<Account> accList=new List<Account>();
    for(Opportunity opp:trigger.new){
        Account acc=[Select Id,AnnualRevenue From Account Where Id =:opp.AccountId];
        acc.AnnualRevenue=opp.Amount;
        accList.add(acc);
    }
    update accList;
}


# UseCase 5


trigger Contact_Duplicate_Trigger on Contact (before insert) {

    
    
    // Write a trigger on contact to prevent duplicate records based on Contact Email & Contact Phone.
    
    // Method 1
    
    List<String> EmailSet=new List<String>();
    List<String> PhoneSet=new List<String>();
    
    for(Contact con:trigger.new){
        EmailSet.add(con.Email);
        PhoneSet.add(con.Phone);
    }
    
    List<Contact> conList=[Select Id,Email,Phone From Contact Where Email IN:EmailSet AND Phone IN:PhoneSet];
    
    for(Contact con:trigger.new){
        if(conList.size()>0){
            con.addError('Duplicate Email & Phone found while inserting The Contact');
        }
    }
    
    
    // Method 2
    
    Set<String> setEmailPhoneKeys = new Set<String>();
    Set<String> SetEmail = new Set<String>();
    Set<String> SetPhone = new Set<String>();
    
    for(Contact conObj : trigger.new){
        if(conObj.Email !=null && conObj.Phone !=null){
            SetEmail.add(conObj.Email);
            SetPhone.add(conOBj.Phone);
        }
    }
    
    for(Contact conList:[Select Phone,Email From Contact Where Phone IN:SetPhone AND Email IN:SetEmail]){
        setEmailPhoneKeys.add(conList.Email + '-' +conList.Phone);
    }
    
    for(Contact con:trigger.new){
        if(con.Email !=null && con.Phone !=null){
            String Key = con.Email + '-' +con.Phone;
            if(setEmailPhoneKeys.contains(Key)){
                con.addError('Duplicate Contact Exists !');
            }
        }
    }



# UseCase 6

trigger AccountDuplicateTrigger on Account (before insert,before update) {
 
    // Method 2
    
    List<String> accList=new List<String>();
    for(Account acc:trigger.new){
        accList.add(acc.Name);
    }
    
    List<Account> ListOfDuplicateAccount=[Select Id,Name From Account Where Name IN:accList];
    for(Account acc1:trigger.new){
        if(trigger.isInsert){
            if(ListOfDuplicateAccount.size()!=0){
                acc1.addError('Duplicate Account Found In the Database');
            }
        }
        
        if(trigger.isUpdate){
            for(Account oldAccount:trigger.old){
                if(acc1.Name !=oldAccount.Name && ListOfDuplicateAccount.size() !=0){
                    acc1.addError('Account Already Exist In The Database');
                }
            }
        }
    }
}



# UseCase 7

trigger U_RecersiveTrigger_Contact on Contact (after insert) {

    // Recursive Trigger
    
    
    if(trigger.isAfter && trigger.isInsert){
        Contact con=new Contact(FirstName='Ajeet',LastName='Agarkar');
        insert con;
    }
    
    // Solution for Recursive Trigger
    
    if(trigger.isInsert && trigger.isAfter){
        
        if(U_RecersiveTrigger_Contact_Handler.condition){
            U_RecersiveTrigger_Contact_Handler.condition=false;
            Contact con=new Contact(FirstName='Amar',LastName='Singh');
            insert con;
        }
    }
}




# UseCase 8


trigger U_RecersiveTrigger_Account on Account (after update) {

    
    // Recursive Trigger Example
    
    if(trigger.isAfter && trigger.isUpdate){
       
      Id accId;
        for(Account acc:trigger.new){
            accId=acc.id;
        }
        
        Account accList=[Select Id,Name From Account Where Id !=:accId Limit 1];
        accList.site='salesforce.com';
        Update accList;
    }
    
    // Solution of Above Example
    
    if(!U_RecersiveTrigger_1Handler.condition){
        U_RecersiveTrigger_1Handler.condition=true;
        
        Id accId;
        for(Account acc:trigger.new){
            accId=acc.id;
        }
        
        Account accList=[Select Id,Name From Account Where Id !=: accId Limit 1];
        accList.Description='Updated Description';
        update accList;
    }
}


# UseCase 9

// Write a trigger  on contact and show Max and Min salary of contact on associated account.

trigger MinMaxSalaryContactOnAccount on Contact (after insert,after update,after delete) {

    List<Account> accList=new List<Account>();
    Set<Id> IdSet=new Set<Id>();
    List<Account> ListAcc=new List<Account>();
    
    if(trigger.isInsert){
        if(trigger.new !=null){
            for(Contact con:trigger.new){
                if(con.AccountId !=null){
                    IdSet.add(con.AccountId);
                }
            }
        }
    }
    
    if(trigger.isDelete){
        for(Contact con:trigger.old){
            IdSet.add(con.AccountId);
        }
    }
    
    if(trigger.isUpdate){
        for(Contact con:trigger.new){
            if(con.AccountId !=trigger.oldmap.get(con.Id).AccountId){
                IdSet.add(con.AccountId);
                IdSet.add(trigger.oldmap.get(con.Id).AccountId);
            }
            if(con.Salary__c !=trigger.oldmap.get(con.Id).Salary__c){
                IdSet.add(con.AccountId);
            }
        }
    }
    
    ListAcc=[Select Id,Max_Salary__c,Min_Salary__c,(Select Id,Salary__c,AccountId From Contacts) From Account Where
            Id IN:IdSet];
    for(Account acc:ListAcc){
        if(acc.Contacts.size()>0){
            acc.Max_Salary__c =acc.Contacts[0].Salary__c;
            acc.Min_Salary__c=acc.Contacts[0].Salary__c;
        }else{
            acc.Max_Salary__c=0;
            acc.Min_Salary__c=0;
        }
        
        for(Contact con:acc.Contacts){
            for(Integer i=0;i<acc.Contacts.size();i++){
                Decimal Value=acc.Contacts[i].Salary__c;
                
                if(acc.Max_Salary__c > Value){
                    acc.Max_Salary__c=acc.Max_Salary__c;
                }else{
                    acc.Max_Salary__c=Value;
                } 
                
                if(acc.Min_Salary__c < Value){
                    acc.Min_Salary__c=acc.Min_Salary__c;
                }else{
                    acc.Min_Salary__c=Value;
                }
            }
        }
        accList.add(acc);
    }
    if(accList.size()>0){
        update accList;
    }
}


# UseCase 5


    */


}