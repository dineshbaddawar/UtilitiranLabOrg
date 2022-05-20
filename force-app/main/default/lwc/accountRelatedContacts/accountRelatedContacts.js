import { LightningElement,track,wire,api } from 'lwc';
import getContactsRelatedToAccount from 
'@salesforce/apex/LWCcontroller.getContactsRelatedToAccount';
export default class AccountRelatedContacts extends LightningElement {
    @api recordId;
    @track contacts;
    @track columns = [
        { label: 'First Name', fieldName: 'FirstName', type: 'text' },
        { label: 'Last Name', fieldName: 'LastName', type: 'text' },
        { label: 'Email', fieldName: 'Email'}
    ];

    @wire(getContactsRelatedToAccount, {accId: '$recordId'}) 
    WireContactRecords({error, data}){
        if(data){
            this.contacts = data;
            this.error = undefined;
        }else{
            this.error = error;
            this.contacts = undefined;
        }
    }

}