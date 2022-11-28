/**
 * @author [Dinesh B]
 * @email dinesh.b@utilitarianLab.com
 * @create date 2022-07-11 15:32:03
 * @modify date 2022-07-11 15:32:03
 * @desc [description]
 */
 
public without sharing class GetFieldSet {

@AuraEnabled(cacheable=true)
public Static Opportunity getFieldFromFieldSet( String oppId){

    List<Schema.FieldSetMember> getListOfFieldSet  = SobjectType.Opportunity.FieldSets.FiledSet_Opp.getFields();
    List<String> FieldSet = new List<String>();

    try{
        for(Schema.FieldSetMember fieldsToAdd : getListOfFieldSet){
            FieldSet.add(String.valueOf(fieldsToAdd.sobjectfield));
            }

            String query ='SELECT ';
            query += String.join(FieldSet, ',');
            query += ' FROM Opportunity WHERE Id =: oppId';
            Database.query(query);

            Opportunity opp =  Database.query(query);
            return opp;

        }catch(Exception e){
            System.debug('Erron Line '+e.getMessage());
        }
         return null;
     }
}