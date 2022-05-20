public with sharing class CustomerTriggerHandler {

//Custom Customer Object > IF PARENT DELETE, DELETE IT'S CHILDS
//Whenever Active Customers are deleted, all the corresponding payments should be deleted.
//Whenever In Active Customers are deleted, all the corresponding online payment records should be deleted.

    public static void deletePayment(List<Customer__c > TriggerOld) {

        set<id> activeCustomersId = new set<id>();
        set<id> inActiveCustomersId = new set<id>();

        for (Customer__c cstmr : TriggerOld) {//deleted records
            if(cstmr.active__c == true ){
                activeCustomersId.add(cstmr.id);
            } else {
                inActiveCustomersId.add(cstmr.id);
            }
        }

        list <payments__c> activePayments = [select id, name from payments__c where customerr__c in : activeCustomersId ];

        list <payments__c> inActivePayments  = [select id, name, Mode__c from payments__c where customerr__c in : inActiveCustomersId and Mode__c = 'Online']; //Whenever InActive Customers are deleted, all the corresponding online payment records should be deleted.

        delete activePayments;
        delete inActivePayments;
    }


    

}
