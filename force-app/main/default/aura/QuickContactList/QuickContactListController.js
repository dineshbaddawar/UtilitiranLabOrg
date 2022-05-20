({
	doSave : function(component, event, helper) {
		var action = component.get('c.createContact');
        action.setParams({
            con: component.get('v.createCon'),
            accId: component.get("v.recordId")
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            alert(state);
            if(state === 'SUCCESS' || state === 'DRAFT'){
                var result = response.getReturnValue();
            }else if(state === 'ERROR'){
                console.log("Error Array: ",err)
            }
        },'ALL');
        $A.enqueueAction(action); 
	},
    toggleIncomeForm:function(component,event, helper){
        var newContact = component.find('createContact');
        $A.util.toggleClass(newContact, 'hide');
    }
})