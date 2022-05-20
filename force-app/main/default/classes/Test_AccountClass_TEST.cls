@isTest
public with sharing class Test_AccountClass_TEST {
   
    @isTest
    static void ValidateTest(){
        Account acc = new Account(Name='Dinesh',AnnualRevenue = 99);
        test.startTest();
        insert acc;
        test.stopTest();

        // Retriving the Records
         acc = [SELECT Id, Name,AnnualRevenue FROM Account WHERE Id =:acc.Id];
         // Test that the trigger correctly updated the AnnualRevenue
         System.assertEquals(90000, acc.AnnualRevenue);
    }
}