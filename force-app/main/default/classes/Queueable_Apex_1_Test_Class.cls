@isTest
public  class Queueable_Apex_1_Test_Class {
    
    @isTest static void ValidData(){
        
        Account acc = new Account();
            acc.Name = 'Test Account';   
           insert acc;
        System.enqueueJob(new Queueable_Apex_1());
        System.debug('The new updated value of Industry is--->'+acc);
        // code coverage 100%
     }
    }