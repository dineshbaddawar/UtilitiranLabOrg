import { LightningElement,wire,track } from 'lwc';
import getSchoolRec from '@salesforce/apex/StudentController.getSchoolRec';
import accRecord from '@salesforce/apex/StudentController.accRecord';

export default class ForEachLoop extends LightningElement {

  @track data = [];

     @wire(getSchoolRec)
     SchoolData;

     @track accdata = [];

     @wire(accRecord)
     accRecData;
    

  }