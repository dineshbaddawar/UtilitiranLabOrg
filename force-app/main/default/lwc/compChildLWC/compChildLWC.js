import { LightningElement, api } from 'lwc';

export default class CompChildLWC extends LightningElement {
    @api message = "Hello World";

  @api  handleChangeValue(){
      this.message = 'Salesforce CRM';
    }
}