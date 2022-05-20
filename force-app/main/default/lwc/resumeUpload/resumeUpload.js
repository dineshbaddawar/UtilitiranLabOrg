import { LightningElement,api } from 'lwc';

export default class ResumeUpload extends LightningElement {
    @api recordId;
     fileData
    openfileUpload(event){
        const file = event.target.files[0]
        var reader = new FileReader()
        reader.onload =()=>{
           var base = reader.result.split(',')[1]
           this.fileData = {
               'filename':file.name,
               'base':base,
               'recordId':this.recordId
           }
         
           console.log(this.fileData) 
        }
      
       reader.readAsDataURL(file)
    }
}