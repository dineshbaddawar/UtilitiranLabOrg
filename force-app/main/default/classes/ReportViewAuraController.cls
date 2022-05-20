public with sharing class ReportViewAuraController {
  
    /*

@AuraEnabled
    public static String runReport() {
        Report rep = [SELECT Id,DeveloperName FROM Report WHERE DeveloperName ='New_Accounts_Report_jKw' LIMIT 1];
        return JSON.serialize(Reports.ReportManager.runReport(rep.Id, true));
        
      }

*/
    @AuraEnabled
    public static String runReport() {
        Report rep = [SELECT Id,DeveloperName FROM Report WHERE DeveloperName ='New_Accounts_Report_jKw' LIMIT 1];
        Reports.ReportResults results = Reports.ReportManager.runReport(rep.Id, true);
        return JSON.serialize(results);
    }
    }