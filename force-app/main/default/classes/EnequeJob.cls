public class EnequeJob  implements Queueable   {
 
    public integer startIndex;
    public integer endIndex;
    public EnequeJob(Integer startIndex, integer endIndex){
        this.startIndex = startIndex;
        this.endIndex = endIndex;
    }
   
    public void Execute(QueueableContext bc){
        List<Account> accListToBeInserted = new List<Account>();
        for(Integer i=startIndex; i<endIndex;i++){
            Account acc = new Account();
            acc.Name = 'Test Account'+i;
            accListToBeInserted.add(acc);
        }
        System.debug('accListToBeInserted--->'+accListToBeInserted);
        System.debug('accListToBeInserted Size---->'+accListToBeInserted.size());
        
        if(!accListToBeInserted.isEmpty()){
            insert accListToBeInserted;
        }
        if(endIndex < 2000){
            startIndex = endIndex;
            endIndex = endIndex + 500;
            System.enqueueJob(new EnequeJob(startIndex,endIndex));
        }
    }
    
    // Using the Future Method
    @future
    public static void FutureMethod(Integer startIndex, Integer endIndex){
        List<Account> accListToBeInserted = [SELECT Id FROM Account LIMIT 2];
        System.debug('the accListToBeInserted--->'+accListToBeInserted);
        for(integer i = startIndex;i<endIndex;i++){
            account acc = new account();
            acc.Name = 'testing'+i;
            accListToBeInserted.add(acc);
        }
        System.debug('The accListToBeInserted---->'+accListToBeInserted);
        System.debug('the accListToBeInserted Size--->'+accListToBeInserted.size());
        
        if(!accListToBeInserted.isEmpty()){
            insert accListToBeInserted;
        }
    }
 }
    








































   
    /*
    // CPU LIMIT Exception Error.
    public static void UpdateAcc(){
  List<Account> accList = [SELECT Id,Name FROM Account LIMIT 100];
        for(Account acc:accList){
            acc.Name= 'Update';
            update accList;
            UpdateAcc();
        }
        
    }
     */
    
    
    
    
    
    
    
    
    
    /*
   @future
    public static void Method(){
        
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<=30000;i++){
            Account acc = new Account();
            acc.Name= 'Test Account'+i;
            accList.add(acc);
        }
        insert accList;  
        System.debug('the accList size-->'+accList.size());
    }
   
   
    
    
    public static void Datee(){
        for(Integer i=0;i<=100;i++){
            for(Integer j=1;j<=1000;i++){
                Contact con = new Contact();
                con.lastname = ' Foxit '+j;
                insert con;
            }
             Account acc = new Account();
        acc.Name = 'Extra'+i;
        insert acc;
        }
       
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 /*
    Public List<Account> accList;
    public Example(List<Account> accList1){
        this.accList = accList1;
    }
    
    public void Execute(QueueableContext bc){
        for(Account acc:accList){
            // update the account Name
            acc.Name = 'Sir '+acc.Name;
        }
        update accList;
   
    
    public static void updateData(){
        Account acc =[SELECT Id,Name FROM Account WHERE Name = 'Sir Sir Anajalis Singh Account Created'];
        System.debug('the Account Name Before Is--->'+acc.Name);
        String s1 = acc.Name;
        String target = 'Sir';
        String replacement = '';
        String s2 = s1.replace(target, replacement);
        System.debug('the Account Name S2--->'+s2);
    }  
} 
*/