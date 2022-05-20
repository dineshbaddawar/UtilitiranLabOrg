public class AccountReport {

    @AuraEnabled(cacheable=true)
    public static Integer GetReport(String reportAPI){
        List<Report> reportList = [SELECT Id,DeveloperName FROM Report WHERE DeveloperName =:reportAPI];
        String reportId = (String)reportList.get(0).get('Id');
        
        Reports.ReportDescribeResult describe = Reports.ReportManager.describeReport(reportId);
        Reports.ReportMetadata reportMd = describe.getReportMetadata();
        Reports.ReportResults results = Reports.ReportManager.runReport(reportId, reportMd);
        Reports.ReportFactWithSummaries factSum = (Reports.ReportFactWithSummaries)results.getFactMap().get('T!T');
        
        List<Reports.SummaryValue> allSummary = factSum.getAggregates();
        System.debug('allSummary--'+allSummary[0].getValue());
        
        return Integer.valueOf(allSummary[0].getValue() != null ? Integer.valueOf(allSummary[0].getValue()):0);
        
    }
}