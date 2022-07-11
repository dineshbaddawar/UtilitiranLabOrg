import { LightningElement,track } from 'lwc';

export default class TrackDecorator extends LightningElement {
     @track fullName = {firstname : "", lastName: ""};

     handleChange(event){
          const field = event.target.name;
         // window.alert('Field Value--->'+field);
          if(field === 'firstName'){
              
               this.fullName.firstname = event.target.value;
          }
          else if(field === 'lastname'){
               this.fullName.lastName = event.target.value;
          }
     }

     @track  FName = {fistName1: "", lastName2: ""};
     changeHandle(event){
          const filed1 = event.target.name;
          if(filed1 === 'fname'){
               this.FName.fistName1 = event.target.value;
          }
          else if(filed1 === 'lname'){
               this.FName.lastName2 = event.target.value;
          }
     }
}