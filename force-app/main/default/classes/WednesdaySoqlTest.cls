@isTest
public  class WednesdaySoqlTest {
    @isTest
    private static void accountListMethodTest() {

        
        DmlDemo3.dmlInsert(1);// baska bir clastan 3 account insert eden metot cagirdim
        WednesdaySoql.accountListMethod();
    }

    @isTest
    private static void OpportunityListMethodTest() {

        Opportunity opp1 = new Opportunity();
        opp1.name ='Opp Opp';
        opp1.Amount =1000;

        Opportunity opp2 = new Opportunity();
        opp2.name ='Opp Opp2';
        opp2.Amount =3000;

        Opportunity opp3 = new Opportunity();
        opp3.name ='Opp Opp3';
        opp3.Amount =6000;

        List<Opportunity> oppList = new List<Opportunity>{opp1, opp2, opp3};

        insert oppList;

        // Opportunity maxOppAmount = [select id, name, amount from Opportunity order by Amount desc limit 1];

        WednesdaySoql.OpportunityListMethod();

        
    }



    
}
