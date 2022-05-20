import { LightningElement, wire } from 'lwc';
import getContactFields from '@salesforce/apex/SobjectWithFields.getContactFields';

export default class GetContactFields extends LightningElement {
    @wire(getContactFields) wiredContactFields;
}