import { LightningElement,wire,track } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';
import getContacts from '@salesforce/apex/AccountController.getContacts';

const columns = [{
      label:'FirstName',
      fieldName:'FirstName'
},
{
    label:'LastName',
    fieldName:'LastName'
}
];



export default class AccountContactOppSearch extends LightningElement {

    @track accountId = '';
    @track contacts;
    @track columns = columns;

    @wire(getAccountList) accounts;
    onValueSelection(event){
        const selectedAccount = event.target.value;
        this.accountId = event.target.value;
        if(selectedAccount != null){
            getContacts({
                accountId: selectedAccount
            })
            .then(result =>{
                this.contacts = result;
            })
            .catch(error =>{
                this.error = error;
            });
        }
    }

}