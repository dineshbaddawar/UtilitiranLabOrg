({
	doInit : function(component, event, helper) {
		var action = component.get("c.getAccounts");
        action.setCallback(this,function(ab){
            component.set("v.accList", ab.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})