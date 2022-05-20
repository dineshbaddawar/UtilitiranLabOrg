import { LightningElement } from 'lwc';

export default class HelloIterator extends LightningElement {

    contacts = [
        { 
            Id: 1,
            Name: 'Dinesh Baddawar',
            Title: 'Salesforce Developer',
         },
         { 
            Id: 2,
            Name: 'Ganesh Baddawar',
            Title: 'Police Man'
         },
         { 
            Id: 3,
            Name: 'Vijalaxmi Baddawar',
            Title: 'House Wife',
         },
    ];
}