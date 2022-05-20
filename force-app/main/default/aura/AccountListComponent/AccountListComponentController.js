({
    doInit : function(component, event, helper) {
      var action= component.get('c.getAccounts');
      action.setParams({

      });
      action.setCallback(this, function(response){
          var responseValue = response.getReturnValue();
          component.set('v.AccountList', responseValue);
      });
      $A.enqueueAction(action, false);
    }
})