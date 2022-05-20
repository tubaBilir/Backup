@isTest
public with sharing class CustomerTriggerHandlerTest {
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

        //Create payments for customer
        List<payments__c> pmntList = new List<payments__c>();

        payments__c pym = new payments__c ();
        pym.Customerr__c = cstmr.id;
        pmntList.add(pym);

        payments__c pym2 = new payments__c ();
        pym2.Customerr__c = cstmr1.id;
        pmntList.add(pym2);
      
        insert pmntList;
        delete listCustomer;

        List<payments__c> paymentsSoql =[select id from  payments__c ];
        system.assertEquals(1, paymentsSoql.size()); // 1 cunku metotta online diye baska bir gereksinim var

    }














}
