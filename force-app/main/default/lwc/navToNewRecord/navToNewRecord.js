import { LightningElement, wire, api, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import getFieldFromFieldSet from '@salesforce/apex/GetFieldSet.getFieldFromFieldSet';

export default class NavToNewRecord extends NavigationMixin(LightningElement) {
    @api recordId;
    @track result;

    @wire(getFieldFromFieldSet, { oppId: '$recordId' })
    getOppRecords({ error, data }) {
        if (data != null) {
            this.navigateToNewContactWithDefaults(data);
        } else {
        console.log('The Error --> ' + error);
        }
    }

    navigateToNewContactWithDefaults(datJSON) {
        const defaultValues = encodeDefaultFieldValues(datJSON);
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Opportunity',
                actionName: 'new'
            },
            state: {
                defaultFieldValues: defaultValues
            }
        });
    }
}

