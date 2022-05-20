import { LightningElement,track,wire } from 'lwc';
import getAccountList from '@salesforce/apex/DynamicAccountHelper.getAccountList';
import getNewAccountList from '@salesforce/apex/DynamicAccountHelper.getNewAccountList';
export default class LightningDataTableDynamic extends LightningElement {

    @track coumns = [
        {
            label: 'Account name',
            fieldName: 'Name',
            type: 'text',
            sortable: true
        },
        {
            label: 'Phone',
            fieldName: 'Phone',
            type: 'phone',
            sortable: true
        }

    ];

    @track error;
    @track accList;
    @wire(getAccountList) wiredAccount({error, data}){
        if(data){
            console.log('The Data--->'+data);
            console.log('Required Length');
            console.log(Object.keys(data).length);
            console.log(Object.keys(data));
            this.accList = data;
        }else if (error){
            this.error = error;
        }
    }

    handleClick(event){
        var accNo;
        if(event.target.label === 'Show More')
        accNo = 20;
        if(event.target.label === 'Show Less')
        accNo = 5;
        
        getNewAccountList({accNo}).then(result =>{
            //console.log(JSON.parse(result));
            this.accList = result ;
             console.log('Object Returned');
             //this.initialiseFullCalendarJs();
             this.error = undefined;
         })
         .catch(error => {
             console.log(error);
             console.log('error');
             this.error = error;
             //this.outputResult = undefined;
         });

    }
}