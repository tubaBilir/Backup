import { LightningElement, track } from 'lwc';

export default class TrackProperty extends LightningElement {

@track contact = { // track kullaniyorsak import satirinda belirtmek gerek
    name : 'Steve Jobs',
    stay :'USA',
    company :'Apple'
}

handleChange(event){
    this.contact.stay = event.target.value;
}


//=assignment operator / == values are equal or not / === datatype is equal or not =>array, primitives, object 

}