import { LightningElement,api } from 'lwc';
import SendMessageTemplate from '@salesforce/apex/WhatsAppContactController.SendMessageTemplate';

export default class WhatsappIntegration extends LightningElement {
     @api recordId;

     sendMessage(){
          SendMessageTemplate ({ contactId : this.recordId})
          .then( result =>{
               window.alert("Message Sent Successfully");
          })
          .catch(error =>{
               window.alert("Message Send Failed");
          })
     }
}