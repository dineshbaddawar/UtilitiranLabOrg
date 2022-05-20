import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountHelper.getAccountList';
import getContactList from '@salesforce/apex/AccountHelper.getContactList';

export default class ConditionalRendering extends LightningElement {
    data1 = false;
    
    @wire(getAccountList) accounts;
    @wire(getContactList) contacts;

    handleChange(event){
        this.data1 = event.target.checked;
    }
}