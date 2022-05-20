public with sharing class DemoTest_1 {
   
    // Method 1
    public static void Method1(Account acc){
      System.debug('Inside method 1');
      if(acc.name == 'Other Account'){
          acc.Website = 'Salesforce.com';
          update acc;
      }
    }

    public static void Method2(List<Account> accList){
        System.debug('Inside Method 2');
        accList = [SELECT Id,Name FROM Account];
    }
}