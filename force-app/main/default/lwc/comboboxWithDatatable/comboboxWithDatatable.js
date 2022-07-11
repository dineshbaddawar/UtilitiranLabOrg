import { LightningElement,track } from 'lwc';
import getAccRecord from '@salesforce/apex/StudentController.getAccRecord';
import getContactsRecord from '@salesforce/apex/StudentController.getContactsRecord';
const columns = [
     {label: "FirstName", fieldName: "FirstName"},
     {label: "LastName", fieldName: "LastName"},
     {label: "Email", fieldName: "Email"}
]

export default class ComboboxWithDatatable extends LightningElement {
     @track value = '';
     @track optionsArray = [];
     @track cardVisible = false; // Used for show/hide card functionality 
     @track data = []; // Used for Storing contact details in Datatable
     @track columns = columns;

     // Now store options by returning the  optionsArray
     get options(){
          return this.optionsArray;
     }

     // Calling apex method to get Account stored in Salesforce org Database
     connectedCallback(){
          getAccRecord()
          .then(response =>{
          let arr = []; // This array will Store the Accounts details in label and value pair
          for( var i=0; i<response.length; i++){
           // add the account Name as Label and Id as value in arr []
               arr.push({ label : response[i].Name, value : response[i].Id })
          }

          // store the arr objects into optionsArray
          this.optionsArray = arr;
          })
     }

     // Get the Selected Account RecordId
     handleChangeValue(event){

          // Whenever a account is Selected in combobox then "cardVisible" will become true & contact datatable will show to the user
          this.cardVisible = true;
          // store selected accountId in "value" property
          this.value = event.detail.value;
         // console.log("The Record Id--->"+JSON.stringify(this.value));

          // Calling Apex Method to get Contacts of Selected Account 
          getContactsRecord({ SelectedAccountId : this.value}) // passing selected Account recordId to Apex method to get related Contacts
          .then(result =>{
               this.data = result;
          })
          .catch(error =>{
              console.log("Error is Occured"+error);
          })
     }
}