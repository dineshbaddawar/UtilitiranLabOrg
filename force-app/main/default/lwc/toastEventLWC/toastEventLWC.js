import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ToastEventLWC extends LightningElement {

    apex = 'Salesforce CRM'; // calling this in showToastEvent
 // 1st function
    hanldeChange(){
        window.alert('Buttonn Clicked');
        this.showToast(this.apex);
    }


    // 2nd function
    showToast(firstfunArgument){
        const evt = new ShowToastEvent({
            title: firstfunArgument,
            message: 'Message Body',
            variant: 'success',
        })
        this.dispatchEvent(evt);
    }
}