public class WednesdaySoql {
    public static void accountListMethod() {
        List<Account> accList = [Select id, name, Phone, website, NumberOfEmployees, AnnualRevenue from Account where phone != null and AnnualRevenue != null];
        System.debug(accList);

        integer counter =0;
        for (Account acc : accList) {
            //System.debug(acc);
            System.debug('name of Company : ' + acc.Name + '==== phone : ' + acc.phone +'=== website: '+ acc.website);
            System.debug('Annual revenue ' + acc.AnnualRevenue);
            System.debug('Number of Employee ' + acc.NumberOfEmployees);
            counter++;
        }
        System.debug('Yazdirilan account sayisi => ' + counter);
    }

    public static void OpportunityListMethod() {
        List<Opportunity> listOpportunity =[select id, name, Amount from Opportunity order by Amount];
        Opportunity maxOppAmount = [select id, name, amount from Opportunity order by Amount desc limit 1]; // 1 adet istedigi icin sadece object adi ile yazilacak
        System.debug('En buyuk amountu olan firma' + maxOppAmount.name);
        System.debug('En buyuk amountu ' + maxOppAmount.Amount);
        System.debug('Opportunity listesinin hepsi ' + listOpportunity);
        System.debug('Opportunity objectinin adeti ' + listOpportunity.size());
        for (opportunity opp : listOpportunity) {
            System.debug('Opportunity name = ' + opp.name + '===' + 'Amount' + opp.Amount);
        }

    }



    public static void dateSoqlMethod() {
        list<contact> contactList = [select id, name, AccountId from contact where AccountId !=null];
        System.debug(  'Contact listem bu '+ contactList);
        System.debug(  'Contact listemde kac adet record var '+ contactList.size());

        for (contact con : contactList) {
            System.debug( 'Contact Name '+ con.Name + ' <= Bagli oldugu account Id => ' + con.AccountId );
            
        }

    }
        



}