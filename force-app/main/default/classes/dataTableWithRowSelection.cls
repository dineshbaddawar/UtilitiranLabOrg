public class dataTableWithRowSelection {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(Id lwcRecordId, String searchKeys){
        // If Search Key is Available
        if(searchKeys !=null && searchKeys != ''){
            String Key = '%'+ searchKeys + '%';
            List<Contact> contactSearchList = [SELECT Id,Phone,Name,Email,AccountId FROM Contact WHERE AccountId =: lwcRecordId AND Name LIKE :Key];
            return contactSearchList;
        }
        // If Search Key is not found
       List<Contact> contactList = [SELECT Id,Name,Email,Phone,AccountId FROM Contact WHERE AccountId =: lwcRecordId];
        // Null Check
        if(!contactList.isEmpty()){
            return contactList;
        }
        return null;
    }
}