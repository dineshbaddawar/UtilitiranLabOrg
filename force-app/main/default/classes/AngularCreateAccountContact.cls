public with sharing class AngularCreateAccountContact {

    @RemoteAction
    public static string createAccount(string name, string email, string phone)
    {
        try{

            Account accRec = New Account(Name=name, Email__c=email, Phone=phone);
            insert accRec;
            return accRec.Id;

        }catch(Exception e)
        {
            return e.getStackTraceString();
        }
    }

    @RemoteAction
    public static string createContact(string firstname, string lastname, string email, string accountId)
    {
        try{

            Contact conRec = New Contact(FirstName=firstname, LastName=lastname, Email=email, AccountId=accountId);
            insert conRec;
            system.debug('contact : ' +conRec);
            return conRec.Id;

        }catch(Exception e)
        {
            return NULL;
        }
    }
}