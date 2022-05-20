({
	doInit : function(component, event, helper) {
		var action = component.get('c.GetAccounts');
        action.setParams({
            
        });
        action.setCallback(this, function(response){
            var responseValue = response.getReturnValue();
          //  console.log('ResponseValue ', responseValue);
            component.set('v.AccountList', responseValue);
        });
        
        $A.enqueueAction(action, false);
	}
})