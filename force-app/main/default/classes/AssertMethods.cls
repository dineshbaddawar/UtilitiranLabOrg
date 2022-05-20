public with sharing class AssertMethods {
   
    public static void DMLTest(){
        List<Account> accList = [SELECT Id FROM Account];
        System.debug('Before Assert');
        System.assert(!accList.isEmpty());

        Account testAccount = new Account(Name='Dinesh B');
        insert testAccount;
        System.debug('After Insert Account');
        accList = [SELECT Id FROM Account];
        System.debug('Before AssertNotEquals');
        System.assertNotEquals(0, accList.size(),'It is Success');

        System.debug('After Account Delete');
        delete accList;
        accList = [SELECT Id FROM Account];
        System.debug('Before AssertEquals');
        System.assertEquals(0, accList.size());
    }
}