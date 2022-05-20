import { LightningElement,wire,track } from 'lwc';
import StudentDetails from '@salesforce/apex/wireApexStudent.StudentDetails';

// Method 1
const columns = [
    {label:"Name",fieldName:"Name"},
    {label:"Id",fieldName:"Id"},
];

export default class WireDecorator extends LightningElement {

   @track columns = columns;
   @track data = [];

   @wire(StudentDetails)
   wireFunction({data,error}){
       if(data){
           this.data = data;
       }
       else if(error){
           console.log('Error');
       }
   }
    

}












    /*
  // Method 2
  @track  columns1 = [
        {label:"Name 1",fieldApiName:"Name 1"},
    {label:"Id", fieldApiName:"ID"}
    ] 
       */