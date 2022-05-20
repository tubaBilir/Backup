@isTest
public class SoqlDemoTest {
    @isTest
    private static void accountSOQL_1Test(){
        //want to test AccountSOQL method
        //if we do soql query by default no record! 1.step -> Prepare Data -> create some record with dml -> (account insert eden bir metot da cagirabilirz baska bir clastan)
        
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
        
        //2.step -> call the method

        SoqlDemo.accountSOQL_1(); 

        //3.step assertEquals ama bu metot bir sey dondurmedigi icin gerek yok, dml veya validation rule olsa assertEqual yapilir
    }

    @isTest
    public static void accountSOQL_2Test(){

        list<Account> listAcc = new list<Account>();

        Account acc1 = new Account();
        acc1.name = 'acc1';
        acc1.phone = '515416514987';
        acc1.AccountNumber = '12dfgdg';
        listAcc.add(acc1);

        Account acc2 = new Account();
        acc2.name = 'acc2';
        acc2.phone = '18546518';
        acc2.AccountNumber = 'dfg1dg';
        listAcc.add(acc2);
       
        Account acc3 = new Account();
        acc3.name = 'acc3';
        acc3.phone = '258565484';
        acc3.AccountNumber = 'd22fgdg';
        listAcc.add(acc3);
        
        insert listAcc;

        SoqlDemo.accountSOQL_2();
        SoqlDemo.accountSOQL_3();
        
    }


    @isTest
    public static void accountSOQL_FilterTest() {
        SoqlDemo.accountSOQL_2();
        SoqlDemo.accountSOQL_Filter('');
        
    }
  













    
}
