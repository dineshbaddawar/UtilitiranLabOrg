public with sharing class Test_AccountClass {
    
    public Static void UpdateAnnualRevenue(List<Account> accList){
        for(Account acc : accList){
            acc.AnnualRevenue = 90000;
        }
    }
}