public class Need_To_Learn {

    /*
 
public class MapClass
{
    public Boolean mapContainKeyCheck()
    {
        Map<Integer, String> m1=new Map<Integer, String>{1=>'Owner',2=>'Account'};
        m1.put(3,'Beneficiary');
        m1.put(4,'Lead');
        Map<Integer, String> m2=new Map<Integer, String>(m1);
        //system.debug(m1.get(4));
        //return m1.equals(m2);
        //return m1.containsKey(8);
        return m1.isEmpty();
    }
    public void getAllKeyValuePair()
    {
        /*Map<Integer, String> m1=new Map<Integer, String>{1=>'Owner',2=>'Account',3=>'Contact', 4=>'Lead', 5=>'Opportunity'};
        m1.put(3,'Beneficiary');
        m1.put(4,'Leadzz');
        Map<Integer, String> myMapRec=new Map<Integer, String>(m1);
        
        for(Integer key:myMapRec.keyset())
        {
            system.debug(myMapRec.get(key));
        }*/
        
    /*
        Account[] accs=[SELECT Name, Phone FROM Account LIMIT 10];
        
        List<Account> acc=new List<Account>();
        acc=[SELECT Industry FROM Account LIMIT 10];
        
        Map<Integer, List<Account>> mRec=new Map<Integer, List<Account>>{1=>accs, 2=>acc};
        for(Integer key:mRec.keyset())
        {
            if(key==1)
            {
                for(Account getName:accs)
                { system.debug('KEY: '+ key + '  VALUE: ' + getName); }
            }
            else if(key==2)
            {
                for(Account getIndustry:acc)
                { system.debug('KEY: '+ key + '  VALUE: ' + getIndustry.Industry ); }
            }
        }
    }
    
    public void getContactListByAccount()
    {
        Map<Account,List<Contact>> contactListByAccountRec = new Map<Account,List<Contact>>();
        for(Account accRec : [Select id,Name,(Select Id,Name,FirstName,LastName from Contacts) from Account])
        {
                contactListByAccountRec.put(accRec,accRec.Contacts);
                system.debug('Contact List of '+ accRec.Name + ': '+ accRec.Contacts);
        }
        /*for(Account getValueByKey: contactListByAccountRec.keyset())
        {
            system.debug(contactListByAccountRec.get(getValueByKey));
        }*/
    }
    /*
    public void mapByMap()
    {
        Map<Integer, Map<Account, List<Contact>>> getMapOfMap = new Map<Integer, Map<Account, List<Contact>>>();
        
        Map<Account, List<Contact>> getSubList= new Map<Account, List<Contact>>();
        
        for(Account accDetails: [SELECT Name, Id, (SELECT FirstName, LastName FROM Contacts) FROM Account])
        {
            getSubList.put(accDetails, accDetails.Contacts);
        }
        getMapOfMap.put(1, getSubList);
        system.debug(getMapOfMap);
    }
}



==================================================================

public class VigneshAssignment 
{
    //Question-1 : Concatenate 2 strings
    public static String firstName;
    public static String lastName;
    public static String stringConcatenation(String fname,String lname) 
    {
        firstName=fname;
        lastName=lname;
        String Str = String.valueOf(fname) + String.valueOf(lname);
        system.debug('Str----'+Str);
        return Str;
    }
    
    //Question-2: return date from day, month and year
    public static Integer day;
    public static String month;
    public static Integer year;
    public VigneshAssignment(Integer d, String m, Integer y) 
    {
        day=d;
        month=m;
        year=y;
    }
    public Double showDate()
    {
        
        system.debug('Today Date is: ' + day);
        return day;
    }
    public Integer dayz(Integer day, Integer month, Integer year)
    {
        date myDate = date.newInstance(day,month,year);
        Integer dayz = myDate.day();
        return dayz;
    }
    
    //Question-3 : return Boolean value based on condition
    public static Boolean returnBoolean(String color) 
    {
        if(color =='green')
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    //Question-4: calculate string list size
    public Integer getSizeFunction( List <String> strList) 
      {
             return strList.size();
      }    
      /*List <string> myList = New List<string>{'dskf','sldfk','fer','ewrwe'};
      system.debug(myList.size());
    
      public void getSizeFunction( List <Integer> intList) 
      {
        Integer sum=0;
        for(Integer i: intList )
        {
            system.debug(i);
            sum=sum+i;
        }
          system.debug('The same of the entered numbers is: '+sum);
      }
    
    //Question-5: Create a Non-Parameterized Constuctor that assigns some value
    public VigneshAssignment()
    {
        String Name='Jon Doe';
        Integer rollNo=10;
        System.debug('Name: ' + Name + 'Roll No: ' + rollNo);
    }
    
    //Question-6: Create a Parameterized Constuctor that changes the value
    public VigneshAssignment(String n, Integer rNo)
    {
        String Name=n;
        Integer rollNo=rNo;
        System.debug('Name: ' + Name + 'Roll No: ' + rollNo);
    }  
} */

