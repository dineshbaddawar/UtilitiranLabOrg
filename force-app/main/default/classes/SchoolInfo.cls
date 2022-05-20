public class SchoolInfo {

    public String Name;
    public String Fess;
    public String Address;
    public String Email;
    public String Phone;
    
    public Static SchoolInfo parse(String json){
        return (SchoolInfo) System.JSON.deserialize(json, SchoolInfo.class);
    }
}