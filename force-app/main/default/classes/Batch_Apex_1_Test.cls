@isTest
public with sharing class Batch_Apex_1_Test {
   @isTest Static void ValidateData(){
      
    Opportunity opp = new Opportunity(Name='Apex',StageName = 'Prospecting',CloseDate = System.today());
    insert opp;
    opp =[SELECT Name,StageName,CloseDate,Amount FROM Opportunity WHERE Name = 'Apex'];
    Database.executeBatch(new Batch_Apex_1());
    Opportunity op =[SELECT Name,StageName,CloseDate,Amount FROM Opportunity Where Name = 'Apex'];
    system.debug('The new Amount is--->'+op.Amount);
     // Code coverage 100%. Method 1
   }
    
}