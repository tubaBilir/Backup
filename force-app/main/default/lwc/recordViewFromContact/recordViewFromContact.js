import { LightningElement } from 'lwc';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import ACCOUNT_FIELD from '@salesforce/schema/Contact.AccountId';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';

export default class RecordViewFormContact extends LightningElement {
    recordId = '0038c00002dN1w6AAC';
    objectName = CONTACT_OBJECT;
     fields ={
         firstname:FIRSTNAME_FIELD,
         lastname:LASTNAME_FIELD,
         accountname:ACCOUNT_FIELD,
         email:EMAIL_FIELD,
         phone:PHONE_FIELD,
         title: TITLE_FIELD,
         department:DEPARTMENT_FIELD 
     }
}