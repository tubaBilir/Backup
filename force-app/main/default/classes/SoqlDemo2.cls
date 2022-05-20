public class SoqlDemo2 {

    public static void childToParent_soql1() {
        //querying on child returns list<child_sobject>
        list<contact> listCnt = [select id, name, account.name 
        from contact where Account.industry = 'Energy'];

        for (contact eachContact : listCnt) {
            //access parents field name using same dot operation
            string accName= eachContact.Account.Name;
            System.debug('Contact name is ===> ' + eachContact.Name  + 'its account name is ==> ' + accName);
        }
    }

// parent to child - we have to use inner query
//select id, name, phone, (select id, lastname from contacts) from Account

public static void sampleSoql4() {
    list<account> accountWithOppList = new  list<account>();
    accountWithOppList=[select name, annualRevenue,
    (select name, amount from opportunities where stageName = 'Closed Won') from account];
    
    for(account acc : accountWithOppList){
        System.debug('Account Name ' + acc.name + 'And its annual revenue ' + acc.AnnualRevenue);
        list<opportunity> listOpp =acc.Opportunities;

        for(Opportunity opp : listOpp){
            System.debug('Opportunity name ' + opp.name);
            System.debug('Opportunity amount ' + opp.Amount);
        }
    }
}


}
