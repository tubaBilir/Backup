public with sharing class triggerTest {

    public static void MultiAccount() {
        list<account> listAccount = new list<account>();

        account acc= new account();
        acc.name='Soft ';
        acc.phone= '5451551';
        acc.Industry='Construction';
        listAccount.add(acc);

        for (integer i = 1; i<20 ; i++) {
            account acc2= new account();
            acc2.name='Soft' + i;
            acc2.phone= '5451551';
            acc2.Industry='Construction';
            listAccount.add(acc2);
        }
        System.debug('Size of list ' + listAccount.size());
        if(!listAccount.isEmpty()){
            insert listAccount;
        }
    }

}
