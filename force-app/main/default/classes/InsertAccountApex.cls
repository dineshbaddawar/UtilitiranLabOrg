public with sharing class InsertAccountApex {
  // https://www.salesforcetutorial.com/using-css-javascript-in-visualforce-examples/  
    public Pagereference AccInsert(){
        Account acc = new Account();
        acc.Name = 'Dinesh Singh';
        acc.Phone = '1234567890';
        acc.Email__c = 'dineshbaddawar@gmail.com';
        insert acc;

        Pagereference ref = new Pagereference('/apex/insertdlttest');
        ref.setredirect(true);
        return ref;
    }

    public string namevalue {get;set;}
    public string phonevalue {get;set;}
    public string emailvalue {get;set;}  
}
