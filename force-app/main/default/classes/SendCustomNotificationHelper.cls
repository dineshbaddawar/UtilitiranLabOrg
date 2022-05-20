public class SendCustomNotificationHelper {
    
    public Static void SendCustom(List<Account> accList){
        for(Account acc: accList){
            if(acc.Name !=null){
                Messaging.CustomNotification notification = new Messaging.CustomNotification();
                notification.setBody('New Account Created');
                notification.setTitle('Account Name : '+acc.Name+' '+'\n Account Id : '+acc.Id);
                notification.setSenderId(Userinfo.getUserId());
                CustomNotificationType type = [SELECT Id FROM CustomNotificationType WHERE DeveloperName = 'AccountCreation'];
                notification.setNotificationTypeId(type.id);
                notification.setTargetId(acc.Id); // target object id
                notification.send(new Set<String> { Userinfo.getUserId() });
            }
            
        }
        
        
    }
}