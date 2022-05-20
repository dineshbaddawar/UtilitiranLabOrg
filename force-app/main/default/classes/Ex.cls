public class Ex {

    /*
    public Static void Method(){
        Account acc = new Account();
        acc.Name = 'Account Assign';
        acc.Account_UID__c ='12345444678';
        insert acc;
            System.debug('accList====>'+acc);
        List<Account> accList = [SELECt Id,Account_UID__c FROM Account WHERE Id =:acc.Id];
        if(accList.size()>0){
             System.debug('accList====>'+accList);
        Task con = new Task();
        con.Subject ='Assign Subject';
        con.Priority = 'Low';
        con.search_by_value__c =acc.Account_UID__c;
        insert con;
         System.debug('accList====>'+con);
        }else{
            System.debug('The Error occured');
        }
       
    }
     */
    
    public static void Datacheck(){
      List<Student__c> StList =[SELECT Name,Email__c,Phone__c,Status__c FROM Student__c];
        for(Student__c acc : StList){
            if(acc.Email__c == null){
                acc.Email__c ='dbaddawar@gmail.com';
            }
            if(acc.phone__c == null){
                acc.phone__c = '1234567890';
            }
            if(acc.Status__c == null){
                acc.Status__c = 'New';
            }
        }
  update StList;
    }
}