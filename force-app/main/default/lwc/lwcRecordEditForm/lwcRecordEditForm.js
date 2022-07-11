import { LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

import Account_Obj from "@salesforce/schema/Account";
import Account_Name from "@salesforce/schema/Account.Name";
import Account_Phone from "@salesforce/schema/Account.Phone";
import Account_Email from "@salesforce/schema/Account.Industry";
export default class LwcRecordEditForm extends LightningElement {
  ObjectApiName = Account_Obj;
  nameField = Account_Name;
  phoneField = Account_Phone;
  IndustryField = Account_Email;
  accId = "Id Will Show Here";

  handleSuccess(event) {
    console.log("onsubmit event recordEditForm" + event.detail.value);
    this.accId = event.detail.id;
    const events = new ShowToastEvent({
      title: "Successful",
      message: "Submited Successfully" + event.detail.Id,
      variant: "success"
    });
    this.dispatchEvent(events);
  }
}