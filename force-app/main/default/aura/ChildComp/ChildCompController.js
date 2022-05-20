({
	show : function(component, event, helper) {
		// Fetch the event
		var evt = component.getEvent("firstCall");
        // Set the attribute values
        evt.setParams({"empName":"Dinesh Baddawar"});
        // Fire the Event
        evt.fire();
        alert('Child Component is Fired'); 
	}
})