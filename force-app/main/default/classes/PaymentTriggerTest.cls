@isTest
public class PaymentTriggerTest { //100% code coverage
    
    @isTest
    public static void triggerTest(){

        payments__c p1 = new payments__c();
        p1.mode__c = 'Cash';
        insert p1;
        p1.mode__c= 'Online';
        update p1;
        delete p1;
        undelete p1;

    } // Payment icin bir record girip triggerdaki insert, update, delete, undelete kosullarini saglamis oluyoruz
}
