public class AccountMappingWrapper {

    public String mobile_number;
    public String name;
    public String email;
    
    public cls_companies[] companies;  // child account
    public cls_subscriptions[] subscriptions; // opportunity
    public cls_Contacts[] Contacts;
    public cls_Leads[] Leads;
    
    public class cls_companies{
        public String mobile_number;
        public String name;
        public String email;
    }
    
    public class cls_subscriptions{
        public String id;
        public String subscription_type;
        public String expired_at;
        public String amount;
    }
    
    public class cls_Contacts{
        public String Id;
        public String FirstName;
        public String LastName;
        public String Email;
    }
    
    public class cls_Leads{
        public String id;
        public String FirstName;
        public String LastName;
        public String Company;
    }
    
    public static AccountMappingWrapper parse(String json){
        return (AccountMappingWrapper) System.JSON.deserialize(json, AccountMappingWrapper.class);
    }
}