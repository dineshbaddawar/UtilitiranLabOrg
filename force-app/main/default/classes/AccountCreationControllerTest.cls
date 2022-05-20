@isTest
public class AccountCreationControllerTest {

    public static testMethod void testAccountCreation(){
        Account accountObj = Test_DataFactory.prepareAccount(false);
        Test.startTest();
        AccountCreationController actCreationConObj = new AccountCreationController();
        actCreationConObj.actObj = accountObj;
        actCreationConObj.saveAccountRec();
        Test.stopTest();
        Account acc = [SELECT Id,Name FROM Account WHERE Name = 'Salesforce' LIMIT 1];
        System.assert(acc.id !=null);
    }
}