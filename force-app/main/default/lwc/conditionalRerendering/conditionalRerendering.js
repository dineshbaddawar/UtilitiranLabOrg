import { LightningElement, track, wire } from "lwc";
import getOppRecord from "@salesforce/apex/StudentController.getOppRecord";
import StudentRecord from "@salesforce/apex/StudentController.StudentRecord";

const columns = [
  { label: "Name", fieldName: "Name" },
  { label: "StageName", fieldName: "StageName" },
  { label: "CloseDate", fieldName: "CloseDate" }
];

const columns1 = [
  { label: "Name", fieldName: "Name" },
  { label: "RecordId", fieldName: "Id" },
  { label: "Phone", fieldName: "Phone__c" }
];

export default class ConditionalRerendering extends LightningElement {
  @track onClickButtonLabel = "Show";

  @track columns = columns;
  @track data = [];

  @track concolumns = columns1;
  @track condata = [];

  @wire(StudentRecord)
  wiredFunction({ data, error }) {
    if (data) {
      this.condata = data;
    } else if (error) {
      console.log("Error Occured");
    }
  }

  connectedCallback() {
    getOppRecord()
      .then((result) => {
        this.data = result;
      })
      .catch((error) => {
        console.log("Error is Occured");
      });
  }

  @track cardVisible = false;
  handleClick(event) {
    const buttonlabel = event.target.label;
    if (buttonlabel === "Show") {
      this.onClickButtonLabel = "Hide";
      this.cardVisible = true;
    } else if (buttonlabel === "Hide") {
      this.onClickButtonLabel = "Show";
      this.cardVisible = false;
    }
  }
}