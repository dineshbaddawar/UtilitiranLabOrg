import { LightningElement,track } from 'lwc';
import CloneRecords from '@salesforce/apex/CloneRecord.CloneRecords';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';

export default class CloneRecordContact extends LightningElement {

     @track rec = {
          FirstName : FIRSTNAME_FIELD,
          LastName : LASTNAME_FIELD
     }

     handleFirstNameChange(event){
          this.rec.FirstName = event.target.value;
          window.console.log("FirstName",this.rec.FirstName);
     }

     handleLastNameChange(event){
          this.rec.LastName = event.target.value;
          window.console.log("LastName",this.rec.LastName);
     }

     handleClick(){
          CloneRecords({ con : this.rec})
          .then(result =>{
               this.data = result;
               this.error = undefined;
               if(this.data !==undefined){
                    this.rec  = {};
                    this.dispatchEvent(
                         new ShowToastEvent({
                              tile: "SUCCESS",
                              message: "Record Cloned Successfully",
                              variant: 'success'
                         }),
                    );
               }

              window.console.log(JSON.stringify(result));
          //     window.onabort.length("result",this.data);
          })
          .catch(error =>{
               this.error = undefined;
               this.error = error;
               this.dispatchEvent(
                    new ShowToastEvent({
                         title:'Failed',
                         message: "Something Went Wrong",
                         variant: 'error'
                    }),
               );
               window.console.log("error", JSON.stringify(this.eror));
          });
     }
}