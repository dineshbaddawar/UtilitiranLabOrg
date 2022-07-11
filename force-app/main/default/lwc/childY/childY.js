import { LightningElement,track,api } from 'lwc';

export default class ChildY extends LightningElement {

     @track apiParam = 'Hello World Before Button Click';
     @track trackParam = 'Hello World Before Button Click';
     nonReactive = 'Hello World Before Button Click ';

     changeValue(){
          this.apiParam = 'Value Change from api ';
          this.trackParam = 'Value Change from Track';
          this.nonReactive = 'Value Change from Non Reactive value';
     }
}