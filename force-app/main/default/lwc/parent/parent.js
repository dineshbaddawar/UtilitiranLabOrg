import { LightningElement, track } from 'lwc';

export default class Parent extends LightningElement {

    @track parentValue = "Second Value";

    handleEvent(event){
        debugger;
        alert('Custom Event Fired');
        this.parentValue = 'Custom  Event Value';
        alert('First Value '+event.detail.firstparam);
        alert('Second Value '+event.detail.secondparam);
        //console.log('Parameter from Child Conslole Log '+event.detail);
    }


    // handleChange(){
    //     this.parentValue = "Third Value";
    // }
    // callChild(){
    //     var childCompVar = this.template.querySelector('c-child ');
    //     var sendParam = {'firstName': 'Dinesh'};
    //     childCompVar.testChildMethod(sendParam);
    // }
}