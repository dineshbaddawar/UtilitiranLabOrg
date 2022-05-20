@isTest
public with sharing class Future_Apex_2_Test_Class {
    
    public static testMethod void updateDate(){

        Account acc = new Account(Name='Apex');
        insert acc;
        acc = [SELECT Name FROM Account WHERE Name = 'Apex'];
        System.debug('The Account Before Method Name is---->'+acc.Name);
        Future_Apex_2.Method();
        System.debug('The Account After Method Name is---->'+acc.Name);
    }
    
}