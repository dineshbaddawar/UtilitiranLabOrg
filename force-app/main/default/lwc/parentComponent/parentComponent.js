import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    handleClick(){
        this.template.querySelector('c-child-component').hanldeChangeValue();
    }
    hanldeChange1(){
        this.template.querySelector('c-child-component').handleChange();
    }
}