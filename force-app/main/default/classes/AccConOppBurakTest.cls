@isTest
public with sharing class AccConOppBurakTest {   //TEST SET UP kullanarak sanal bir org olusturup buradan metotlarda kullanacgimiz account ve opp verilerini cekiyoruz

    @TestSetup
    static void makeData(){
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

        List<Opportunity> listOpp = new List<Opportunity>();
        for (Integer i = 1; i <= 10; i++) {
            Opportunity op = new Opportunity();
            op.name = 'Test1 opp ' + i;
            op.Amount = 5000;
            op.stageName = 'Closed Won';
            op.CloseDate = date.today();
            op.Description = 'Demo';
            op.LeadSource = 'Web';
            op.AccountId = listAcc[0].id;
            listOpp.add(op);
        }

        for (Integer i = 1; i <= 10; i++) {
            Opportunity op = new Opportunity();
            op.name = 'Test2 opp ' + i;
            op.Amount = 10000;
            op.stageName = 'Closed Lost';
            op.CloseDate = date.today();
            op.Description = 'Demo';
            op.LeadSource = 'Web';
            op.AccountId = listAcc[1].id;
            listOpp.add(op);
        }

        for (Integer i = 1; i <= 10; i++) {
            Opportunity op = new Opportunity();
            op.name = 'Test3 opp ' + i;
            op.Amount = 14000;
            op.stageName = 'Prospecting';
            op.CloseDate = date.today();
            op.Description = 'Demo';
            op.LeadSource = 'Web';
            op.AccountId = listAcc[2].id;
            listOpp.add(op);
        }

        insert listOpp;
    }

    @isTest
    private static void fetchAllAccountsTest() {
        Test.startTest();
        List<Account> listAcc = AccConOppBurak.fetchAllAccounts();
        Test.stopTest();

        system.assertEquals(3, listAcc.size());
    }

    @isTest
    private static void AccConAndOppOperationsTest() {

        Test.startTest();
        List<Account> accList = AccConOppBurak.fetchAccountsForAType('Customer - Direct');
        Test.stopTest();

        system.assertEquals(3, accList.size());
    }

    @isTest
    private static void fetchOpportunitiesTest() {
        Test.startTest();
        AccConOppBurak.fetchOpportunities('Closed Won');
        Test.stopTest();
    }

    @isTest
    private static void fetchOpportunitiesTest2() {
        Test.startTest();
        AccConOppBurak.fetchOpportunities('Closed Lost', 'Web');
        Test.stopTest();
    }

    @isTest
    private static void fetchSumOfAllOppsAmountTest() {
        Test.startTest();
        Double sum = AccConOppBurak.fetchSumOfAllOppsAmount();
        Test.stopTest();
        system.assertEquals(290000, sum);
    }
}
