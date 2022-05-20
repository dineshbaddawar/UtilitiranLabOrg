public class FetchReports {

     @AuraEnabled(cacheable=true)
  public static String getReportId(String reportName){
   return [SELECT Id,Name FROM Report WHERE Name=:reportName LIMIT 1]?.Id;
  }
}