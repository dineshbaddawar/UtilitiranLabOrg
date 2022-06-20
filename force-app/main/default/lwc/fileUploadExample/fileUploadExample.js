import { LightningElement,api } from 'lwc';

export default class FileUploadExample extends LightningElement {

    @api myRecordId;

    get acceptedFormat(){
        return ['.pdf', '.doc'];
    }

    handleUploadFinished(event){

        // get the list of uploaded Files
        const uploadedFiles = event.detail.files;
        window.alert('No of Files uploaded : '+uploadedFiles.length);
    }
}