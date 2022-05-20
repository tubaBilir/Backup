import { LightningElement } from 'lwc';

export default class nameRoleComponent extends LightningElement {
    
    username = 'Lika';
    value = 'Salesforce Administrator';

    get roles() {
        return [
            { label: 'Salesforce Administrator', value: 'Salesforce Administrator' },
            { label: 'Salesforce Developer', value: 'Salesforce Developer' },
            { label: 'Salesforce Architect', value: 'Salesforce Architect' },
        ];
    }

    handleChange(event) {
        this.value = event.target.value;
    }

    handleChange2(event) {
        this.username = event.target.value;
    }
}
