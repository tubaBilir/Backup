import { LightningElement } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class RecordViewFormAccount extends LightningElement {
    showContent =false;
    recordId = '0018c000028d9ueAAA';
    objectName = ACCOUNT_OBJECT;
     // view ya da edit formda fieldlara array yapilmaz, fieldlar bu formlarda burada object olarak yazilir
     fields ={
         name: NAME_FIELD,
         type:TYPE_FIELD,
         industry:INDUSTRY_FIELD,
         revenue:REVENUE_FIELD
     }
}