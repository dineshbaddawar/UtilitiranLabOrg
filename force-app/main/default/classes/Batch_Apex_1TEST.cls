@isTest
public class Batch_Apex_1TEST {
    //   // Code coverage 100%. Method 2
    @isTest
    static void testDate(){
        Opportunity opp = new Opportunity();
        opp.Name =' Opp';
        opp.CloseDate = System.today().addMonths(2);
        opp.StageName = 'Prospecting';
        insert opp;
        Database.executeBatch(new Batch_Apex_1());
    }
}