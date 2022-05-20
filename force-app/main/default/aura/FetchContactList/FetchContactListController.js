({
	doInit : function(component, event, helper) {
		// Here we are returning object of Action class
		var action = component.get("c.getContactList"); // return method which has apex classs
        // Here we seting the value account & getting record
        action.setParams({accId: component.get("v.recordId")});
        
        // Here we are using setCallback, this will execute after apex method calling
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS")
            {
                component.set('v.columns',
                              [
                                  {label: 'Contact ID', fieldName: 'Id', type: 'text'},
                                  {label: 'First Name', fieldName: 'FirstName', type: 'text'},
                                  {label: 'Last Name', fieldName: 'ContactUrl', type: 'url', typeAttributes: {label: {fieldName: 'LastName'}}},
                                  {label: 'Phone', fieldName: 'Phone', type: 'phone', cellAttributes: { iconName: 'utility:phone_portrait'}}
                              ]);
                
                var lstContacts = response.getReturnValue();
                lstContacts.forEach(function(item)
                                    {
                                        item['ContactUrl'] = '/lightning/r/Contact/' +item['Id'] +'/view';
                                    });
                
                component.set("v.ContactList", response.getReturnValue());
            }
            else
            {
                console.log("Failed with state: " + state);
            }
            
        });
        
        $A.enqueueAction(action);
    },
    
    searchKeyChange: function(component, event)
    {
        var searchKey = event.getParam("searchKey");
        var action = component.get('c.findByName');
        action.setParams({
            "searchKey": searchKey,
            accId:component.get('v.recordId')
        });
        action.setCallback(this, function(a) {
            component.set("v.ContactList", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }

})