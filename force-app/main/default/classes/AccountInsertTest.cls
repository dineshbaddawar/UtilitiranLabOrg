@isTest
private class AccountInsertTest {

    static testMethod void TestAccount(){
        Test.startTest();
        Account acc=new Account();
        acc.Name='Test Account';
        insert acc;
        AccountInsert.InsertAccount();
        System.assertEquals('Test Account', acc.Name);
        Test.stopTest();
    }
}