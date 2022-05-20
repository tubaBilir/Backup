@isTest
public with sharing class CustomerTriggerTest {
    @isTest
    private static void deletePaymentTest() {
        List<Customer__c> listCustomer = new  List<Customer__c>();

        Customer__c cstmr = new Customer__c();
        cstmr.name = 'Castimir';
        cstmr.active__c = true;
        listCustomer.add(cstmr);

        Customer__c cstmr1 = new Customer__c();
        cstmr1.name = 'Custumur';
        cstmr1.active__c = false;
        listCustomer.add(cstmr1);

        insert listCustomer;
        delete listCustomer;

    }
}
