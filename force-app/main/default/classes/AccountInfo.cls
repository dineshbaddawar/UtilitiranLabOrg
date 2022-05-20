public class AccountInfo {

    public String Name;
    public String Phone;
    public String Email;
    public String Rating;
    
    public static AccountInfo MethodAcc(String json){
        return (AccountInfo) System.JSON.deserialize(json, AccountInfo.class);
    }
}