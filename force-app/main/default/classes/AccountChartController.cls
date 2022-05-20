public with sharing class AccountChartController {
    public AccountChartController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Report> getReports(){
        return [SELECT Id,DeveloperName FROM Report LIMIT 1];
    }
}