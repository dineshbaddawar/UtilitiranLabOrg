trigger CustomNotiAccountCreation on Account (after insert) {

    if(trigger.isInsert){
        SendCustomNotificationHelper.SendCustom(trigger.new);
    }
}