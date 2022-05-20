({
	invoke : function(component, event, helper) {
         alert('Event Handled By Comp 2');
		var acc = event.getParam("accName");
        
        component.set("v.value1",acc);
       
	}
})