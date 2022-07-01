import { LightningElement,track } from 'lwc';

export default class CustomCompParent extends LightningElement {
     @track message;

     constructor(){
          super();
          this.template.addEventListener('mycustomevent')
     }

     handleCustomEvent(event){
          const textVal =event.detail;
          this.message = textVal;
     }
}