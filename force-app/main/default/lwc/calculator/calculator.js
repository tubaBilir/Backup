import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {


    num1 = 0;
    num2 = 0;

    handleChange(event){
        this.num1= Number(event.target.value);
    }

    handleChange2(event){
        this.num2= Number(event.target.value);
    }

 get sumNums(){ 
        var mul = this.num1 + this.num2;
        return mul;
    }

}