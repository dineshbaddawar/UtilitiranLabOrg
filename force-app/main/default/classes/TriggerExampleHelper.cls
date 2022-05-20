public class TriggerExampleHelper {
    // Whenever we insert account, it will insert contact with it.
    Public static void InsertAcc(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account acc:accList){
            Contact con = new Contact();
            con.AccountId = acc.id;
            con.FirstName = 'Mr';
            con.LastName = acc.Name;
            conList.add(con);
        }
        insert conList;
    }
}