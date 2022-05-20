import { LightningElement ,api, wire, track} from 'lwc';
import getAccountList from '@salesforce/apex/AccountHelper_1.getAccountList';
import getNewAccountList from '@salesforce/apex/AccountHelper_1.getNewAccountList';
export default class AccountHelper_1 extends LightningElement {

    @track columns = [{
        label: 'Account name',
        fieldName: 'Name',
        type: 'text',
        sortable: true
    },
    {
        label: 'Type',
        fieldName: 'Type',
        type: 'text',
        sortable: true
    },
    {
        label: 'Annual Revenue',
        fieldName: 'AnnualRevenue',
        type: 'Currency',
        sortable: true
    },
    {
        label: 'Phone',
        fieldName: 'Phone',
        type: 'phone',
        sortable: true
    },
    {
        label: 'Website',
        fieldName: 'Website',
        type: 'url',
        sortable: true
    },
    {
        label: 'Rating',
        fieldName: 'Rating',
        type: 'test',
        sortable: true
    }
];

@track error;
@track accList ;
@wire(getAccountList)
wiredAccounts({
    error,
    data
}) {
    if (data) {
        console.log(data);
        console.log('Required Length');
        console.log(Object.keys(data).length);
        console.log(Object.keys(data));
        this.accList = data;
    } else if (error) {
        this.error = error;
    }
}
handleClick(event) {
    var lim;
    if(event.target.label ==='SHOW MORE')
        lim = 20 ;
    if(event.target.label ==='SHOW LESS')
        lim = 5;


    getNewAccountList({lim}).then(result =>{
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