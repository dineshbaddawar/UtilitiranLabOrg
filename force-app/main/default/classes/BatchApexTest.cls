@isTest 
private class BatchApexTest {
    
    static testMethod void validateHelloWorld() {
      Test.startTest();
        	Account accRec = new Account(Name='Epson India');
        	insert accRec;
        	List<Contact> conList = [SELECT Id from Contact where LastName='Apex'];
        	//Database.executeBatch(new BATCH_APEX_2());
        	BATCH_APEX_2.CustomExcecute();
        	accRec = [SELECT Id,Name,Site from Account where Name='Epson India'];
        	System.debug('accRec.Site=>'+accRec.Site);
         
        	System.assertEquals('Salesforce.com', accRec.Site);
        	System.assertEquals([SELECT Id from Contact where LastName='Apex'].size(), conList.size()+1);
      Test.stopTest();
    
    }   
  
}