import { LightningElement } from 'lwc';

export default class AccountTemplate extends LightningElement {

    accounts = [
        {
            id: 1,
            name : "Soft Innovas",
            type : "Education"
        },
        {
            id: 2,
            name : "Universal Containers",
            type : "IT"
        },
        {
            id: 3,
            name : "Facebook",
            type : "Social Networking"
        }
    ];

    payments = [
        {
            id : 1,
            type : "Internet Allowance",
            amount : 100.00,
            paid : true
        },
        {
            id : 1,
            type : "Work From Home Allowance",
            amount : 5000.00,
            paid : false
        },
        {
            id : 1,
            type : "Well Being Allowance",
            amount : 10000.00,
            paid : true
        }
    ];
    
    // Payment Information
    // Type: value
    // Amount: value
    // Paid?: No
   

}