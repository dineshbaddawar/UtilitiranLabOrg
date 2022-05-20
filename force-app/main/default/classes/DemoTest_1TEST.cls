@isTest
public with sharing class DemoTest_1TEST {
   
    // Creating Datasetup method to create Dummy Data
    @TestSetup
    static void makeData(){
        Account acc = new Account();
        acc.Name = 'test Account1';

        Account acc1 = new Account();
        acc1.Name = 'test Account2';
        acc1.Website = 'SFDC.com';

        insert acc;
        insert acc1;
    }
    
    @isTest 
    public static void testMethod1(){
         Account acc = [SELECT Id,Name FROM Account WHERE Name = 'test Account1'];
         DemoTest_1.Method1(acc);
    }

    @isTest 
    public static void testMethod2(){
        List<Account> accList = [SELECT Id,Name,Website FROM Account];
        DemoTest_1.Method2(accList);
    }
}