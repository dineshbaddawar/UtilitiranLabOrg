public with sharing class wireApexStudent {
    
    // Method 1
    @AuraEnabled(cacheable=true)
    public static List<Student__c> StudentDetails(){

        return [SELECT ID,Name FROM Student__c];
    }

    // Method 2
    @AuraEnabled(cacheable=true)
    public static List<Student__c> getStudentList(){
        List<Student__c> StudentDetails = [SELECT Id,Name FROM Student__C];
        return StudentDetails;
    }
}