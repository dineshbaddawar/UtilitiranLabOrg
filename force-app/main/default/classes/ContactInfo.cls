public class ContactInfo {
    
    public String FirstName;
    public String LastName;
    public String Email;
    Public String Phone;
    public String AccountId;
    public Static ContactInfo MethodCon(String json){
        return (ContactInfo) System.JSON.deserialize(json, ContactInfo.class);
    }
}