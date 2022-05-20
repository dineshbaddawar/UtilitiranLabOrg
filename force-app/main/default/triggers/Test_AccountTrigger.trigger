trigger Test_AccountTrigger on Account (before insert) {

    List<Account> accList = trigger.new;
    Test_AccountClass.UpdateAnnualRevenue(accList);

    // Alos we Can directly pass Trigger.new in the method.
    //  Test_AccountClass.UpdateAnnualRevenue(trigger.new);
    //
}