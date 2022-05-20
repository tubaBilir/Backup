@isTest
public class AccountTriggerTest {
// triggerda org dan test edemedigimiz icin buradan dml ile insert ya da update yapacgiz ki trigger fire olsun
// bursi 100 % ise gidip handlerda test olacak tekrar
@isTest
    private static void updateAccountDescriptionTest () {

    list<Account> listAcc = new list<Account>();

    Account acc1 = new Account();
    acc1.name = 'acc1';
    listAcc.add(acc1);
    
    Account acc2 = new Account();
    acc2.name = 'acc2';
    listAcc.add(acc2);
   
    Account acc3 = new Account();
    acc3.name = 'acc3';
    listAcc.add(acc3);
    
    insert listAcc;

    for (Account acc : listAcc) {
        acc.Description ='Test';
    }

    update listAcc;

    }

    
   






}
