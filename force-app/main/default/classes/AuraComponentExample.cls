public class AuraComponentExample {

    /* #===============> [# 1] add Sorting in Lightning Data Table
     Apex Class:

public class AuraCompUtilityClas {

    //  add Sorting in Lightning Data Table
    @AuraEnabled
    public static list<Account> getAccountList(){
        List<Account> accList= [Select Id, Name, Phone, CreatedDate From Account Order By CreatedDate];
        if(accList != null && accList.size()>0){
  return accList;
        }
        return null;
    }
}


COMP:

<aura:component controller="AuraCompUtilityClas" implements="force:appHostable,flexipage:availableForAllPageTypes,flexipage:availableForRecordHome,force:hasRecordId,forceCommunity:availableForAllPageTypes,force:lightningQuickAction" access="global" >
    <aura:attribute name="recordList" type="List"/>
    <aura:attribute name="columns" type="List"/>
    <aura:attribute name="sortedBy" type="String" default="Name"/>
 <aura:attribute name="sortedDirection" type="string" default="asc" />
    <aura:handler name="init" action="{!c.doInit}" value="{!this}" />
    
    <lightning:layout multipleRows="true" horizontalAlign="center">
            <lightning:layoutItem padding="around-small" size="12">
                <lightning:datatable keyField="id" data="{! v.recordList}"
                                     columns="{! v.columns}"
                                     hideCheckboxColumn="true"
                                     onsort="{!c.updateSorting}"
                                     sortedBy="{!v.sortedBy}"
                                     sortedDirection="{!v.sortedDirection}"  />
            </lightning:layoutItem>
    </lightning:layout>
</aura:component>

Cont:

({
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName:'Id',sortable:true,type:'text', initialWidth: 300},
            {label: 'Name', fieldName:'Name',sortable:true,type:'text', initialWidth: 400},
            {label: 'Phone', fieldName:'Phone',sortable:true,type:'text', initialWidth: 300},
            {label: 'Created Date', fieldName:'CreatedDate',sortable:true,type:'text', initialWidth: 400}
        ]);
        helper.getAccounts(component, helper);
    },
    updateSorting: function (cmp, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        cmp.set("v.sortedBy", fieldName);
        cmp.set("v.sortedDirection", sortDirection);

        helper.sortData(cmp, fieldName, sortDirection);
    },
    
})


Help:

({
    getAccounts : function(component, helper) {
        var action = component.get("c.getAccountList");
        action.setCallback(this, function(response) {
            var state = response.getState();
            var data;
            if(state === 'SUCCESS'){
                var result = response.getReturnValue();
                component.set("v.recordList", result);
            }
        });
        $A.enqueueAction(action);
    },
    sortData: function (cmp, fieldName, sortDirection) {
        var fname = fieldName;
        var data = cmp.get("v.recordList");
        var reverse = sortDirection !== 'asc';
        data.sort(this.sortBy(fieldName, reverse))
        cmp.set("v.recordList", data);
    },
    sortBy: function (field,	 reverse) {
        var key = function(x) {return x[field]};
        reverse = !reverse ? 1 : -1;
        return function (a, b) {
            return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
        }
    }
})


=========================================================================================================================================

# ================> [# 2]

# 2: Lightning DataTable With Row Action In Salesforce Lightning Component

Apex: 

public class addDeleteRow {
    @AuraEnabled
    public static void saveContacts(List<Contact> ListContact, String accId){
        system.debug('ListContact'+ ListContact);
        system.debug('accId' + accId);
        for(Contact con : ListContact){

            con.AccountId = accId;
        }  
        Insert ListContact;
    }

}

COMP:

<aura:component controller="addDeleteRow" Implements="flexipage:availableForRecordHome,force:hasRecordId, force:lightningQuickAction">

    <aura:handler name="init" value="{!this}" action="{!c.doInit}"/>
    <aura:attribute name="recordId" type="String"/>

    <aura:handler name="DeleteRowEvent" event="c:DeleteRowEvent" action="{!c.removeDeletedRow}"/>
    <aura:handler name="AddRowEvent" event="c:AddNewRowEvent" action="{!c.addNewRow}"/>

    <aura:attribute name="contactList" type="Contact[]"/>

    <div class="slds-page-header">
        <h1 class="slds-page-header__title">Create Multiple Contacts, With Add/Delete Rows Dynamically</h1>
    </div>

    <table class="slds-table slds-table_bordered slds-table_cell-buffer">
        <thead>
            <tr class="slds-text-title_caps">
                <th scope="col">
                    <div class="slds-truncate">S.No</div>
                </th>
                <th scope="col">
                    <div class="slds-truncate" title="First Name">First Name</div>
                </th>
                <th scope="col">
                    <div class="slds-truncate" title="Last Name">Last Name</div>
                </th>
                <th scope="col">
                    <div class="slds-truncate" title="Phone">Phone</div>
                </th>
            </tr>
        </thead>  
        <tbody>    
            <aura:iteration items="{!v.contactList}" var="item" indexVar="index">
                <c:AddingRowItem ContactInstance="{!item}" rowIndex="{!index}" />
            </aura:iteration>
        </tbody>
    </table>
    <br/>
    <button class="slds-button slds-button_brand" onclick="{!c.Save}">Save</button>
</aura:component>

CONT:

({
    doInit: function(component, event, helper) {
        helper.createObjectData(component, event);
    },

    Save: function(component, event, helper) {
        debugger;
        if (helper.validateRequired(component, event)) {
            var accId = component.get( "v.recordId" );
            var action = component.get("c.saveContacts");
            action.setParams({
                'ListContact' : component.get("v.contactList"),
                'accId' : accId
            });

            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {

                    component.set("v.contactList", []);
                    helper.createObjectData(component, event);
                    alert('record Save');
                }
            });

            $A.enqueueAction(action);
        }
    },

    addNewRow: function(component, event, helper) {        
        helper.createObjectData(component, event);
    },

    removeDeletedRow: function(component, event, helper) { 
        var index = event.getParam("indexVar");   
        var AllRowsList = component.get("v.contactList");
        AllRowsList.splice(index, 1);
        component.set("v.contactList", AllRowsList);
    },
})

HELP:

({
    createObjectData: function(component, event) {
        var RowItemList = component.get("v.contactList");
        RowItemList.push({
            'sobjectType': 'Contact',
            'FirstName': '',
            'LastName': '',
            'Phone': ''
        });
        component.set("v.contactList", RowItemList);
    },

    validateRequired: function(component, event) {
        var isValid = true;
        var allContactRows = component.get("v.contactList");
        for (var indexVar = 0; indexVar < allContactRows.length; indexVar++) {
            if (allContactRows[indexVar].FirstName == '') {
                isValid = false;
                alert('First Name Can\'t be Blank on Row Number ' + (indexVar + 1));
            }
        }
        return isValid;
    },
})

=========================================================================================================================================

# Blog:  # 3

Apex:

public class AuraController 
{   
    @AuraEnabled
    public static void saveAccountList(List<Account> accList) 
	{        
        Insert accList;
    }
}


COMP:


<aura:component controller="AuraController" Implements="force:appHostable,flexipage:availableForRecordHome,force:hasRecordId">
    <aura:attribute name="accountList" type="Account[]"/>
    <lightning:card>
        <div class="slds-m-around--xx-large">
            <div class="slds-float_right slds-p-bottom_small">
                <h1 class="slds-page-header__title">Add Row 
                    <lightning:buttonIcon iconName="utility:add"  size="large" variant="bare" alternativeText="Add" onclick="{!c.addRow}"/>
                </h1>
            </div>
            <div class="container-fluid">        
                <table class="slds-table slds-table_bordered slds-table_cell-buffer"> 
                    <thead>
                        <tr class="slds-text-title_caps">
                            <th scope="col">
                                <div class="slds-truncate">Sr. No</div>
                            </th>
                            <th scope="col">
                                <div class="slds-truncate" title="Account Name">Account Name</div>
                            </th>
                            <th scope="col">
                                <div class="slds-truncate" title="Phone">Phone</div>
                            </th>
                            <th scope="col">
                                <div class="slds-truncate" title="Fax">Fax</div>
                            </th>  
                            <th scope="col">
                                <div class="slds-truncate" title="Website">Website</div>
                            </th>  
                            <th scope="col">
                                <div class="slds-truncate" title="Action">Action</div>
                            </th>
                        </tr>
                    </thead>   
                    <tbody>      
                        <aura:iteration items="{!v.accountList}" var="acc" indexVar="index">
                            <tr>
                                <td> 
                                    {!index + 1}
                                </td>
                                <td>
                                    <lightning:input name="accName" type="text" maxlength="50" value="{!acc.Name}" />
                                </td>
                                <td>
                                    <lightning:input name="accPhone" type="phone" maxlength="10" value="{!acc.Phone}" />
                                </td>
                                <td>
                                    <lightning:input name="accFax" type="text" value="{!acc.Fax}" />
                                </td>
                                <td>
                                    <lightning:input name="accWebsite" type="text" value="{!acc.Website}" />
                                </td>
                                <td>
                                    <a onclick="{!c.removeRecord}" data-record="{!index}">
                                        <lightning:icon iconName="utility:delete" size="small" alternativeText="Delete"/>
                                        <span class="slds-assistive-text">Delete</span>
                                    </a>
                                </td> 
                            </tr>
                        </aura:iteration>
                    </tbody>
                </table>
                <div class="slds-align_absolute-center slds-p-top_small">
                    <lightning:button variant="brand" label="Submit" title="Brand action" onclick="{!c.saveAccounts}" />
                </div>
            </div>
        </div>
    </lightning:card>
</aura:component>



Cont:

({
    addRow: function(component, event, helper) {
        //get the account List from component  
        var accountList = component.get("v.accountList");
        //Add New Account Record
        accountList.push({
            'sobjectType': 'Account',
            'Name': '',
            'Phone': '',
            'Fax': '',
            'Website ': '', 
            
        });
        component.set("v.accountList", accountList);
    },
    
    removeRecord: function(component, event, helper) {
        //Get the account list
        var accountList = component.get("v.accountList");
        //Get the target object
        var selectedItem = event.currentTarget;
        //Get the selected item index
        var index = selectedItem.dataset.record;
        //Remove single record from account list
        accountList.splice(index, 1);
        //Set modified account list
        component.set("v.accountList", accountList);
    },
    	
    saveAccounts: function(component, event, helper) {      
        if (helper.validateAccountRecords(component, event)) {
            //Call Apex method and pass account list as a parameters
            var action = component.get("c.saveAccountList");
            action.setParams({
                "accList": component.get("v.accountList")
            });
            action.setCallback(this, function(response) {
                //get response status 
                var state = response.getState();
                if (state === "SUCCESS") {
                    //set empty account list
                    component.set("v.accountList", []);
                    alert('Accounts saved successfully');
                }
            }); 
            $A.enqueueAction(action);
        }
    },
})


Help:

({
    validateAccountRecords: function(component, event) {
        //Validate all account records
        var isValid = true;
        var accountList = component.get("v.accountList");
        for (var i = 0; i < accountList.length; i++) {
            if (accountList[i].Name == '') {
                isValid = false;
                alert('Account Name cannot be blank on '+(i + 1)+' row number');
            }
        }
        return isValid;
    },
})

=========================================================================================================================================

# BLOG: # 4

Apex:

public inherited sharing class LWCExampleController {
    @AuraEnabled
    public static map<String, String> getAccRatings(){
        map<String, String> options = new map<String, String>();
        Schema.DescribeFieldResult fieldResult = Account.Rating.getDescribe();
        List<Schema.PicklistEntry> lstPicklistValues = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry iterator: lstPicklistValues) {
            options.put(iterator.getValue(), iterator.getLabel());
        }
        return options;
    }
}


COMP:

<aura:component controller="LWCExampleController" implements="flexipage:availableForAllPageTypes">
    <!--Declaring variables-->
    <aura:attribute name="picklistValues" type="String[]"/>
    <aura:attribute name="selectedValue" type="String"/>
    <aura:attribute name="mapPicklistValues" type="Map" />

    <aura:handler action="{!c.fetchPicklistValues}" name="init" value="{!this}"/>

    <div class="slds-box slds-theme_default">
        <h2>
            <p>Radio Buttons in Horizontal View in Lightning Component</p>
        </h2><br/>
        <aura:iteration items="{!v.picklistValues}" var="item">
            <fieldset style="display: block; float: left;">
                <div class="slds-form-element__control">
                    <span class="slds-radio">
                        <input id="{!item}" name="radiogroup" onchange="{!c.handleSelected}" type="radio" value="{!item}"/>
                        <label class="slds-radio__label" for="{!item}">
                            <span class="slds-radio_faux"></span>
                            <span class="slds-form-element__label">{!item}</span>
                        </label>
                    </span>
                </div>
            </fieldset>
        </aura:iteration><br/><br/>
        <aura:if isTrue="{!not(empty(v.selectedValue))}">
            <div>
                Selected Vlaue:
                <b>{!v.selectedValue}</b>
            </div>
        </aura:if>
    </div>
</aura:component>


CONT:

({
    fetchPicklistValues : function(component, event, helper) {
       
        var action = component.get("c.getAccRatings");
        var options=[];
        action.setCallback(this, function(response) {
            let state = response.getState();
            if(state === 'SUCCESS') {
                var mapValues = response.getReturnValue();
                component.set('v.mapPicklistValues', mapValues);
                let picklistValuesList = [];

                for(let key in mapValues) { 
                    picklistValuesList.push(mapValues[key]);
                }
            
                component.set("v.picklistValues", picklistValuesList);
            }
             
        });
        $A.enqueueAction(action); 
    },

    handleSelected : function(component, event, helper) {
        let currentValue = event.target.value;
        
        let mapValues = component.get('v.mapPicklistValues');
        let selectedValue;
        for(let key in mapValues) {
            if(currentValue == mapValues[key]) {
                selectedValue = key;
                break;
            }
        }
        component.set('v.selectedValue', selectedValue);

    }
})


=========================================================================================================================================

# Blog: # 5 

COMP:

<aura:component>
    <!--create myDate aura attribute for store date field value-->  
    <aura:attribute name="myDate" type="date" />
    <!--create dateValidationError boolean attribute for show error msg on invalid selection
      and disable submit button -->    
    <aura:attribute name="dateValidationError" type="boolean" />
    
    
    <div class="slds-p-around_medium">
        
        <lightning:input class="{! v.dateValidationError ? 'slds-has-error' : ''}"
                         type="date"
                         label="Renewal Date"
                         value="{!v.myDate}"
                         name="date"
                         onchange="{!c.dateUpdate}" />
        
        <aura:if isTrue="{!v.dateValidationError}">
            <div class="slds-text-color_error slds-p-left_x-small">
                Kindly Select the Dates in Present or Future
            </div>
        </aura:if>    
        
        <br/>
        
        <lightning:button disabled="{!v.dateValidationError}" variant="brand" onclick="{!c.submit}" label="Submit"></lightning:button>
        
    </div>       
</aura:component>


CONT:

({
   //call dateUpdate function on onchange event on date field
    dateUpdate : function(component, event, helper) {
        
        var today = new Date();        
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();
     // if date is less then 10, then append 0 before date   
        if(dd < 10){
            dd = '0' + dd;
        } 
    // if month is less then 10, then append 0 before date    
        if(mm < 10){
            mm = '0' + mm;
        }
        
     var todayFormattedDate = yyyy+'-'+mm+'-'+dd;
        if(component.get("v.myDate") != '' && component.get("v.myDate") < todayFormattedDate){
            component.set("v.dateValidationError" , true);
        }else{
            component.set("v.dateValidationError" , false);
        }
    },
    
    submit : function(component,event,helper){
      // get the 'dateValidationError' attribute value
        var isDateError = component.get("v.dateValidationError");
        
        if(isDateError != true){
            alert(' Submission is completed');
        }
    }

})

=========================================================================================================================================

# Blog: # 6

 : Salesforce Lightning Accordion in Lightning Component

Apex:

public class AccordionDemo {
    @AuraEnabled
    public static List&lt;account&gt; getAccounts(){
        List&lt;account&gt; listOfAccounts = new List&lt;account&gt;();
        for(Account acc : [SELECT Id, Name, AccountNumber, AnnualRevenue, Description, Phone, Website From Account LIMIT 50]){ 
            listOfAccounts.add(acc);
        }
        return listOfAccounts;
    }
}

COMP:


<aura:component controller=”AccordionDemo” implements=”force:appHostable,flexipage:availableForAllPageTypes,flexipage:availableForRecordHome,force:hasRecordId,force:lightningQuickAction” access=”global” >
    <!–on component load call doInit javaScript function and fetch records from server–>
    <aura:handler name=”init” value=”{!this}” action=”{!c.doInit}”/>
    <aura:attribute name=”listOfAccounts” type=”Account[]”/> 
    <div class=”slds-m-around_x-large”> 
        <lightning:accordion>
        <!– Iterating through the list of account in lightning:accordion component –> 
            <aura:iteration items=”{!v.listOfAccounts}” var=”acc”> 
            <!–Showing each account as accordion section–> 
                <lightning:accordionSection name=”{!acc.name}” label=”{!acc.Name}”> 
                    <aura:set attribute=”body”> 
                        <p><b>AccountNumber</b> : {!acc.AccountNumber} </p> 
                        <p><b>AnnualRevenue</b> : {!acc.AnnualRevenue} </p> 
                        <p><b>Description</b> : {!acc.Description}</p> 
                        <p><b>Phone</b> : {!acc.Phone}</p>
                        <p><b>Website</b> : {!acc.Website}</p> 
                    </aura:set>
                </lightning:accordionSection> 
            </aura:iteration>
        </lightning:accordion> 
    </div> 
</aura:component>


CONT:

({
    doInit: function(component,event,helper){
        var action = component.get('c.getAccounts');
        action.setCallback(this, function(response){ 
            var state = response.getState();
            if(state === 'SUCCESS' &amp;&amp; component.isValid()) { 
                //getting the list of accounts
                component.set('v.listOfAccounts', response.getReturnValue());
            } 
            else{
                alert('ERROR...');
            }
        });
    $A.enqueueAction(action); }
})

=========================================================================================================================================

Blog: # 7

Dependent Picklist in Aura Component

Apex:

public class DependentPicklist {
    @AuraEnabled
    public static Map<String, List<String>> getDependentMap(sObject objDetail, string contrfieldApiName,string depfieldApiName){
        String controllingField = contrfieldApiName.toLowerCase();
        String dependentField = depfieldApiName.toLowerCase();
        
        Map<String,List<String>> objResults = new Map<String,List<String>>();
        
        Schema.sObjectType objType = objDetail.getSObjectType();
        if (objType==null){
            return objResults;
        }
        
        Map<String, Schema.SObjectField> objFieldMap = objType.getDescribe().fields.getMap();
        
        if (!objFieldMap.containsKey(controllingField) || !objFieldMap.containsKey(dependentField)){
            return objResults;     
        }
        
        Schema.SObjectField theField = objFieldMap.get(dependentField);
        Schema.SObjectField ctrlField = objFieldMap.get(controllingField);
        
        List<Schema.PicklistEntry> contrEntries = ctrlField.getDescribe().getPicklistValues();
        List<PicklistEntryWrapper> depEntries = wrapPicklistEntries(theField.getDescribe().getPicklistValues());
        List<String> controllingValues = new List<String>();
        
        for (Schema.PicklistEntry ple : contrEntries) {
            String label = ple.getLabel();
            objResults.put(label, new List<String>());
            controllingValues.add(label);
        }
        
        for (PicklistEntryWrapper plew : depEntries) {
            String label = plew.label;
            String validForBits = base64ToBits(plew.validFor);
            for (Integer i = 0; i < validForBits.length(); i++) {
                String bit = validForBits.mid(i, 1);
                if (bit == '1') {
                    objResults.get(controllingValues.get(i)).add(label);
                }
            }
        }
        return objResults;
    }
    
    public static String decimalToBinary(Integer val) {
        String bits = '';
        while (val > 0) {
            Integer remainder = Math.mod(val, 2);
            val = Integer.valueOf(Math.floor(val / 2));
            bits = String.valueOf(remainder) + bits;
        }
        return bits;
    }
    
    public static String base64ToBits(String validFor) {
        if (String.isEmpty(validFor)) return '';
        
        String validForBits = '';
        
        for (Integer i = 0; i < validFor.length(); i++) {
            String thisChar = validFor.mid(i, 1);
            Integer val = base64Chars.indexOf(thisChar);
            String bits = decimalToBinary(val).leftPad(6, '0');
            validForBits += bits;
        }
        
        return validForBits;
    }
    
    private static final String base64Chars = '' +
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ' +
        'abcdefghijklmnopqrstuvwxyz' +
        '0123456789+/';
    
    
    private static List<PicklistEntryWrapper> wrapPicklistEntries(List<Schema.PicklistEntry> PLEs) {
        return (List<PicklistEntryWrapper>)
            JSON.deserialize(JSON.serialize(PLEs), List<PicklistEntryWrapper>.class);
    }
    
    public class PicklistEntryWrapper{
        public String active {get;set;}
        public String defaultValue {get;set;}
        public String label {get;set;}
        public String value {get;set;}
        public String validFor {get;set;}
        public PicklistEntryWrapper(){            
        }
        
    }
}


COMP:

<aura:component implements="force:appHostable,flexipage:availableForAllPageTypes,flexipage:availableForRecordHome,force:hasRecordId,forceCommunity:availableForAllPageTypes,force:lightningQuickAction"
                access="global"
                controller="DependentPicklist">
      
    <aura:handler name="init" value="this" action="{!c.doInit}"/>
    
    <aura:attribute name="listControllingValues" type="list" default="[]" description="to store controller field values"/>
    <aura:attribute name="listDependingValues" type="list" default="['--- None ---']" description="to store dependent field values"/>
    <aura:attribute name="depnedentFieldMap" type="map" description="map to store dependent values with controlling value"/>
    <aura:attribute name="DisabledDependentFld" type="boolean" default="true"/>    
    <aura:attribute name="objDetail" type="contact" default="{'sobjectType' : 'contact'}"/>
    <aura:attribute name="controllingFieldAPI" type="string" default="Country__c" description="store field API name of Controller field"/>
    <aura:attribute name="dependingFieldAPI" type="string" default="City__c" description="store field API name of dependent field"/>
    
    <lightning:layoutItem size="12" padding="around-small">    
        <lightning:select name="controllerFld"
                          value="{!v.objDetail.Country__c}"
                          label="Country"
                          onchange="{!c.onControllerFieldChange}">
            <aura:iteration items="{!v.listControllingValues}" var="val">
                <option value="{!val}">{!val}</option>
            </aura:iteration>
        </lightning:select>
    </lightning:layoutItem>

    <lightning:layoutItem size="12" padding="around-small">
        <lightning:select name="dependentFld"
                          value="{!v.objDetail.City__c}"
                          label="City"
                          disabled="{!v.bDisabledDependentFld}">
            <aura:iteration items="{!v.listDependingValues}" var="val">
                <option value="{!val}">{!val}</option>
            </aura:iteration>
        </lightning:select>
    </lightning:layoutItem>
    
</aura:component>


CONT:


({
    doInit : function(component, event, helper) { 
        var controllingFieldAPI = component.get("v.controllingFieldAPI");
        var dependingFieldAPI = component.get("v.dependingFieldAPI");
        var objDetails = component.get("v.objDetail");
        
        helper.fetchPicklistValues(component,objDetails,controllingFieldAPI, dependingFieldAPI);
    },
    
    onControllerFieldChange: function(component, event, helper) {     
        var controllerValueKey = event.getSource().get("v.value"); 
        var depnedentFieldMap = component.get("v.depnedentFieldMap");
        
        if (controllerValueKey != '--- None ---') {
            var ListOfDependentFields = depnedentFieldMap[controllerValueKey];
            
            if(ListOfDependentFields.length > 0){
                component.set("v.DisabledDependentFld" , false);  
                helper.fetchDepValues(component, ListOfDependentFields);    
            }else{
                component.set("v.DisabledDependentFld" , true); 
                component.set("v.listDependingValues", ['--- None ---']);
            }  
            
        } else {
            component.set("v.listDependingValues", ['--- None ---']);
            component.set("v.DisabledDependentFld" , true);
        }
    },
})


HELP:


({
    fetchPicklistValues: function(component,objDetails,controllerField, dependentField) {
        
        var action = component.get("c.getDependentMap");
        action.setParams({
            'objDetail' : objDetails,
            'contrfieldApiName': controllerField,
            'depfieldApiName': dependentField 
        });
        
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var StoreResponse = response.getReturnValue();
                
                component.set("v.depnedentFieldMap",StoreResponse);
                
                var listOfkeys = [];
                var ControllerField = []; 

                for (var singlekey in StoreResponse) {
                    listOfkeys.push(singlekey);
                }
               
                if (listOfkeys != undefined && listOfkeys.length > 0) {
                    ControllerField.push('--- None ---');
                }
                
                for (var i = 0; i < listOfkeys.length; i++) {
                    ControllerField.push(listOfkeys[i]);
                }  
                component.set("v.listControllingValues", ControllerField);
            }else{
                alert('Something went wrong..');
            }
        });
        $A.enqueueAction(action);
    },
    
    fetchDepValues: function(component, ListOfDependentFields) {
     
        var dependentFields = [];
        dependentFields.push('--- None ---');
        for (var i = 0; i < ListOfDependentFields.length; i++) {
            dependentFields.push(ListOfDependentFields[i]);
        }
               component.set("v.listDependingValues", dependentFields);
        
    },
    
})


     */
}