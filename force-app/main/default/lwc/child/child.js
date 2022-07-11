import { LightningElement, api } from 'lwc';

export default class Child extends LightningElement {
     @api myName = 'First Value';

     @api testChildMethod(parentParam){
          alert('This is Child Method Called '+parentParam.firstName);
     }

     handleMe(){
          const childEvent = new CustomEvent('buttonclick', 
          {
               // detail : 'Parameter From Child' // Single Parameter
               // Multiple parameter
               detail : {
                    firstparam : 'First Name',
                    secondparam : 'Last Name',
               }
     });
          this.dispatchEvent(childEvent);
     }
}