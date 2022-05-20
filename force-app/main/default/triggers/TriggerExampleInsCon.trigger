// Trigger on Account object to handle insert and update.
trigger TriggerExampleInsCon on Account (before insert,after insert,after update) {
 
    if(trigger.isAfter){
        TriggerExampleHelper.InsertAcc(trigger.new);
    }
}