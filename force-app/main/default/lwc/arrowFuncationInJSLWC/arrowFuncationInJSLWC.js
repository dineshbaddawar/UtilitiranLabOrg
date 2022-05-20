import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ArrowFuncationInJSLWC extends LightningElement {

    mymessage = 'Salesforce CRM';

    handleChange(){
        this.connectedCallback();  
          
    }
  
    /* 
    connectedCallback(){                    // it is used to invoke the method
     let callmyFunction = this.myFunction(10, 2);
     window.alert('Result : '+callmyFunction);
    }
 
    myFunction(dividend, divisor){           // passing two parameter for division
       return (dividend/divisor);            // 10/2=5
    }
 */
    // Now using arrow function we can do this same thing

    connectedCallback(){                    // it is used to invoke the method
        let callmyFunction = this.myFunction(10, 2);
     //   window.alert('By Using Arrow Function : '+callmyFunction);
       }

    myFunction = (dividend,divisor) =>{
       return (dividend/divisor);
    }
}