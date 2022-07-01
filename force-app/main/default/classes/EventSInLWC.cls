public with sharing class EventSInLWC {
   /*

 #  Events in LWC: There are 3 types of Events
   1. Parent to Child
   2. Child to Parent
   3. Publish Subscriber (Two components which doesn't have a direct relation).

   Note: if we want to commnunicate LWC with VF Page then we can use Lightning Message Service (LMS)


   1. Parent to Child Event Communication in LWC:

    > In Aura Framework, we can call the method of Child Comp from the Parent Comp with the help of <aura:method>.
    > In LWC Aura Methods Become JavaScript Methods.
    > LWC we can pass the details from Parent to Child using below two ways--
      A. Public Method
      B. Public Properties

      A. Public Method: 
      > We can use the @api decorator to make the method public available so parent can be able to call it directly using JavaScript
       Example: lwcChildComp.cmp & lwcParentComp.

    2. Child to Parent(Custom Event) Communication in LWC:
       > Custom Event is used to make the communication from Child Component to Parent Component. 
       > With LWC we can create and dispatch the custom event.

        a. Create & Dispatch an Event:
         > Create Event : We can use the customEvent() constructor to create an event. In constructor we need to pass custom event name and detail of the event. new customEvent(eventName, props);
         > Dispatch Event : We have to dispatch an event at with EventTarget.dispatchEvent() method.  this.dispatchEvent(new customEvent(eventName, props);

        b. Handle an Event: There are two ways to listen to an event
        > Declarative via html markup : We need to add “on” prefix in the event name in Parent Component during calling of Child Component for Declaratively event listener. ParentComponent    
          <template>
          <c-child-component oneventName={listenerHandler}></c-child-component >
          </template>
        
        > JavaScript using addEventListener method : We can explicitly attach a listener by using the addEventListner method in the parent component like below : 
          ChildComponent this.template.addEventListener('eventName', this.handleNotification.bind(this));

      #  Method 1:  Declarative via html markup-- Example: cusotomCompChild & CustomCompParent.

        1.customCompChild.html

        <template>
     <lightning-card title="Child Component">
         <div class="slds-m-around_medium">
             <lightning-input name="textVal" label="Enter Text" onchange={handleChange}></lightning-input>
         </div>
     </lightning-card>
 </template>

       2.customCompChild.js

       import { LightningElement } from 'lwc';
export default class CustomCompChild extends LightningElement {
     handleChange(event) {
          event.preventDefault();
          const name = event.target.value;
          const selectEvent = new CustomEvent('mycustomevent', {
              detail: name
          });
         this.dispatchEvent(selectEvent);
      }
}


     3.customCompParent.html

     <template>
     <lightning-card title="Parent Component">
          <div class="slds-m-around_medium">
               Value From Child : {message}  <br/>
               <c-custom-comp-child onmycustomevent={handleCustomEvent}></c-custom-comp-child>
              </div>
     </lightning-card>
</template>

     4.customCompParent.js

     import { LightningElement,track } from 'lwc';
export default class CustomCompParent extends LightningElement {
     @track message;
     handleCustomEvent(event){
          const textVal =event.detail;
          this.message = textVal;
     }
}

      5.customCompParent.xml

      <?xml version="1.0" encoding="UTF-8"?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>54.0</apiVersion>
    <isExposed>true</isExposed>
    <targets>
        <target>lightning__AppPage</target>
    </targets>
</LightningComponentBundle>


   # Method 2: JavaScript using addEventListener method | Attaching event Listener Programmatically

  1. customCompChild.html

<template>
     <lightning-card title="Child Component">
         <div class="slds-m-around_medium">
             <lightning-input name="textVal" label="Enter Text" onchange={handleChange}></lightning-input>
         </div>
     </lightning-card>
 </template>

   
    2. customCompChild.js

    import { LightningElement } from 'lwc';

export default class CustomCompChild extends LightningElement {
     handleChange(event) {
          event.preventDefault();
          const name = event.target.value;
          const selectEvent = new CustomEvent('mycustomevent', {
              detail: name , bubbles:true
          });
         this.dispatchEvent(selectEvent);
      }
}

   3. customCompParent.html

   <!--JavaScript using addEventListener method | Attaching event Listener Programmatically -->
<template>
     <lightning-card title="Parent Component">
          <div class="slds-m-around_medium">
               Value From Child : {message}  <br/>
               <c-custom-comp-child ></c-custom-comp-child>
              </div>
     </lightning-card>
</template>

    4. customCompParent.js

    import { LightningElement,track } from 'lwc';

export default class CustomCompParent extends LightningElement {
     @track message;

     constructor(){
          super();
          this.template.addEventListener('mycustomevent', this.handleCustomEvent.bind(this));
     }

     handleCustomEvent(event){
          const textVal =event.detail;
          this.message = textVal;
     }
}

   
    5. customCompParent.xml

    <?xml version="1.0" encoding="UTF-8"?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>54.0</apiVersion>
    <isExposed>true</isExposed>
    <targets>
        <target>lightning__AppPage</target>
    </targets>
</LightningComponentBundle>

  
  3. Publish Subscriber model in Lightning Web Component

  

   */
}
