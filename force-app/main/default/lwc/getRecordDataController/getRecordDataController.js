import { LightningElement,track,wire } from 'lwc';
import getAccounts from '@salesforce/apex/getRecordDataController.getAccounts';
import getContacts from '@salesforce/apex/getRecordDataController.getContacts';

export default class GetRecordDataController extends LightningElement {
    areDetailsVisible = false;

    @track columns = [
        {label:"Name",fieldName:"Name"},
        {label:"Id",fieldName:"Id"}
    ];

    @track columns1 = [
        {label:"FirstName",label:"FirstName"},
        {label:"LastName",label:"LastName"}
    ]

    @track contactList;
    @track accountList;

    handlechange(event){
        this.areDetailsVisible = event.target.checked;
    }
    @wire(getAccounts) wiredAccounts({data,error}){
        if(data){
            this.accountList = data;
            console.log(data);
        }else if(error){
            console.log(error);
        }
    }

   
    @wire(getContacts) wiredContacts({data,error}){
        if(data){
            this.contactList = data;
            console.log(data);
        }else if(error){
            console.log(error);
        }
    }
}