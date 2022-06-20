import { LightningElement } from 'lwc';

export default class LwcParentComp extends LightningElement {
     handleChangeEvent(event){
          this.template.querySelector('c-lwc-Child-Comp').changeMessage(event.target.value);
     }

  
    
}