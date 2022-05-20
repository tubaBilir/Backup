import { LightningElement } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent'; //kaydedildi mesajini sayfanin tepesinde gormek icin, asagida da metot yaziliyor

import OPP_OBJECT from '@salesforce/schema/Opportunity'; 


export default class LightningExampleLayoutSimple extends LightningElement {


    objectName = OPP_OBJECT; 

   
    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: 'Opportunity created',
            message: 'Opp created! ',
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }

}