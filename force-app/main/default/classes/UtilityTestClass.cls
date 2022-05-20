public class UtilityTestClass {

    public static Contact insertContact(String firstname, String lastname){
        Contact con = new Contact(FirstName = firstname, LastName = lastname);
        return con;
    }
    
    public static Account insertAccount(String name,String phone,Decimal Revenue){
        Account acc = new Account(Name = name, Phone = phone,AnnualRevenue = Revenue);
        return acc;
    }
   
}