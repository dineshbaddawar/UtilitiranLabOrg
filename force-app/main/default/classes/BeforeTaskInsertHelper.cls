public class BeforeTaskInsertHelper {

    public static void triggerHelper(list<task> taskList)
    {
        Set<Id> LeadId = new Set<Id>();
        for(Task tak : taskList){
            if(tak.WhoId !=null && tak.Status == 'Deferred'){
                LeadId.add(tak.WhoId);
            }
        }
        
        Map<Id,Lead> LeadMap = new Map<Id,Lead> ([SELECT Id,(SELECT WhoId,Status FROM Tasks WHERE Status='Deferred') FROM Lead WHERE Id IN:LeadId]);
        for(Task newtask : taskList){
            if(newtask.whoId != null && LeadMap.containsKey(newtask.whoId)){
                Lead led = LeadMap.get(newtask.WhoId);
                if(led.tasks.size()>0){
                    newtask.addError('Duplicate Task Found In the database');
                }
            }
        }
    }
}