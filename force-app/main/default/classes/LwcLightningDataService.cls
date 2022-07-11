public with sharing class LwcLightningDataService {
   
    /*

    1. lightning-record-form

    HtmlFiel

    <template>
    <lightning-card title="Passing All Fields in Record Form">
     <div class="slds-m-around_medium">
          <lightning-record-form record-id={recordId}
          object-api-name={objectApiName}
          fields={fields}>
</lightning-record-form>
     </div>
    </lightning-card>
</template>

JSFile

import { LightningElement,api } from 'lwc';

export default class RecordFormFieldSet extends LightningElement {
     @api recordId;
     @api objectApiName;
     fields = ['AccountId', 'Id', 'Name', 'Title', 'Phone', 'Email'];
}


    2. lightning-record-view-form

    HtmlFile

    <template>
    <lightning-card title="Record View Form">
     <lightning-record-view-form 
                                 record-id={recordId}
                                 object-api-name={objectApiName}
                                 density="compact" >
                                 <div class="slds-m-around_medium">
                                       <lightning-output-field field-name="Name"></lightning-output-field>
                                       <lightning-output-field field-name="Phone"></lightning-output-field>
                                       <lightning-output-field field-name="AccountId"></lightning-output-field>
                                       <lightning-output-field field-name="Email"></lightning-output-field>
                                       <lightning-output-field field-name="Id"></lightning-output-field>
                                   </div>
     </lightning-record-view-form>
     
    </lightning-card>
</template >


   JsFile

   import { LightningElement,api } from 'lwc';

export default class RecordViewForm extends LightningElement {
    @api recordId;
    @api objectApiName;

}

  
   3. Display Record Data in a Custom User Interface Using getRecord

   HtmlFile

   <template>
  <lightning-card title="Displaying Record Data Using getRecord">
     <lightning-record-view-form record-id={recordId}
                                 object-api-name={objectApiName}
                                 density="compact">
                                 <div class="slds-m-around_medium">
                                   <lightning-formatted-text value={nameValue} class="slds-text-heading_medium">
                                   </lightning-formatted-text>
                                 </div>
     </lightning-record-view-form>
    </lightning-card>
</template>


  JsFile

//   import { LightningElement, api, wire } from 'lwc';
// /* Wire adapter to fetch record data */
// import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
// import ACCOUNT from '@salesforce/schema/Account';
// import ACCOUNT_NAME from '@salesforce/schema/Account.Name';


// export default class RecordViewGetRecord extends LightningElement {
// /** Id of record to display. */
//      @api recordId;
//      /* Expose schema objects/fields to the template. */
//      objectApiName = ACCOUNT;

//      /* Load Account.Name for custom rendering */
//      @wire(getRecord, { recordId : '$recordId', fields: [ACCOUNT_NAME]})
//      record;

//      /** Get the Account.Name value. */
//      get nameValue(){
//           return this.record.data ? getFieldValue(this.record.data, ACCOUNT_NAME) : '';
          
//      }
// }


/*

    4. Displaying Data from Parent Record Using getRecord

    HtmlFile

    <template>
    <lightning-card title="Displaying Data from Parent Record Using getRecord">
     <lightning-record-view-form object-api-name={objectApiName}
                                 record-id={recordId}>
                                 <lightning-messages></lightning-messages>
                                 <lightning-output-field field-name={nameField}></lightning-output-field>
                                 <div class="slds-from-element slds-from-element_stacked">
                                   <span class="slds-from-element_label">Owner Email</span>
                                   <div class="slds-from-element_control">
                                        <lightning-formatted-email value={ownerField}></lightning-formatted-email>
                                   </div>
                                 </div>
                              </lightning-record-view-form>
    </lightning-card>
</template>

   
  JsFile

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


     
//     */
}