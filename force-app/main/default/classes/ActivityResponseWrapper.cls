global class ActivityResponseWrapper {

    global class ResponseWrapper{
       global List<Task> success_activity_list;
        global List<failed_activity> failed_activity_list;
    }
    
    global class failed_activity{
        global ActivityMappingWrapper.cls_activitylist activity_details;
        global String error_msg;
    }
}