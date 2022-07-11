import { LightningElement } from 'lwc';

export default class CompParentLWC extends LightningElement {
     handleClick(){
          this.template.querySelector('c-comp-child-l-w-c').handleChangeValue();
     }
}