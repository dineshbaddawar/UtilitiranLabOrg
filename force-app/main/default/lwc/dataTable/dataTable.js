import { LightningElement , wire, api, track } from 'lwc';
import getContactList from '@salesforce/apex/dataTableWithRowSelection.getContactList';
const columns = [
     {label: 'Name', fieldName: 'Name'},
     {label: 'Phone', fieldName: 'Phone'},
     {label: 'Email', fieldName: 'Email'}
]

export default class DataTable extends LightningElement {
     @track showContacts = 'Show Contacts';
     @track isVisible = false;
     columns = columns;
     @track data = [];
     @api recordId; // getting current recordId
     @api searchKey = '';

     // get related All contactList from apex class
      connectedCallback(){
          getContactList({lwcRecordId : this.recordId})
          .then( response =>{
               this.data = response;
          })
          .catch(err=>{
               console.log("the Error "+err);
          } )
      }

      // Search Functionality
      handleChanged(event){
        this.searchKey = event.target.value;
        console.log("SearchKey:"+JSON.stringify(this.searchKey))

        // sending searchKey and recordId to Apex Method
        getContactList({ searchKeys : this.searchKey , lwcRecordId : this.recordId})
     //    getContactList({ searchKeys : '$searchKey' , lwcRecordId : '$recordId'})
        .then(res =>{
          this.data = res;
        })
        .catch(error =>{
          console.log(error);
        })
      }

     // Showing Hide/Show Functionality
     handleClick(event){
          const label =event.target.label;
          if(label === 'Show Contacts'){
               this.showContacts = 'Hide Contacts';
               this.isVisible = true;
          }
          else if(label === 'Hide Contacts'){
               this.showContacts = 'Show Contacts';
               this.isVisible = false;
          }
     }

     // Get details of Selected row Details
     getSelectedRows(event){
          const selecredRowDetails = event.detail.selectedRows;
          console.log('Details ----> '+JSON.stringify(selecredRowDetails));
          window.alert(JSON.stringify(selecredRowDetails));
     }
}