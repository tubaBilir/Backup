import { LightningElement } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent'; //kaydedildi mesajini sayfanin tepesinde gormek icin, asagida da metot yaziliyor

import ACCOUNT_OBJECT from '@salesforce/schema/Account'; //hardcode olmasin diye bu sekilde belirtiyoruz html de variable name ile veriyoruz
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue'; //REVENUE_FIELD variable name



export default class RecordFromAccount extends LightningElement {

    recordId = '0018c000028d9ueAAA'; // id belirtmezsek open form olur
    objectName = ACCOUNT_OBJECT; 
    fields =[NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, REVENUE_FIELD]; // fieldsler Array

    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: 'Account created',
            message: 'Record ID: ',
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }

}