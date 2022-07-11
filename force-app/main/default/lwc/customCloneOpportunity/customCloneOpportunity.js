import { LightningElement,api } from 'lwc';

export default class CustomCloneOpportunity extends LightningElement {
     @api recordId;
     @api objectApiName;
     fields = ['Name', 'StageName', 'CloseDate', 'Phone__c','Amount','CloseDate','LeadSource','Type'];
}