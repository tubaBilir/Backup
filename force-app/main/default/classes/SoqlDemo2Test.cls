@isTest
public class SoqlDemo2Test {
    @isTest
    public static void SoqlDemo2Test1() {

        list<Account> listAcc = new list<Account>();

        Account acc1 = new Account();
        acc1.name = 'acc1';
        acc1.Industry = 'Energy';
        listAcc.add(acc1);

        Account acc2 = new Account();
        acc2.name = 'acc2';
        acc2.Industry = 'Energy';
        listAcc.add(acc2);
       
        Account acc3 = new Account();
        acc3.name = 'acc3';
        acc3.Industry = 'Banking';
        listAcc.add(acc3);
        
        insert listAcc;


        list<Contact> listContact = new list<Contact>();
        for (Integer i = 0; i < 300; i++) {
            contact c = new Contact();
            c.LastName = 'Test soql ' + i;
            if(i<100){
                c.AccountId = acc1.id;
            } else if(i<200){
                c.AccountId = acc2.id;
            } else if(i<300){
                c.AccountId = acc3.id;
            }
            listContact.add(c);
            
        }
        insert listContact;

       test.startTest();
        SoqlDemo2.childToParent_soql1();
        test.stopTest();

    }
}
