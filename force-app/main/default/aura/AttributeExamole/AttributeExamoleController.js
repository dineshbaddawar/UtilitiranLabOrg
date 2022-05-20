({
	doClick : function(component, event, helper) {
		 /*alert(component.isValid());
        alert(component.getName());
        alert(component.get('v.Whom')); */
        // Component Set - Key:attribute, Value: That we wanted to set in the attribute
        component.set('v.Whom',"Salesforce Developer");
        var getComp= component.find('testInput');
       // alert(getComp.get('v.value'));
        getComp.set('v.value',100);
	}
})