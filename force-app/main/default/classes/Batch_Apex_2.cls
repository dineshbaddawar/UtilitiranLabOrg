public  class Batch_Apex_2 implements Database.Batchable <sObject> {
    
   public Integer totalSize = 0;
    public Database.QueryLocator Start(Database.BatchableContext bc){
        String var = 'SELECT id,Name,Fax,Email,MobilePhone,Description,Account.Name,Account.Fax,Account.Rating,Account.Phone,Account.Industry From Contact Where AccountId!=NULL';
        return Database.getQueryLocator(var);
    }
    
    public void Execute(Database.BatchableContext bc, List<contact> conList){

        Integer size = conList.size();
        totalSize = totalSize + size;
          for(Integer i=0;i<size;i++){
              contact con = conList.get(i); 
              if(con.Fax == NULL){
                con.Fax = con.Account.Fax;
              }

              if(con.MobilePhone == null){
                con.MobilePhone = con.Account.Phone;
              }

              if(con.Email == null){
                con.Email ='dineshbaddawar@gmail.com';
                con.Description = Account.Name +' '+Account.Rating+' '+Account.Industry;
            }
          } 
          update conList;
 }

 public void Finish(Database.BatchableContext bc){ 
     Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
     string[] toaddresses = new string[]{'isha.raj@utilitarianlab.com'};
     message.setToAddresses(toaddresses);
     message.setSubject('Contact Updated');
     message.setPlainTextBody('Congratulation....!');
     Messaging.sendEmail(new Messaging.SingleEmailMessage[]{message});
 }
}