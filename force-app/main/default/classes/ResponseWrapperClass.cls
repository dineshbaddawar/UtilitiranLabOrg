global class ResponseWrapperClass {

    global class ResponseWrapper{
        /*
        global List<Account> success_account_list;
        global List<Account> failed_account_list;
        global List<Account> success_child_account_list;
        global List<Account> failed_child_account_list;
        global List<Opportunity> success_subscription_list;
        global List<Opportunity> failed_subscription_list; */
        global List<Contact> success_contact_list;
        global List<failed_contact> failed_contact_list;
      //  global List<Lead> success_lead_list;
    }
    /*
    global class failed_account{
        global String account_details;
        global String error_msg;
    }
    
    global class failed_subcription{
        global String subscription_details;
        global String error_msg;
    } */
    
    global class failed_contact{
        global String contact_details;
        global String error_msg;
    }
    
}