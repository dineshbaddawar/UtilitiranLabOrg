@isTest
public with sharing class Schedulable_Apex_1_Test_Class {
    
    @isTest static void  validateData(){
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
        System.debug('The account name---->'+acc);

        Schedulable_Apex_1 job = new Schedulable_Apex_1();
        String CRONEXP = '0 10 10 2 * ? ';
        String jobId = system.schedule('var', CRONEXP, job);
        System.debug('This job will run every month on 2nd at 10.10 AM'+jobId);
      
    }
    
}