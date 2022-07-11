import { LightningElement } from 'lwc';

export default class FunctionLWC extends LightningElement {
     
     handleClick(){
        //  window.alert('Hello World');
     }
      // 1
     connectedCallback(){
          let callMyFunction = this.myFunction(20, 5);
        //  alert('Result --->'+callMyFunction);
     }
     // myFunction(dividend, divisor){
     //      return(dividend/divisor);
     // }

     // Using Arrow Function

     myFunction = (dividend,divisor) =>{
return(dividend/divisor);
     }

     //2 
     connectedCallback(){
          let mymethod = this.method1(20,2);
        //  alert('Method 1 ---> '+mymethod);
     }
     // method1(value1, value2){
     //      return(value1+value2);
     // }

     // Using Arrow Function
     method1 = (value1, value2) =>{
          return(value1*value2);
     }
      
}