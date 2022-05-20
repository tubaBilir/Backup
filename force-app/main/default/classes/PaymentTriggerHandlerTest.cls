@isTest
public class PaymentTriggerHandlerTest {
@isTest
private static void  onlinePaymentAfterInsertTest() {

    List<Customer__c> cList = new  List<Customer__c>();
    Customer__c c1 = new Customer__c();
    c1.Name = 'Blue';
    // c1.Number_of_Online_Payments__c = 0;
    cList.add(c1);

    Customer__c c2 = new Customer__c();
    c2.Name = 'Blue22';
    // c2.Number_of_Online_Payments__c = 0;
    cList.add(c2);

    insert cList;

    payments__c pym = new payments__c();
    pym.Customerr__c = c1.id;
    pym.mode__c = 'Online';
    pym.amount__c = 2000;
                    //Paymentlari customera assigne etmiyor
    payments__c pym1 = new payments__c();
    pym1.Customerr__c = c2.id;
    pym1.mode__c = 'Online';
    pym1.amount__c = 3000;

    payments__c pym2 = new payments__c();
    pym2.Customerr__c = c1.id;
    pym2.mode__c = 'Online'; 
    pym2.amount__c = 400;
   
    list< payments__c> pymList = new list< payments__c>{pym, pym1, pym2};
    insert pymList;

    // PaymentTriggerHandler.onlinePaymentAfterInsert(pymList); asagida soql oldugu icin metotdu cagirmaya gerek yok

    List<Customer__c> custlist = [Select name, Number_of_Online_Payments__c from Customer__c where name = 'Blue' ];

    system.assertEquals(3, pymList.size()); 
    system.assertEquals(2, cList.size(), 'Customer size'); 
    system.assertEquals(2, custlist[0].Number_of_Online_Payments__c); 

}

@isTest
private static void  onlinePaymentAfterUpdateTest() {

    Customer__c c1 = new Customer__c();
    c1.Name = 'Blue';
    c1.Number_of_Online_Payments__c = 0;
    insert c1;

    payments__c pym = new payments__c();
    pym.Customerr__c = c1.id;
    pym.mode__c = 'Online';
    pym.amount__c = 2000;

    payments__c pym1 = new payments__c();
    pym1.Customerr__c = c1.id;
    pym1.mode__c = 'Cash';
    pym1.amount__c = 2000;
  
    payments__c pym2 = new payments__c();
    pym2.Customerr__c = c1.id;
    pym2.mode__c = 'Online';
    pym2.amount__c = 2000;
   
    list< payments__c> pymList = new list< payments__c>{pym, pym1, pym2};
    insert pymList;

    PaymentTriggerHandler.onlinePaymentAfterInsert(pymList);

    pym2.mode__c = 'Cash';

    update pym2;

    PaymentTriggerHandler.onlinePaymentAfterUpdate(pymList);

    system.assertEquals(3, pymList.size()); 
   // system.assertEquals(1, c1.Number_of_Online_Payments__c);

}

@isTest
private static void  onlinePaymentAfterDeleteTest() {

    Customer__c c1 = new Customer__c();
    c1.Name = 'Blue';
    c1.Number_of_Online_Payments__c = 0;

    insert c1;

    payments__c pym = new payments__c();
    pym.Customerr__c = c1.id;
    pym.mode__c = 'Online';
    pym.amount__c = 2000;

    payments__c pym1 = new payments__c();
    pym1.Customerr__c = c1.id;
    pym1.mode__c = 'Cash';
    pym1.amount__c = 2000;
  
    payments__c pym2 = new payments__c();
    pym2.Customerr__c = c1.id;
    pym2.mode__c = 'Online';
    pym2.amount__c = 2000;
   
    list< payments__c> pymList = new list< payments__c>{pym, pym1, pym2};

    insert pymList;

    delete pym2;

    // system.assertEquals(2, pymList.size());
    //system.assertEquals(1, c1.Number_of_Online_Payments__c); 

}



}
