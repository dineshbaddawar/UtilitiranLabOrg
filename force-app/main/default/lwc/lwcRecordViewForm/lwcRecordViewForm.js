import { LightningElement,api } from 'lwc';
//import School_Object from '@salesforce/schema/School__c';
import School_Name from '@salesforce/schema/School__c.Name';
import School_Fess from '@salesforce/schema/School__c.Fees__c';
import School_Email from '@salesforce/schema/School__c.Email__c';
export default class LwcRecordViewForm extends LightningElement {

     //objectApiName = School_Object;
     nameField = School_Name;
     fessField = School_Fess;
     emailField = School_Email;
     @api recordId;
     @api objectApiName;
}