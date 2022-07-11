import { LightningElement,track } from 'lwc';
//import getAccRecord from '@salesforce/apex/StudentController.getAccRecord';
import StudentRecord from '@salesforce/apex/StudentController.StudentRecord';
export default class ComboBoxInLWC extends LightningElement {
     // value = '';
     value = '';
     // @track accOption = [];
     @track option = [];

     // get options(){
     //      return this.accOption;
     // }

     // connectedCallback(){
     //      getAccRecord()
     //      .then(response =>{
     //           let accArray =[];
     //           for(var i=0; i<response.length; i++){
     //                accArray.push({label: response[i].Name, value: response[i].Id})
     //           }
     //           this.accOption = accArray;
     //      })
     // }

     // handleChange(event){
     //      this.value = event.detail.value;
     // }

     get options(){
          return this.option;
     }

     connectedCallback(){
          StudentRecord()
          .then(result =>{
               let arr = [];
               for(var i=0; i<result.length; i++){
                    arr.push({label: result[i].Name, value: result[i].Id})
               }
               this.option = arr;
          })
     }

     changeHandle(event){
          this.value = event.detail.value;
     }

}