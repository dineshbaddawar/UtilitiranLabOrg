({
	handleChange : function(component, event, helper) {
		var compEvent = component.getEvent("msgEvent");
        alert("Selecting The Data to Pass from Comp 1");
        compEvent.setParams({"selectedVal":component.get("v.selOption")});
       
        compEvent.fire();
        alert("Event is Fired From Comp 1");
	}
})