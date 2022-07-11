import { LightningElement } from 'lwc';
import School_OBJ from '@salesforce/schema/School__c';

export default class LwcRecordFormModeTypes extends LightningElement {
     objectApiName = School_OBJ;
     recordId = 'a025j000007N7oMAAS';
     // Here we need to pass Field which we want to show.
     fieldSet = ['Name','Fees__c'];
}