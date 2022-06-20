import { LightningElement, track,api } from 'lwc';

export default class LwcChildComp extends LightningElement {
     @track message;
     @api changeMessage(strString){
          this.message = strString.toUpperCase();
     }
}