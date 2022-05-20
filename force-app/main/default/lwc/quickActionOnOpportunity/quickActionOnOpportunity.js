import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import Parentid_FIELD from '@salesforce/schema/Opportunity.Id';

export default class RecordFormCreateExample extends LightningElement {
    // objectApiName is "Opportunity" when this component is placed on an account record page
    @api objectApiName;
    @api recordId;
    fields = [NAME_FIELD, CLOSEDATE_FIELD, STAGENAME_FIELD];

    recordId = this.Parentid_FIELD;
    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: 'Opportunity created',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }
}