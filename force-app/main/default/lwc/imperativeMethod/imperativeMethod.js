import { LightningElement,track } from 'lwc';
import getContactRec from '@salesforce/apex/StudentController.getContactRec'; 
import getOppRecord from '@salesforce/apex/StudentController.getOppRecord';

const columns = [
     {label: "FirstName", fieldName: "FirstName"},
     {label: "LastName", fieldName: "LastName"},
     {label: "Email", fieldName: "Email"},
]

const columns1 = [
     {label:"Name", fieldName: "Name"},
     {label: "StageName", fieldName: "StageName"},
     {label: "CloseDate", fieldName: "CloseDate"},
]


export default class ImperativeMethod extends LightningElement {

     @track geconColumns = columns;
     @track condata = [];

     connectedCallback(){
          getContactRec()
          .then(result =>{
               this.condata = result;
          })
          .catch(error=>{
               console.log("Error is Occured");
          })
     }

     @track oppColumns = columns1;
     @track oppdata = [];

     connectedCallback(){
          getOppRecord()
          .then(result =>{
               this.oppdata = result;
          })
          .catch(error =>{
               console.log("Error is Occured");
          })
     }

    

}