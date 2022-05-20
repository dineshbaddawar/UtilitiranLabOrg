@isTest
public with sharing class ContactTriggerTest {
   
    @testSetup static void setUpdata(){
        Contact conObj = new Contact();
        conObj.LastName = 'Test Contact';
        conObj.FirstName = 'Test Last';
        conObj.LeadSource = 'Web';
        conObj.IsPrimary__c = true;
        insert conObj;
    }

    public static testMethod void testCaseCreation(){
        Contact conObj = [SELECT Id,LeadSource FROM Contact LIMIT 1];
        conObj.LeadSource = 'Other';
        test.startTest();
        update conObj;
        test.stopTest();
      Case caseObj = [SELECT Id FROM Case WHERE ContactId =:conObj.Id];
      System.assert(caseObj.Id !=null);
    }

    public static testMethod void testPreventContactDeletion(){
        Contact conObj = [SELECT Id,IsPrimary__c FROM Contact LIMIT 1];
        test.startTest();
        Database.DeleteResult result = Database.delete(conObj,false);
        test.stopTest();
        System.assertEquals('IsPrimary__c Contact can not be Deleted', result.getErrors()[0].getMessage());
    }
}