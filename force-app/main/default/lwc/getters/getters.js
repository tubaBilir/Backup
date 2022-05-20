import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {

    names = ['Melike', 'Dovlet', 'Huseyin'];

    num1 = 10;
    num2 = 20;

    get multiplyNums(){ // get ile return mandotory
        //var, let,const
        var mul = this.num1*this.num2;
        return mul;
    }

    get firstName(){
        return this.names[1];
    }

    num3 ='20';
    num4 ='40';

    get sum(){
        var total = this.num3 + this.num4;
        return total; // returns 2040
    }


    get sumNumber(){
        return Number(this.num3) + Number(this.num4);
    } //returns 60





}