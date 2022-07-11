import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ShowToastMessage extends LightningElement {
    message = 'Hello World';
    message1 = 'Dinesh Baddawar';
    // 1st function
     showToast(){
// calling 2nd function & passing argument
       this.callShowToast(this.message);
     }

     // 2nd function
     callShowToast(messageArgument){
          const evt = new ShowToastEvent({
               title: 'ShowToast Message--> '+messageArgument,
               message: 'Message Send Successfully',
               variant: 'success'
          });
          this.dispatchEvent(evt);
     }

     showError(){
          this.showErrorToast(this.message1);
     }
     showErrorToast(messageArgument1){
          const evnt = new ShowToastEvent({
               title: 'Error ---> '+messageArgument1,
               message : 'This is Error ShowToast',
               variant : 'error'
          })
          this.dispatchEvent(evnt);
     }
}