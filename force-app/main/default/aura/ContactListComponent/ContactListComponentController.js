({
    doInit : function(component, event, helper) {
      // Step 1
      var action = component.get('c.getContacts');
      // Step 2
      action.setParams({

      });
      // Step 4
      action.setCallback(this, function(response){
          var responseValue = response.getReturnValue();
          component.set('v.ContactList', responseValue);
      });
      // Step 3
      $A.enqueueAction(action, false);
    },
})