@isTest
public with sharing class Future_Apex_1_Test_Class {
   @isTest static void ValidFututre(){
       Account acc = new Account(Name = 'apex');
       insert acc;
       Contact con = new Contact();
       con.LastName = 'Future';
       con.AccountId = acc.Id;
       insert con;
       Set<Id> IdSet = new Set<Id>();
       IdSet.add(acc.Id);

       Future_Apex_1.updateAccount(IdSet);
   }
}