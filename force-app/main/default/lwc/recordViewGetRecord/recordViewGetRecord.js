import { LightningElement, api, wire } from 'lwc';
/* Wire adapter to fetch record data */
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import ACCOUNT from '@salesforce/schema/Account';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';


export default class RecordViewGetRecord extends LightningElement {
/** Id of record to display. */
     @api recordId;
     /* Expose schema objects/fields to the template. */
     objectApiName = ACCOUNT;

     /* Load Account.Name for custom rendering */
     @wire(getRecord, { recordId : '$recordId', fields: [ACCOUNT_NAME]})
     record;

     /** Get the Account.Name value. */
     get nameValue(){
          return this.record.data ? getFieldValue(this.record.data, ACCOUNT_NAME) : '';
          
     }
}