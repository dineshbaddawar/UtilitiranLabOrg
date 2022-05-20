({
	doInit : function(component, event, helper) {
		//1.
		var getReportAction = component.get("c.GetReport");
        //2.Set Param
        getReportAction.setParams({
            'reportAPI':component.get("v.reportAPI")
        });
        //3.
        getReportAction.setCallback(this,function(response){  
            var state = response.getState();  
            if(state=='SUCCESS'){  
                var result = response.getReturnValue();  
                component.set("v.reportData",result);  
            }  
        }); 
        //4.
        $A.enqueueAction(getReportAction); 
	}
})