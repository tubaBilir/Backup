import { LightningElement } from 'lwc';


import CONTACT_OBJECT from '@salesforce/schema/Contact'; 
import NAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import BIRTHDATE_FIELD from '@salesforce/schema/Contact.Birthdate';
import SOURCE_FIELD from '@salesforce/schema/Contact.LeadSource'; 

export default class RecordFromAccount extends LightningElement {

    recordId = '0038c00002dN1w6AAC';
    objectName = CONTACT_OBJECT; 
    fields =[NAME_FIELD, EMAIL_FIELD, BIRTHDATE_FIELD, SOURCE_FIELD];



}