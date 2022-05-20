trigger Account_Trigger_Examples on Account (before insert,before update,before delete,after insert,after delete,after undelete) {

    // Trigger for avoding duplicate Account Record.
   /* Method 1
    for(Account acc:trigger.new){
      List<Account> accList=[SELECT Id,Name FROM Account Where Name =:acc.Name];
      if(accList.size()>0){
          acc.Name.addError('Duplicate Account Found Database');
      }
    }
    

    // Method 2

    List<Account> accObj = [SELECT Id,Name FROM Account];
    Map<String,Account> accMap = new Map<String,Account>();
    for(Account ac:trigger.new){
        accMap.put(ac.Name,ac);
    }

    for(Account acc:trigger.new){
        if(accMap.containsKey(acc.Name)){
            acc.addError('Account already Exist in the database');
        }
    }

    

    // Method 3

    Set<String> SetName = new Set<String>();
    for(Account acc:trigger.new){
        SetName.add(acc.Name);
    }

    if(SetName.size()>0){
        List<Account> accList = [SELECT Id,Name FROM Account WHERE Name IN:SetName];
        Map<String,Account> MapNameWiseAccount = new Map<String,Account>();
        for(Account acc:accList){
            MapNameWiseAccount.put(acc.Name,acc);
        }

        For(Account acc:trigger.new){
            if(MapNameWiseAccount.containsKey(acc.Name)){
                acc.Name.addError('While Inserting & Updating Account Name is already present in the database');
            }
        }
    }
   

    // Method 4

   Set<String> setName = new Set<String>();   
    Map<String,Integer> accnamesVsCount = new Map<String,Integer>();
    For(Account acc : trigger.new)        
    {      
        if(accnamesVsCount.containsKey(acc.Name))
            acc.addError('Account Name is already exists');
        else
            accnamesVsCount.put(acc.Name,1);
        setName.add(acc.name);
    }
    if(setName.size() > 0 )
     {        
        List<Account> lstAccount = [select name ,id from account where name in :setName ];
        Map<String ,Account> mapNameWiseAccount = new Map<String,Account>();        
        For(Account acc: lstAccount)            
        {            
            mapNameWiseAccount.put(acc.name ,acc);            
        }
         
         system.debug(mapNameWiseAccount.size());
        For(Account acc : trigger.new)            
        {            
            if(mapNameWiseAccount.containsKey(acc.name))
            {
                acc.Name.addError('Name already Exist ');
            }
         }
        }
          */
     
    // if Account has related Contact , then if delete that Account it has to throw an error before deleting Account Record.
    // Method 1
    /*
       for(Account acc:[SELECT Id,Name From Account WHERE ID IN(SELECT AccountId FROM Contact) AND ID IN:trigger.old]){
        trigger.oldmap.get(acc.Id).addError('Account can not be deleted if it has related Contact');
    } 
     
    
    // Method 2
    for(Account acc : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Contact) AND Id IN :Trigger.oldMap.KeySet()]){
        Trigger.oldMap.get(acc.Id).adderror('Account cannot be deleted if it has related Contacts');
    }
    */

    /*
    List<Opportunity> oppList = new List<Opportunity>();
    if(trigger.isAfter){
        if(trigger.isInsert){
            
            for(Account acc:trigger.new){
                if(acc.AnnualRevenue > 10000){
                    Opportunity opp = new Opportunity();
                    opp.Name = acc.Name;
                    opp.AccountId = acc.Id;
                    opp.CloseDate = system.today();
                    opp.StageName ='Prospecting';
                    oppList.add(opp);
                }
            }
            insert oppList;
        }
    }  */
    
    }