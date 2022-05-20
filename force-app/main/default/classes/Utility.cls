public class Utility {
     
    public static Account newAccount(String name, String phone){
        Account acc = new Account(Name = name, Phone = phone);
        return acc;
   }

   public static Contact newContact(String firstname, String lastname,String email,String Phone){
       Contact con = new Contact(LastName = lastname, FirstName = firstname,Email = email, Phone = phone);
       return con;
   }

   public static Opportunity newOpp(String name, String stagename,Date closedate,Decimal amount){
       Opportunity opp = new Opportunity(Name = name, StageName = stagename, CloseDate = closedate,Amount = amount);
       return opp;
   }
}