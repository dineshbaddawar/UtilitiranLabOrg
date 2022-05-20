({
	doInit : function(component, event, helper) {
		var action = component.get('c.GetOpportunity');
        action.setParams({
            
        });
        action.setCallback(this, function(response){
          
            var responseValue = response.getReturnValue();
            component.set('v.OpportunityList', responseValue);
        });
        $A.enqueueAction(action, false);
	}
})