import { LightningElement } from 'lwc';
import LastName from '@salesforce/schema/Contact.LastName';
import FirstName from '@salesforce/schema/Contact.FirstName';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';

export default class ContactCreateLWC extends LightningElement {
    objectApiName = 'Contact';
    fields =[LastName,FirstName,ShowToastEvent,NavigationMixin];

    handleContact(event){
        const evt = new ShowToastEvent({
            title : 'Contact Created',
            message: 'Record ID ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId : event.detail.id,
                objectApiName: 'Contact',
                actionName : 'view',
            },
        });
    }
}