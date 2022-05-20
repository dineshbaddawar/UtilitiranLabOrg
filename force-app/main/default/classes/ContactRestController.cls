@RestResource(urlMapping='/ContactRest/*')
global class ContactRestController {

    // Create Contact
    @HttpPost
   
    global static String CreateContact(){
        ContactInfo con=ContactInfo.parse(RestContext.request.requestBody.tostring());
        
        Contact newcon = new Contact();
        newcon.FirstName = con.FirstName;
        newcon.LastName = con.LastName;
        newcon.Email = con.Email;
        newcon.Phone = con.Phone;
        insert newcon;
        return newcon.Id;
    }
    
    }   
    
    /*
    // Retrieve Contact by Id
    @HttpGet
    global Static Contact searchContactById(){
        
        // Get the handle of the request
        RestRequest request = RestContext.request;
        // Parse the ContactId to search from the request url
        Id searchContactId = request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);
        
        Contact searchContact = [SELECT Id,FirstName,LastName,Phone,Email FROM Contact WHERE Id =:searchContactId];
        return searchContact;
    }  */