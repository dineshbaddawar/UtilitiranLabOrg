@isTest
public class Test_DataFactory {

    public static Account prepareAccount(boolean isInsert){
        Account acc = new Account();
        acc.Name = 'Salesforce';
        acc.Industry = 'Energy';
        acc.Type = 'Other';
        if(isInsert){
            insert acc;
        }
        return acc;
    }
}