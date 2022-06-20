({
    doInit: function(component, event, helper) {
        helper.getChildRecords(component, event);
    },
 
    addSelected: function(component, event, helper) {
        var tempIDs = [];
        var getAllId = component.find("checkBox");
        for (var i = 0; i < getAllId.length; i++) {
       if (getAllId[i].get("v.value") == true) {
                tempIDs.push(getAllId[i].get("v.text"));
            }
        }
        helper.addSelectedHelper(component, event, tempIDs);
    },
})