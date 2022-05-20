import { LightningElement } from 'lwc';

export default class BindExpressionFromJS extends LightningElement {

    fullName='';
    email='';
    phone='';

    handleChange(event){
        const field = event.target.name;
        if(field == 'fullName'){
            console.log('#Inside The FullName');
            this.fullName = event.target.value;
        }
        else if(field == 'phone'){
            this.phone = event.target.value;
        }
        else if(field == 'email'){
            this.email = event.target.value;
        }
    }

    get upperCase(){
        return `${this.fullName}`.toUpperCase();
    }

    handleClick(){
        window.alert('Button is Clicked');
    } 
}