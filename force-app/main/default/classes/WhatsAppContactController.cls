/**
 * @author [Dinesh B]
 * @email dinesh.b@utilitarianLab.com
 * @create date 2022-06-02 16:45:58
 * @modify date 2022-06-02 16:45:58
 * @desc [description]
 */

public with sharing class WhatsAppContactController {
    
    @AuraEnabled 
    public static Boolean SendMessageTemplate(String contactId){
        
        Contact con = [SELECT Id,Phone FROM Contact WHERE ID =:contactId];
        
        string whatsAppNumber = '91' +con.Phone;
        System.debug('WhatsApp Number :: '+whatsAppNumber);
        
        Http http = new Http();
        
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint('https://graph.facebook.com/v13.0/112603961465834/messages');
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        
        String body ='{ "messaging_product": "whatsapp","to": "'+whatsAppNumber+'", "type": "template","template": { "name": "hello_world", "language": { "code": "en_US" } }}';
        req.setBody(body);
        String GetAccessToken = 'EAAG42Epc7jsBAGJdyMMIBpoEZAQAsZAdzlcfilrKmU7hlYcHJoBKdCnir4d9tN7WcRsZBbq10QtHfgwJvXknSD7jo9vai1oXkcQBZBnYLrHZCZCZCnemZA1AsGZBDzhJ4Ep0VeE0jReNyWU2QjyN4viNKwrbku9xSublQhDUlUC85siX1uTFO4BBq0eDEyjLD7AQBge9uOwry9Aac9sa9u8ZBZC';
        req.setHeader('Authorization','Bearer '+GetAccessToken);
        
        HttpResponse res = http.send(req);
        System.debug('Body--->'+body);
        System.debug('the Request Body--->'+res.getBody());
        System.debug('the Request Status --->'+res.getStatusCode());
        
        if(res.getStatusCode() == 200){
            Map<String, Object> getResult = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            System.debug('RESULTS:: ' + getResult);
            return true;
        }else{
            return false;
        }
        
    }
}