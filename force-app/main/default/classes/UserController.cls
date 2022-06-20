public class UserController {

    @AuraEnabled
    public static List<User> getUserList(){
        return [SELECT Id,Name,Email FROM User];
    }
}