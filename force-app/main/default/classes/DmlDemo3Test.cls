@isTest
public class DmlDemo3Test {

    //Code Coverage 100%

    @isTest
    private static void dmlInsertTest() {

        Account acc1 = new Account();
        acc1.Name = 'Test 1';
        acc1.AnnualRevenue = 10000;
        acc1.Type = 'Customer - Direct';
        acc1.AccountSource = 'Web';

        Account acc2 = new Account();
        acc2.Name = 'Test 2';
        acc2.AnnualRevenue = 20000;
        acc2.Type = 'Customer - Direct';
        acc2.AccountSource = 'Web';

        List<Account> accList = new List<Account>{acc1, acc2};
        insert accList;
        DmlDemo3.dmlInsert(1);

    }

    @isTest
    public static void dmlUpdateTest() {

        Account acc1 = new Account();
        acc1.Name = 'Test 1';
        acc1.AnnualRevenue = 10000;
        acc1.Type = 'Customer - Direct';
        acc1.AccountSource = 'Web';

        Account acc2 = new Account();
        acc2.Name = 'Test 2';
        acc2.AnnualRevenue = 20000;
        acc2.Type = 'Customer - Direct';
        acc2.AccountSource = 'Web';

        Account acc3 = new Account();
        acc3.Name = 'Test 3';
        acc3.AnnualRevenue = 30000;
        acc3.Type = 'Customer - Direct';
        acc3.AccountSource = 'Web';

        List<Account> listAcc = new List<Account>{acc1, acc2, acc3};

        insert listAcc;

       DmlDemo3.dmlUpdate('Con');

       List<Account> listCheck = [select name from Account];
       system.AssertEquals('Test 1Con', listCheck[0].name);
       system.AssertEquals('Test 2Con', listCheck[1].name);
       
    }
@isTest
public static void dmlDeleteTest() {
    DmlDemo3.dmlUpdate('Con');
    DmlDemo3.dmlDelete();

    List<Account> listCheck = [select id from Account];
    system.AssertEquals(0, listCheck.size());



}



    
}
