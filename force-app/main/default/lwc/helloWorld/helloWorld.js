import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

    //Local properties
    name = 'Salesforce Developer'; // semicolon is optional
    experience = 3;                 //data type gerek yok, decimal integer fark etmez
    fruits = ['Banana', 'Pineapple', 'Apple']; // Arrays and list same 
    experiences =[1, 5, 8];   

    location = {            //objects
        key : 'value', 
        field : 'value',
        city: 'Houston',
        country : 'USA',
        postalCode : '45454'  // location.name give you name in html
    };                  

//template html
//js controller


firstName = 'Tuba';
lastName = 'Bilir';
myExperience = 2;


student = {            
    name1 : 'Adam', 
    city1: 'Houston',
};  


account ={
    name2 : 'Burlington',
    Phone : '4515451125',
    city2 : 'New York'
}




}