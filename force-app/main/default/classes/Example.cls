public class Example {
    /*
    public static void Method(){
        for(Contact opp:[SELECT Id,FirstName FROM Contact]){
            if(opp.FirstName == null){
                opp.FirstName = 'Mr';
            }
            update opp;
        }
        
    } */
    
    public Static void Method1(){
        // Inserting 3 Account Record
        Insert new Account[]{new Account(Name='abc'),new Account(Name='abc'),new Account(Name='abc')};
            
            integer i=0;
        // Fetching Account Record where Name is acc
        for(Account tmp : [SELECT Id FROM Account WHERE Name ='abc']){ // this loop execute 3 times
            i++;
        }
        System.assert(i==3); // Checking how many time Loop executed
        System.debug(' i excutes----->'+i);
        
        
        i=0;
        Integer j;
        for(Account[] acc : [SELECT Id FROM Account WHERE Name ='abc']){ // this loop execute 1 time but record count will be same
            System.debug('the acc--->'+acc);
            j = acc.size();
            i++;
        }
        System.assert(j==3);
        System.assert(i==1);
        
        System.debug('i Execute--->'+i);
        System.debug('j Execute--->'+j);
    }
    
    public static void DateCheck(){
      
    }
}