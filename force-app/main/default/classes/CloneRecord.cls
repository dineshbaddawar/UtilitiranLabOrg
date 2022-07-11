public with sharing class CloneRecord {

    @AuraEnabled 
    public Static void CloneRecords(){
        try{
              // retrive contact record for clone
        Contact con = [SELECT Id,FirstName,LastName FROM Contact LIMIT 1];
        // Clone Record 
        Contact conCopy = con.clone(false, false, false, false);
        insert conCopy;
        }catch(Exception e){
                System.debug('The Error '+e.getMessage());
                System.debug('Erron Line '+e.getLineNumber());
            }
      
    }
}