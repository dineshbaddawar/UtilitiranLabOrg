({
   
    AddMethod : function(component, event, helper){
        var number1 = component.get('v.input1');
        var number2 = component.get('v.input2');
        component.set('v.output', parseInt(number1) + parseInt(number2));
    },
    
    SubMethod : function(component, event, helper){
        var number1 = component.get('v.input1');
        var number2 = component.get('v.input2');
        component.set('v.output', parseInt(number1) - parseInt(number2));
    },
    
    MulMethod : function(component, event, helper){
        var number1 = component.get('v.input1');
        var number2 = component.get('v.input2');
        component.set('v.output', parseInt(number1) * parseInt(number2));
    },
    
    DivMethod : function(component, event, helper){
        var number1 = component.get('v.input1');
        var number2 = component.get('v.input2');
        component.set('v.output', parseInt(number1) / parseInt(number2));
    }
	
})