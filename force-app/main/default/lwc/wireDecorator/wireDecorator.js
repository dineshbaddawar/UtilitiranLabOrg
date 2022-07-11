import { LightningElement,wire,track } from 'lwc';
import StudentRecord from '@salesforce/apex/StudentController.StudentRecord';
import getSchoolRec from '@salesforce/apex/StudentController.getSchoolRec';
const columns = [
     {label: 'Name',fieldName: 'Name'},
     {label: 'RecordId', fieldName: 'Id'},
     {label: 'Phone', fieldName: 'Phone__c'},
] 

const getColumns = [
     {label: "Name", fieldName: "Name"},
     {label: "Email", fieldName: "Email__c"},
     {label: "Record Id", fieldName: "Id"},
]



export default class WireDecorator extends LightningElement {

 @track columns = columns;
 @track data1 = [];

 @wire(StudentRecord)
 wiredFunction({data, error}){
     if(data){
this.data1 = data;
     }else if(error){
     console.log('Error Occured');
     }
 }

 @track getcolumns = columns;
 @track getdata = [];

 @wire(getSchoolRec)
wireScFunction({data, error}){
     if(data){
          this.getdata = data;
     }
     else if(error){
          console.log('Error is Occured');
     }
}


}