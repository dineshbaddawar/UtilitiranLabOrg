import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJ from '@salesforce/schema/Contact';
import CONTACT_NAME from '@salesforce/schema/Contact.LastName';
export default class LdsCreateRecordContact extends LightningElement {

     contactId;
     name ='';
     handleNameChange(event){
        
          this.contactId = undefined;
          this.name = event.target.value;
          console.log("value in name --->"+this.name);
     }
     createContact(){
          debugger;
          const fields = {};
          fields[CONTACT_NAME.fieldApiName] = this.name;
          
          const recordInput = { apiName: CONTACT_OBJ.objectApiName, fields};
          debugger;
          createRecord(recordInput)
          .then(contact =>{
               this.contactId = contact.id;
               this.dispatchEvent(
                    new ShowToastEvent({
                         title: 'Success',
                         message: 'Contact Created Successfully & contactId :: '+this.contactId +' Contact Name '+this.name,
                         variant: 'success',
                    })
               );
          })
          .catch(error =>{
               this.dispatchEvent(
                    new ShowToastEvent({
                         title: 'Something Went Wrong',
                         message: 'Error --->'+error.body.message,
                         variant: 'error',
                    }),
               );
          });
     }
}