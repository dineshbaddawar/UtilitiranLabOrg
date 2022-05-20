import { LightningElement,track } from 'lwc';

const columns = [
    { label : 'Student record Id' , fieldName: "Id"},
    { label: 'Student Name',  fieldName: "Name"},
]

export default class ImperativeMethodInLWC extends LightningElement {

    @track columns = columns;
}