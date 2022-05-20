import { LightningElement,api } from 'lwc';

export default class ChildComponent extends LightningElement {

   @api message='Child Message';
   @api message1 = 'Child Message 1'
   // Changing Child Component message value using function from Parent Component.

  @api hanldeChangeValue(){
      this.message = 'Message Changed From Parent Button';
   }

   @api handleChange(){
       this.message1 = 'Message 1 Changed From Parent Submit Button';
   }
}