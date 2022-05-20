@isTest
public with sharing class AccountWithOppsTest {
    
    // testSetUp: create all required dummy data
    @testSetUp 
    public static void setUpData(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.NumberOfEmployees= 2;
        insert acc;
    }

    @isTest 
    public static void TestOpp(){
        Account acc = [SELECT Id,Name,NumberOfEmployees,(SELECT Name FROM Opportunities) FROM Account WHERE Name = 'Test Account'];
        System.debug('Opportunities Size--->'+acc.Opportunities.size());
        System.assertEquals(acc.Opportunities.size(), 2);
    }
}