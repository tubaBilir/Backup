@istest
public with sharing class AccountsBatchTest {
    @istest
    public static void testAccDescriptionUpdate() {
        //First create the test data
        Account acc1 = new Account();
        acc1.Name = 'Test Account 1';

        Account acc2 = new Account();
        acc2.Name = 'Test Account 2';

        List<Account> accList = new List<Account>{acc1, acc2}; // Yukaridaki 2 account
        for(Integer i=0; i<900; i++){
            Account acc = new Account();
            acc.Name = 'Test Account'+i;
            accList.add(acc);
        }

        Insert accList; // Toplamda 902 insertion

        //We can execute batch inside the Test.StartTest and Test.stopTest
        Test.StartTest();
        AccountsBatch accBatch = new AccountsBatch();
        Database.executeBatch(accBatch, 902); // update eden metot // buraya 200 yazamayiz chunklar halinde Test olmaz, kac record varsa onu yazmak gerekir
        Test.stopTest();

        //Assertions
        List<Account> accUpdatedList = [Select Id, Name, Description from Account]; // Assertion icin ilk olarak soql yapmamiz gerek
        for(Account acc : accUpdatedList){
            System.assert(acc.Description.contains('apex')); // descriptionu update edip etmedigini kontrol ediyoruz
        }
    }
}