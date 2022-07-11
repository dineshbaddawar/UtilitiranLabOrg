import { LightningElement,wire,api } from 'lwc';
import getOppList from '@salesforce/apex/Opportunity_Controller.getOppList';
import { refreshApex } from '@salesforce/apex';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OPP_OBJ from '@salesforce/schema/Opportunity';
import OPP_NAME from '@salesforce/schema/Opportunity.Name';
import OPP_Stage from '@salesforce/schema/Opportunity.StageName';
import OPP_CloseDATE from '@salesforce/schema/Opportunity.CloseDate';
import OPP_ID from '@salesforce/schema/Opportunity.Id';

const columns = [
     {
          label: "Name",
          fieldName : OPP_NAME.fieldApiName,
          editable: true
     },
     {
          label: "StageName",
          fieldName: OPP_Stage.fieldApiName,
          editable: true
     },
     {
          label: "CloseDate",
          fieldName : OPP_CloseDATE.fieldApiName,
          type: 'date',
          editable: true
     }
];

export default class OpportunityDatatableInlineEditingWithUI extends LightningElement {

     columns = columns;
     @api recordId;
     draftValues = [];

     @wire(getOppList, { accId : '$recordId'})
     opp;

     async handleSave(event){
          // Converting datatable draft values into the Objects
          const records = event.detail.draftValues.slice().map((draftValue) =>{
               const fields = Object.assign({}, draftValue);
               return { fields };
          });

          // Clearing all datatable Draft values
          this.draftValues = [];

          try{
               const updateOppPromise = records.map((record) =>
               updateRecord(record)
               );
               await Promise.all(updateOppPromise);

               // Datatable with Success Toast Message
               this.dispatchEvent(
                    new ShowToastEvent({
                         title: 'Success',
                         message: 'Record Updated Successfully '+this.opp.value,
                         variant: 'success'
                    })
               );

               // Displaying the Update data in the Datatable
               await refreshApex(this.opp);

          } catch (error){
            this.dispatchEvent(
               new ShowToastEvent({
                    title: 'Error',
                    message: 'Something Went Wrong '+error.body.message,
                    variant: 'error'
               })
            );
          }
     }

}