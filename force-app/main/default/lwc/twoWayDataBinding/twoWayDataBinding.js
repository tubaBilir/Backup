import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {

    studentName;  //class level property-local property


    getName(){

        this.studentName = 'Local Property'; // class level property kullanacaksak this. mandatory
        stdName = 'Steve Jobs'; // metod level property
        console.log('this.studentName ' + this.studentName);
        console.log('stdName' + stdName);

        return stdName.toUpperCase();
    }

    getfullName(firstname, lastname){
        fullname = firstname+ " " +lastname;
        this.studentName = fullname; // this demek local property 
        return fullname;
    }


    name = 'Bala';
    title = 'Salesforce developer';
    
    handleChange(event){
        this.title= event.target.value; //target=input / value = targetin yani inputun ici
    }



}