@isTest
public class AccountTestClass {

  
     static testMethod void ValidateDate(){
       Test.startTest();
        
        Account acc = UtilityTestClass.insertAccount('Dummy','3456789',11000);
        insert acc;
        Account Query = [SELECT Id,Name,AnnualRevenue FROM Account WHERE Name = 'Dummy'];
        System.debug('The Account Name is-->'+Query.Name);
        System.debug('The AnnualRevenue is -->'+Query.AnnualRevenue);
        System.assertEquals(Query.AnnualRevenue, 11000);
       Test.stopTest();
    }
}