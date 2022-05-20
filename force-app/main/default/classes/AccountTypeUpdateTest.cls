@isTest
public with sharing class AccountTypeUpdateTest {
    
    @isTest 
    public static void Method(){

        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.Type = 'Prospect';
        accList.add(acc);
       
        Account acc1 = new Account();
        acc1.Name = 'Test Account1';
        acc1.Type = 'Other';
        acc1.AccountNumber = '12345678';
        accList.add(acc1);

        try{
              insert accList;
        }
        Catch(Exception e){
            System.debug('The Message-->'+e.getMessage());
        }
       
 
    }
}