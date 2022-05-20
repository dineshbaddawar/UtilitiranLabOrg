({
	showSelectedValue : function(component, event, helper) {
        alert("Getting The Result From Comp 2");
		component.set("v.SelectedOptionValue",event.getParam("selectedVal"))
	}
})