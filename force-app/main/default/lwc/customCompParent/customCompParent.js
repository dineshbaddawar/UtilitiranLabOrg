import { LightningElement,track } from 'lwc';

export default class CustomCompParent extends LightningElement {
     @track message;
     handleCustomEvent(event){
          const textVal =event.detail;
          this.message = textVal;
     }
}