/*
public class KishanAssignmentOnCustomObject 
{
    public void fetchTestRecords_1(string testId1)
    {
        List<Test7__c> getList=new List<Test7__c>();
        getList=[SELECT OwnerId, Name, 
                 Test5__r.Name,
                 Test5__r.Test2__r.Name,
                 Test5__r.Test2__r.Test1__r.Name FROM Test7__c 
                 WHERE Test5__r.Test2__r.Test1__c =: testId1];     //Child to Parent(API)
        system.debug('Fetching the Records of Assignment 1: '+getList);
        for(Test7__c iterateOverElement:getList)
        {
           system.debug('Records of Test5 Found: '+iterateOverElement.Test5__r);
           system.debug('Records of Test2 Found: '+iterateOverElement.Test5__r.Test2__r);
           system.debug('Records of Test1 Found: '+iterateOverElement.Test5__r.Test2__r.Test1__r);
        }
        
    }
    
    public void fetchTestRecords_2(string testId1)
    {
        List<Test1__c> getList=new List<Test1__c>();
        getList=[SELECT OwnerId, Name,(SELECT OwnerId, Name FROM Test2s__r ),(SELECT OwnerId, Name FROM Test4s__r )FROM Test1__c WHERE Id=:testId1];  //Parent to child(CRN)
        system.debug('Fetching the Records of Assignment 2: '+getList);
        //system.debug('Fetching the Records of Assignment 2: '+getList[0].Test2s__r);
        //system.debug('Fetching the Records of Assignment 2: '+getList[0].Test4s__r);
        for(Test1__c iterateOverElement:getList)     //Parent API Name
        {
            //system.debug('Fetching the Records of Assignment 2: '+oLoop.Test2s__r);
            //system.debug('Fetching the Records of Assignment 2: '+oLoop.Test4s__r);
            for(Test2__c testRec : iterateOverElement.Test2s__r) 
            {
                System.debug('Records of Test2 Found: '+testRec);
            }
            
            for(Test4__c testRec : iterateOverElement.Test4s__r) 
            {
                System.debug('Records of Test4 Found: '+testRec);
            }
            
        }
    }
    
    public void fetchTestRecords_3(string testId1)
    {
        List<Test6__c> getList=new List<Test6__c>();
        getList=[SELECT Name,OwnerId,
                 Test4__r.Name, 
                 Test4__r.Test1__r.Name,Id FROM Test6__c 
                 WHERE Test4__r.Test1__c=:testId1];              //Child To Parent(API)
        system.debug('Fetching the Records of Assignment 3: '+getList);
        
        for(Test6__c iterateOverElement: getList)
        {
            if(iterateOverElement.Test4__r!=NULL)
            {
               system.debug('Records of Test4 Found: '+iterateOverElement.Test4__r);
            }
            if(iterateOverElement.Test4__r.Test1__r!=NULL)
            {
                system.debug('Records of Test1 Found: '+iterateOverElement.Test4__r.Test1__r);
            }
        }
        
    }
    public void fetchTestRecords_4(string testId4)
    {
        List<Test5__c> getList=new List<Test5__c>();
        getList=[SELECT OwnerId,test2__r.Name, 
                 test2__r.test3__r.Name, 
                 test2__r.test3__r.test6__r.test4__r.Name FROM Test5__c 
                 WHERE test2__r.test3__r.test6__r.test4__c=:testId4];    
        System.debug('Fetching the Records of Assignment 4: '+getList);
        for(Test5__c iterateOverElement: getList)
        {
            system.debug('Records of Test2 Found: '+iterateOverElement.test2__r);
            system.debug('Records of Test3 Found: '+iterateOverElement.test2__r.test3__r);
            system.debug('Records of Test4 Found: '+iterateOverElement.test2__r.test3__r.test6__r.test4__r);
        }
    }
    public void fetchTestRecords_5(string testId3)
    {
        List<Test3__c> getList=new List<Test3__c>();
        getList=[SELECT OwnerId, Name,(SELECT OwnerId,Name FROM Test2s__r ),(SELECT OwnerId, Name FROM Test7s1__r) FROM Test3__c WHERE Id=:testId3];  //Parent To Child
        system.debug('Fetching the Records of Assignment 5: '+getList);
        for(Test3__c iterateOverElement:getList)
        {
            if(iterateOverElement.Test2s__r.size()>0)
            {
                for(Test2__c getRecord: iterateOverElement.Test2s__r)
                {
                    system.debug('Records of Test2 Found: '+getRecord);
                }
            }
            else
            {
                system.debug('No Records!!');
            }
            for(Test7__c getRecord: iterateOverElement.Test7s1__r)
            {
                system.debug('Records of Test7 Found: '+getRecord);
            }
        }
    }

}
===================================================

public class Practice 
{
    public void insertContactList()
    {
        list<contact> conList = new list<contact>();
        contact con1= new contact(LastName='Saif1', AccountId='0015j00000YPQuDAAX');  //
        contact con2= new contact(LastName='Saif2', AccountId='0015j00000YPQuDAAX');   //
        contact con3= new contact(LastName='Saif3', AccountId='0015j00000YPOUVAA5');  ////
        contact con4= new contact(LastName='Saif4', AccountId='0015j00000YOZOGAA5');   ///
        contact con5= new contact(LastName='Saif5', AccountId='0015j00000YPDHSAA5');    ////////////
        contact con6= new contact(LastName='Saif6', AccountId='0015j00000YPOUVAA5');    ////
        contact con7= new contact(LastName='Saif7', AccountId='0015j00000YPDHSAA5');     //////////////
        contact con8= new contact(LastName='Saif8', AccountId='0015j00000YOZOGAA5');   ///
        conList.add(con1);
        conList.add(con2);conList.add(con3);conList.add(con4);conList.add(con5);conList.add(con6);conList.add(con7);
        insert conList;  
    }
    
    //Practice1: BEFORE INSERT : When ever a case is created with origin as email then set status as new and Priority as Medium.

    public static void practice1(list<Case> caseList)    
    {
        for(Case caseRec: caseList)
        {
            if(caseRec.Origin=='Email')
            {
                caseRec.Status = 'New';
                caseRec.Priority='Medium';
            }
        }
    }
    
    //Practice2: BEFORE INSERT: When ever Lead is created with LeadSource as Web then give rating as cold otherwise hot.

    public static void practice2(list<Lead> leadList)    
    {
        for(Lead leadRec: leadList)
        {
            if(leadRec.LeadSource=='Web')
            {
                leadRec.Rating = 'Cold';
            }
            else
            {
                leadRec.Rating = 'Hot';
            }
        }
    }
    
    //Practice3: AFTER INSERT : Whenever New Account Record is created then needs to create associated Contact Record automatically.

    public static void practice3(list<account> accList)    
    {
        list<Contact> conList= new list<Contact>();
        for(account accRec: accList)
        {
            if(accRec.Industry=='Banking')
            {
                contact con= new contact();
                con.AccountId=accRec.Id;
                con.FirstName= accRec.Name;
                con.LastName=accRec.Industry;
                con.Email=accRec.Email__c;
                conList.add(con);
            }
        } 
        insert conList;
    }
    
    //Practice5: AFTER INSERT: Create the number of contacts equal to the Number of Locations field on the Account Object.

    public static void practice5(list<Account> accList)    
    {
        list<Contact> conList = new list<Contact>();
        for(Account accRec: accList)
        {
            for(Integer var=1; var<accRec.No_of_Locations__c; var++)
            {
                contact conRec= new contact();
                conRec.AccountId= accRec.Id;
                conRec.FirstName='Contact';
                conRec.LastName=' '+var;
                conList.add(conRec);
            }
        }
        insert conList;
    }
    
    //Practice6: BEFORE UPDATE: When ever Opportunity "Stage" is modified to "Closed Won" then set "Close Date" as "Today Date" and "Type" as "New Customer".
    
    public static void practice6(list<Opportunity> opplist)
    {
        for(Opportunity oppRecord: oppList)
        {
            if(oppRecord.StageName=='Closed Won')
            {
                oppRecord.CloseDate=system.today();
                oppRecord.Type='New Customer';
            }
        }
    }
    
    //Practice7: BEFORE INSERT: when a new contact is created for a existing account then set contact otherphone as account phone

    public static void practice7(list<Contact> conList)
    {
        list<Id> conId= new list<Id>(); 
        for(Contact conRecord: conList) 
        { 
            conId.add(conRecord.AccountId); 
        } 
        map<Id, Account> accList= new map<Id, Account>( [SELECT Id, Phone FROM Account WHERE Id=: conId] ); 
        for(Contact conRec: conList) 
        { 
            conRec.OtherPhone= accList.get(conRec.AccountId).Phone; 
        } 
    }
    
    //Practice 8: BEFORE INSERT UPDATE: The following Trigger will fires when we try to create the account with same name i.e. Preventing the users to create Duplicate Accounts
    
    public static void practice8(list<Account> newList)
    {
        /* //1st Method
        for(Account acc: newList)
        {           
            list<account> a =[SELECT Id, Name FROM Account WHERE Name =: acc.Name];
            if(a.size()>0)
                acc.addError('Duplicate Names Not Allowed');
        }
        
        //2nd Method
        map<Id, Account> accList= new map <Id, Account> ([SELECT Id, Name FROM Account WHERE Name != NULL]);
        for(Account accRec: newList)      
        {
             if(accRec.Name== accList.get(accRec.Id).Name && accList.size()>0)
             {
                 accRec.addError('No Duplicacy Allowed');
             }
        }*/       
        
        //3rd METHOD
        /*
        set<string> accNameSet = new set<String> ();
        list<Account> accList =[SELECT Id, Name FROM Account WHERE Name!=NULL];
        for(Account acc: accList)
        {
            accNameSet.add(acc.Name);
        }
        for(Account acc: newList)
        {
            if(accNameSet.contains(acc.Name))
            {
                acc.addError('Duplicate Account!!!');
            }
        }
        
    }
    
    //Practice9: BEFORE DELETE: Write a trigger in which if an account that has related contacts and the user tries to delete that account it throws you an error "Account cannot be deleted".
    
    public static void practice9(list<Account> oldList)
    {
        set<Id> accId = new set<Id>();
        for(Account acc: oldList)
        {
              accId.add(acc.Id);
        }
        map<Id, Account> accRecList= new map<Id, Account>( [SELECT Id, (SELECT AccountId FROM Contacts) FROM Account WHERE Id=: accId] );
        
        for(Account acc: oldList)
        {
            if(accRecList.get(acc.Id).Contacts.size()>0)
            {
                acc.addError('This Account cannot be deleted');
            }
        }
    }
    
    //Practice10: BEFORE INSERT UPDATE: Write a trigger on lead to prevent duplicate records based on lead email, if a record already created with the same Email, Or record is Updated. The trigger should throw an error.
    
    Public static void practice10(list<Lead> newList)
    {
        set<string> leadEmailSet = new set<string>();
        list<Lead> leadList = [SELECT Id, Email FROM Lead WHERE Email != NULL];
        for(Lead ld : leadList)
        {
            leadEmailSet.add(ld.Email);
        }
        for(Lead ld: newList)
        {
            if(leadEmailSet.contains(ld.Email))
            {
                ld.addError('DUPLICATE EMAIL');
            }
        }
        
            
    }

} 
/*
  ==================================

public class PrithviAssignmentTriggerHelper 
{
    //ASSIGNMENT-1 before Delete, after Undelete
    
    public static void UpdateDateTimeFieldOnAccountBeforeDeleteAfterUndelete(Map<Id, Account> newList, Map<Id, Account> oldList)
    { 
        //if deleted update datetime field on Account --- Task 1
            List<Account> oldAccList = [SELECT ID FROM Account WHERE ID IN: oldList.keySet()];
            for(Account aRec: oldAccList)
            {
                aRec.Deleted_Time__c = System.now();
            }
            update oldAccList;
        
        //If undeleted then update undeleted field on Account --- Task 2
            List<Account> newAccList = [SELECT ID FROM Account WHERE ID IN: newList.keySet()];
            
            for(Account a : newAccList) 
            {
                a.Undeleted_Time__c = system.now();
            }
            if(!newAccList.isEmpty())
                update newAccList;
        
        /*MY CODE
        if(trigger.isAfterDelete)
        {
            list<Account> accList = [SELECT Id FROM Account];
            for(Account acc: accList)
            {
                acc.Deleted_Time__c = System.now();
                update acc;
            }
            update accList;
        } 
        
        if(trigger.isAfterUndelete)
        {
            
            list<Account> accList = [SELECT Id FROM Account];
            for(Account acc: accList)
            { 
                acc.Undeleted_Time__c = system.now();
            }  
            update accList;
        }
    }
    */
    
    //ASSIGNMENT-2
    
    //Task-1: Validate that same person cannot apply for one job twice.
    /*
    public static Boolean runOnce=false;
    public static void validateSingleApplicant(list<Applicants_Form__c> appRecordList)
    {
        
        //Getting all the Unique Job ids
        set<Id> allJobsId = new set<Id>();
        for(Applicants_Form__c appRecord: appRecordList)
        {
            allJobsId.add(appRecord.Choose_Job__c);
        }
        
        //Getting Existing Jobs
        list<Applicants_Form__c> existingApplicants = [SELECT Id, Choose_Job__c, Applying_Contact__c FROM Applicants_Form__c WHERE Choose_Job__c=:allJobsId];
        map<Id, list<Id>> allContactsById = new map<Id, list<Id>>();
        
        if(!existingApplicants.isEmpty())
        {
            for(Applicants_Form__c appRecord : existingApplicants)
            {
                if(allContactsById.containsKey(appRecord.Choose_Job__c))          //If the job id is already existing goto next line, otherwise goto else part
                {
                    allContactsById.get(appRecord.Choose_Job__c).add(appRecord.Applying_Contact__c);     //Adding new contact on the existing job Id
                }
                else
                {
                    allContactsById.put(appRecord.Choose_Job__c, new list<Id>{appRecord.Applying_Contact__c});  //Adding new Job id with contacts
                }
            }
        }
        
        //Processing new applicant list
        for(Applicants_Form__c appRecord : appRecordList)
        {
            if(allContactsById.containsKey(appRecord.Choose_Job__c))
            {
                list<Id> existingContacts = allContactsById.get(appRecord.Choose_Job__c);
                if(existingContacts.contains(appRecord.Applying_Contact__c))
                {
                    appRecord.addError('Sorry! You cannot apply for the same job twice');
                }
            }
        } 
    }
    
    public static void updateJobFieldAfterInsertOrUpdateNewApplicant(list<Applicants_Form__c> appList)
    {
        //Task-2: Updating Total No of Candidates field of Job record based on the application form of an applicant
        
        list<Jobs__c> jobList= [SELECT Id, (SELECT Id FROM Choose_Job__r) FROM Jobs__c];
        if(!jobList.isEmpty())
        {
            for(Jobs__c jobRec: jobList)
            {
                jobRec.Total_no_of_Applied_Candidates__c = jobRec.Choose_Job__r.size(); 
            }
        }	
        update jobList;
        
        //Task-3: Updating Term field of Job record based on the applied month of the Applicant
    
        list<Jobs__c> jobList1 = [SELECT Id, Term__c, (SELECT Id,Application_Submitted_Date__c FROM Choose_Job__r) FROM Jobs__c];
        for(Jobs__c var: jobList1)
        {
            for(Applicants_Form__c  app: appList )
            {
                Integer month=app.Application_Submitted_Date__c.month();
                system.debug(month);
                if(month>=1 && month<=4)
                {
                    var.Term__c='Summer';
                }
                else if(month>=5 && month<=8)
                {
                    var.Term__c='Rainy';
                }
                else 
                {
                    var.Term__c='Winter';
                }   
            } 
        }
    }
    
    // Task 4: Applying Validation Rule on Job if no of applied candidates is exceeding required no of candidate field (after update, before update)
    
    public static void validateJobFieldAfterBeforeUpdate(list<Jobs__c> jobList)
    {
            for(Jobs__c var: jobList)
            {
                if( (var.Total_no_of_Applied_Candidates__c) > (var.Required_No_of_Candidates__c) )
                {
                    var.addError('You cannot apply for this job now as seats are full!');
                }
            }
    }
}

     */