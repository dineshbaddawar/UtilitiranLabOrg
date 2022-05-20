@RestResource(urlMapping='/activity_mappingurl/*')
global class Web_ActivityMapping {
    
    @HttpPost
    global static ActivityResponseWrapper.ResponseWrapper activityMapping(){
        ActivityResponseWrapper.ResponseWrapper response = new ActivityResponseWrapper.ResponseWrapper();
        ActivityMappingWrapper accWrap = new ActivityMappingWrapper();
        accWrap=   ActivityMappingWrapper.parse(RestContext.request.RequestBody.tostring());
        ActivityResponseWrapper.failed_activity faildResponse = new ActivityResponseWrapper.failed_activity();
        response.failed_activity_list = new List<ActivityResponseWrapper.failed_activity>();
        system.debug('accWrap>>'+accWrap);
        
        Set<String> uniqueTask = new Set<String>();
        Map<String,String> UID_Accounts = new Map<String,String>();
        List<Account> accList = new List<Account>();
        List<Task> TaskListToBeInserted = new List<Task>();
        
        for(ActivityMappingWrapper.cls_activitylist ActDetails : accWrap.Activity){
            uniqueTask.add(ActDetails.search_by_value);
        }
        
        accList = [SELECT Id,Account_UID__c FROM Account WHERE Account_UID__c IN:uniqueTask];
        System.debug('The AccLIst--->'+accList);
        
        
        for(Account acc : accList){
            UID_Accounts.put(acc.Account_UID__c,acc.id);
        }
        
        if(!accLIst.isEmpty()){
            for(ActivityMappingWrapper.cls_activitylist ActivityDetails : accWrap.Activity ){
                if(UID_Accounts.containsKey(ActivityDetails.search_by_value)){
                    Task tk = new Task();
                    tk.activity_note__c = ActivityDetails.activity_note;
                    tk.activity_type__c = ActivityDetails.activity_type;
                    tk.exam_date__c = Date.valueOf(ActivityDetails.exam_date);
                    tk.exam_name__c = ActivityDetails.exam_name;
                    tk.exam_slug__c = ActivityDetails.exam_slug;
                    tk.is_qualified_in_exam__c = ActivityDetails.is_qualified_in_exam;
                    tk.skill_based_exam_score__c = ActivityDetails.skill_based_exam_score;
                    tk.Subject = ActivityDetails.subject;
                    tk.search_by_value__c = ActivityDetails.search_by_value;
                    tk.WhatId = UID_Accounts.get(tk.search_by_value__c);
                    TaskListToBeInserted.add(tk);
                    System.debug('TaskListToBeInserted--->'+TaskListToBeInserted);
                }else{
                  
                    ActivityResponseWrapper.failed_activity activityFailed =  new ActivityResponseWrapper.failed_activity();
                    activityFailed.activity_details = ActivityDetails;
                    activityFailed.error_msg ='Account Not Found';
                    response.failed_activity_list.add(activityFailed);
                }
            }
            
             if(!taskListToBeInserted.isEmpty()){
            response.success_activity_list = new List<Task>();
            Database.SaveResult[] result = Database.insert(taskListToBeInserted,false);
            for(Integer i=0;i<result.size(); i++){
                if(result[i].isSuccess()){
                    response.success_activity_list.add(taskListToBeInserted[i]);
                }
                /*
                else{
                  
                    for(Database.error err:result[i].getErrors()){
                        ActivityResponseWrapper.failed_activity failAct = new ActivityResponseWrapper.failed_activity();
                        failAct.activity_details = err.getMessage();
                        response.failed_activity_list.add(failAct);
                    }
                } */
            }
             }else{
                 for(ActivityMappingWrapper.cls_activitylist ErrorResponse : accWrap.Activity){
                     ActivityResponseWrapper.failed_activity fail = new ActivityResponseWrapper.failed_activity();
                     fail.activity_details = ErrorResponse;
                     fail.error_msg = 'Account is Not Available';
                     response.failed_activity_list.add(fail);
                 }
             }
            
        }
        
        return response;
    }
}