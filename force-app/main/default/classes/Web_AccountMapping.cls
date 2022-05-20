@RestResource(urlMapping='/account_mappingurl/*')
global class Web_AccountMapping {

    @HttpPost
    global static ResponseWrapperClass.ResponseWrapper accountMapping(){
        ResponseWrapperClass.ResponseWrapper response = new ResponseWrapperClass.ResponseWrapper();
        AccountMappingWrapper accWrap = new AccountMappingWrapper();
        accWrap = AccountMappingWrapper.parse(RestContext.request.RequestBody.tostring());
        
        List<Account> accountListToBeInserted = new List<Account>();
        List<Account> childAccountListToBeInserted = new List<Account>();
        List<Contact> contactListToBeInserted = new List<Contact>();
        List<Opportunity> opportunityListToBeInserted = new List<Opportunity>();
        List<Lead> leadListToBeInserted = new List<Lead>();
        
        System.debug('accWrap-->'+accWrap);
        System.debug('accWrap number-->'+accWrap.mobile_number);
        System.debug('OpportunityList-->'+accWrap.subscriptions);
        System.debug('ContactList-->'+accWrap.Contacts);
        
        Account acc = new Account();
        acc.Name = accWrap.name;
        acc.Phone = accWrap.mobile_number;
        acc.Email__c = accWrap.email;
        accountListToBeInserted.add(acc);
        
        if(accWrap.subscriptions != null && !accWrap.subscriptions.isEmpty()){
            for(AccountMappingWrapper.cls_subscriptions oppDetails : accWrap.subscriptions){
                Opportunity opp = new Opportunity();
                opp.Name = oppDetails.subscription_type;
                opp.Amount = Decimal.valueOf(oppDetails.amount);
                opp.CloseDate = Date.valueOf(oppDetails.expired_at);
                opp.StageName = 'Prospecting';
                opportunityListToBeInserted.add(opp);
            }
        }
        
        if(accWrap.Contacts != null && !accWrap.Contacts.isEmpty()){
            for(AccountMappingWrapper.cls_Contacts conDetails : accWrap.Contacts){
                Contact con = new Contact();
                con.FirstName = conDetails.FirstName;
                con.LastName = conDetails.LastName;
                con.Email = conDetails.Email;
                contactListToBeInserted.add(con);
            }
        }
        
        if(accWrap.Leads != null && !accWrap.Leads.isEmpty()){
            for(AccountMappingWrapper.cls_Leads ledDetails : accWrap.Leads){
                Lead le = new Lead();
                le.FirstName =ledDetails.FirstName;
                le.LastName = ledDetails.LastName;
                le.Company = ledDetails.Company;
                le.Status = 'Open - Not Contacted';
                leadListToBeInserted.add(le);
               
            }
        }
        
        if(accWrap.companies != null && !accWrap.companies.isEmpty()){
            for(AccountMappingWrapper.cls_companies compDetails : accWrap.companies){
                Account childAcc = new Account();
                childAcc.Name = compDetails.name;
                childAcc.Email__c = compDetails.email;
                childAcc.Phone = compDetails.mobile_number;
                childAccountListToBeInserted.add(childAcc);
            }
        }
        
        if(!accountListToBeInserted.isEmpty()){
            Database.SaveResult[] result = Database.insert(accountListToBeInserted,false);
            response.success_account_list = new List<Account>();
            for(Integer index=0; index< result.size(); index++){
                if(result[index].isSuccess()){
                    response.success_account_list.add(accountListToBeInserted[index]);
                    
                    if(!contactListToBeInserted.isEmpty()){
                        for(Contact conRec : contactListToBeInserted){
                            conRec.AccountId = accountListToBeInserted[index].id;
                        }
                    }
                    
                    if(!opportunityListToBeInserted.isEmpty()){
                        for(Opportunity opps : opportunityListToBeInserted){
                            opps.AccountId = accountListToBeInserted[index].id;
                        }
                    }
                    
                    if(!leadListToBeInserted.isEmpty()){
                        for(Lead led : leadListToBeInserted){
                            led.Account__c = accountListToBeInserted[index].id;
                        }
                    }
                        
                    if(!childAccountListToBeInserted.isEmpty()){
                        for(Account accs : childAccountListToBeInserted){
                            accs.ParentId = accountListToBeInserted[index].id;
                        }
                    }else{
                        System.debug('Failed Accounts--->');
                    }
                }
                
                if(!childAccountListToBeInserted.isEmpty()){
                    response.success_child_account_list = new List<Account>();
                    Database.SaveResult[] childRes = Database.insert(childAccountListToBeInserted,false);
                    System.debug('Child Record ---->'+childRes);
                    for(Integer indexs=0; indexs< childRes.size(); indexs++){
                        if(childRes[indexs].isSuccess()){
                            response.success_child_account_list.add(childAccountListToBeInserted[indexs]);
                        }else{
                            System.debug('Failed Child Accounts');
                        } 
                    }
                }
                
                if(!leadListToBeInserted.isEmpty()){
                    response.success_lead_list = new List<Lead>();
                    Database.SaveResult[] ledResult = Database.insert(leadListToBeInserted,false);
                    System.debug('The Lead Record-->'+ledResult);
                    for(integer i=0;i<ledResult.size();i++){
                        if(ledResult[i].isSuccess()){
                            response.success_lead_list.add(leadListToBeInserted[i]);
                        }else{
                            System.debug('Failed Lead Records');
                        }
                    }
                }
                
                if(!contactListToBeInserted.isEmpty()){
                    response.success_contact_list = new List<Contact>();
                    response.failed_contact_list = new List<ResponseWrapperClass.failed_contact>();
                    Database.SaveResult[] conRes = Database.insert(contactListToBeInserted,false);
                    for(Integer index1=0; index1<conRes.size(); index1++){
                        if(conRes[index1].isSuccess()){
                            response.success_contact_list.add(contactListToBeInserted[index1]);
                        }else{
                            System.debug('Contact Failed');
                            System.debug('contactListToBeInserted[index].getErrors() --->'+contactListToBeInserted[index1].getErrors());
                            for(Database.Error err : conRes[index1].getErrors()){
                                ResponseWrapperClass.failed_contact failedContact = new ResponseWrapperClass.failed_contact();
                                System.debug('The Error is Inside the Block');
                                failedContact.contact_details = err.getMessage();
                              response.failed_contact_list.add(failedContact);
                            }
                        }
                    }
                }
                
                if(!opportunityListToBeInserted.isEmpty()){
                    response.success_subscription_list = new List<Opportunity>();
                    Database.SaveResult[] oppRes = Database.insert(opportunityListToBeInserted,false);
                    for(Integer index2 = 0 ; index2 < oppRes.size(); index2++){
                        if(oppRes[index2].isSuccess()){
                            response.success_subscription_list.add(opportunityListToBeInserted[index2]);
                        }else{
                            System.debug('Failed Contacts');
                        }
                    }
                }
            }
        }
        return response;
}
}