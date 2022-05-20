import { LightningElement,track } from 'lwc';

export default class TrackDecorator extends LightningElement {

   @track fullname = { firstname:"" , lastname:"", date:"", datetime:"", color:"", file:"",password:""};             // here we are creating object 'fullname'

   handleChange(event){
           const field = event.target.name;
         //  window.alert('field values---> '+field);
           console.log('the Field----> '+field);
           if(field === 'firstname'){
               this.fullname.firstname = event.target.value;
           }
           else if(field === 'lastname'){
               this.fullname.lastname = event.target.value;
           } 
           else if(field === 'date'){
               this.fullname.date = event.target.value;
           }
           else if(field === 'datetime'){
               this.fullname.datetime = event.target.value;
           }
           else if(field === 'color'){
               this.fullname.color = event.target.value;
           }
           else if(field === 'file'){
               this.fullname.file = event.target.value;
           }
           else if(field === 'password'){
               this.fullname.password = event.target.value;
           }
   }
}