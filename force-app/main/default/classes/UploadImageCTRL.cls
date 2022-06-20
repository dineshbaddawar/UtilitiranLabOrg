public inherited sharing class UploadImageCTRL {
    
    @AuraEnabled
    public static ContentVersion saveFile(Id idParent, String strFileName, String base64Data) {
        // Decoding base64Data
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        // inserting file
        ContentVersion cv = new ContentVersion();
        cv.Title = strFileName;
        cv.PathOnClient = '/' + strFileName;
        cv.FirstPublishLocationId = idParent;
        cv.VersionData = EncodingUtil.base64Decode(base64Data);
        cv.IsMajorVersion = true;
        Insert cv;
        return cv;
    }

    @AuraEnabled
    public static String releatedFiles(Id idParent){
        list<id> lstConDocs = new list<id>();
        for(ContentDocumentLink cntLink : [Select Id, ContentDocumentId From ContentDocumentLink Where LinkedEntityId =:idParent]) {
            lstConDocs.add(cntLink.ContentDocumentId);
        }
        if(!lstConDocs.isEmpty()) {
            ContentDistribution cdl = new ContentDistribution();
            cdl.ContentVersionId = [SELECT Id, Title, ContentDocumentId FROM ContentVersion WHERE ContentDocumentId IN :lstConDocs LIMIT 1].Id;
            cdl.Name = 'PublicShare';
            insert cdl;
            Account p = new Account();
            p.id = idParent;
            system.debug(idParent);
            p.thumbnailimage__c = [SELECT DistributionPublicUrl, ContentDownloadUrl FROM ContentDistribution WHERE Id = :cdl.Id LIMIT 1].ContentDownloadUrl;
            update p;
            system.debug(p.thumbnailimage__c);
            return [SELECT DistributionPublicUrl, ContentDownloadUrl FROM ContentDistribution WHERE Id = :cdl.Id LIMIT 1].ContentDownloadUrl;
        }
        else {
            return null;
        }
     
    }
    
}