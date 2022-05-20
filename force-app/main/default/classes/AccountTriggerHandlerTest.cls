@isTest
public class AccountTriggerHandlerTest {
    @isTest
    private static void updateAccountDescriptionTest() {
        list<Account> listAcc = new list<Account>();

        Account acc1 = new Account();
        acc1.name = 'acc1';
        acc1.active__c = 'No';
        listAcc.add(acc1);
        
        Account acc2 = new Account();
        acc2.name = 'acc2';
        acc2.active__c = 'No';
        listAcc.add(acc2);
       
        Account acc3 = new Account();
        acc3.name = 'acc3';
        acc3.active__c = 'Yes';
        listAcc.add(acc3);
        
        insert listAcc;
    
        for (Account acc : listAcc) {
            acc.Description ='Test';
            acc.active__c ='Yes';
        }
    
        update listAcc;
        
    }
// Handlerda kullanilan butun fieldler
    @isTest
    private static void updateVIPforAllContactsTest() {
        list<Account> listAcc = new list<Account>();

        Account acc1 = new Account();
        acc1.name = 'acc1';
        acc1.active__c = 'No';
        listAcc.add(acc1);
        
        Account acc2 = new Account();
        acc2.name = 'acc2';
        acc2.active__c = 'No';
        listAcc.add(acc2);
       
        Account acc3 = new Account();
        acc3.name = 'acc3';
        acc3.active__c = 'Yes';
        listAcc.add(acc3);
        insert listAcc;

        list<Contact> listContact = new list<Contact>();
        for (Integer i = 0; i < 30; i++) {
            contact c = new Contact();
            c.LastName = 'Test soql ' + i;
            if(i<10){
                c.AccountId = acc1.id;
            } else if(i<20){
                c.AccountId = acc2.id;
            } else if(i<30){
                c.AccountId = acc3.id;
            }
            listContact.add(c);
        }
        insert listContact;
    
        for (Account acc : listAcc) {
            acc.Description ='Test';
            acc.vip__c = true;
            acc.active__c = 'Yes';
        }
        update listAcc;
        
    }

    



    
}
