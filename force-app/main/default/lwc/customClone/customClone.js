import { LightningElement,api } from 'lwc';

export default class CustomClone extends LightningElement {
     @api recordId;
     @api objectApiName;
     fields = ['AccountId', 'Id', 'Name', 'Title', 'Phone', 'Email'];
}