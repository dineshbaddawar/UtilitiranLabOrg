({
	invoke : function(component, event, helper) {
		var evt = component.getEvent("one");
        evt.setParams({"empName":"Anjali Singh"});
        alert("INVOKE");
        evt.fire();
	},
    show : function(component,event,helper){
        var name = event.getParam("empName");
        component.set("v.name",name);
        alert("SHOW");
    }
})