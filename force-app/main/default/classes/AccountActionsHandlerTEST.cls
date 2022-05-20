@isTest
public with sharing class AccountActionsHandlerTEST {
     
    public static testMethod void TestCreateContact(){
        Account acc = new Account();
        acc.Name = 'Salesforce';
        acc.Industry = 'Energy';
        acc.Type = 'Other';
        test.startTest();
        insert acc;
        test.stopTest();
        Contact con = [SELECT AccountId,Name FROM Contact WHERE AccountId =:acc.Id];
        System.assert(con.Id !=null);
    }

    public static testMethod void TestCreateOpportunity(){
        Account acc = new Account();
        acc.Name = 'SFDC';
        acc.Industry = 'Education';
        acc.Rating = 'Hot';
        insert acc;
        test.startTest();
        acc.Rating = 'Warm';
        update acc;
        test.stopTest();
        Opportunity opp = [SELECT Id,Name FROM Opportunity WHERE AccountId = :acc.id];
        System.assert(opp.id !=null);
    }
}