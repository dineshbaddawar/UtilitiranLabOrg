trigger ContactTrigger on Contact (before delete,after update) {

    // UseCase: when we update Contact LeadSource is Other then it will create Case.
    if(trigger.isAfter && trigger.isUpdate){
        ContactTriggerHandler.createCase(trigger.newMap, trigger.oldMap);
    }
// If Contact isPrimary is Check then it prevent from deleting Contact.
    if(trigger.isBefore && trigger.isDelete){
        ContactTriggerHandler.preventDeletePrimaryContact(trigger.old);
    }
}