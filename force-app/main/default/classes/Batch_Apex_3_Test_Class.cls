@isTest
public with sharing class Batch_Apex_3_Test_Class {
    
    @isTest
    private Static void testContactName(){
        // Load Test Data
        List<Contact> con = new List<Contact>();
        for(Integer i=0;i<=200;i++){
            con.add(new Contact(LastName = 'LastName'));
        }
        insert con;
      // perfor Test
      Test.startTest();
      Batch_Apex_3 var = new Batch_Apex_3();
      Id BatchId = Database.executeBatch(var,200);
      Test.StopTest();

      // Check Result  // 100% Code Coverage Giving
      List<Contact> updateContact = [SELECT Id FROM Contact WHERE LastName = 'DreamForce'];
      System.assertEquals(201, updateContact.size(),'Error: at 1 Contact Record not updated Correctly');
    }
    
}