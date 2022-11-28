public with sharing class FileUploadController {
     
    @AuraEnabled
    public static Id SaveFile(Id parentId, String fileName, String base64Data, String contentType) {
        try{
            System.debug('parentId ::'+parentId);
            System.debug('fileName ::'+fileName);
            System.debug('base64Data ::'+base64Data);
            System.debug('ContentType ::'+fileName);
            base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
            Attachment attach = new Attachment();
            attach.parentId = parentId;
            attach.Body = EncodingUtil.base64Decode(base64Data);
            attach.Name = fileName;
            attach.ContentType = contentType;
            Insert attach;
            System.debug('the Attach File ::'+attach);
            return attach.Id;
        }Catch(Exception e){
            System.debug('The Error Message ::'+e.getMessage() +'AND Error Line ::'+e.getLineNumber());
            return null;
        }
        
    }
}