({
	call : function(component, event, helper) {
        var evt = $A.get("e.c:SecondEvent");
        alert("Setting the value");
        evt.setParams({"accName":"Dinesh Baddawar"});
        evt.fire();
        alert("Comp 1 Firing the Event");
	}
})