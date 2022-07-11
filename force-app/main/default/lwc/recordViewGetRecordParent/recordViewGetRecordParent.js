import { LightningElement,wire,api } from 'lwc';
import { getRecord , getFieldValue } from 'lightning/uiRecordApi';
import ACCOUNT from '@salesforce/schema/Account';
import Field_Name from '@salesforce/schema/Account.Name';
import Field_OWnerEmail from '@salesforce/schema/Account.Owner.Email';
export default class RecordViewGetRecordParent extends LightningElement {

     objectApiName = ACCOUNT;
     nameField = Field_Name;
     @api recordId;
     @api objectApiName;

     @wire(getRecord , {recordId: '$recordId', fields:[Field_OWnerEmail]})
     record;

     get ownerField(){
          return this.record .data ? getFieldValue(this.record.data, Field_OWnerEmail) : '';
     }
}