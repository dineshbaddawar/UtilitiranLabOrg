({
    getChildRecords: function(component, event) {
        var action = component.get('c.getContacts');
        action.setCallback(this, function(actionResult) {
            var state = actionResult.getState();
            if (state === 'SUCCESS') {
                component.set('v.ChildRecordList', actionResult.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    addSelectedHelper: function(component, event, childRecordsIds) {
        var action = component.get('c.addParentAccount');
        action.setParams({
            "ParentId": component.get("v.recordId"), 
            "lstOfContactIds": childRecordsIds
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                // This standard 'e.force:refreshView' and 'e.force:showToast' event not work from lightning appliation
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "message": "The Child record's has been added successfully."
                });
                toastEvent.fire();
                $A.get('e.force:refreshView').fire();
                this.getChildRecors(component,event);
            }
        });
        $A.enqueueAction(action);
    },
})