public class AccountInsert {

    public static void InsertAccount(){
        Account acc= new Account();
        acc.Name='Salesforce CRM';
        System.debug('The Record before Inserting--->'+acc);
        insert acc;
        System.debug('The Record Id---->'+acc);
    }
}