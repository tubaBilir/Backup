public class AccConAndOppOperations {

    //Write the logic to fetch and return all the accounts.Include account name, annual revenue, type, and source of account

    public static void method1() {

        list<Account> acc = [select Name, annualRevenue, type, AccountSource from Account];
        System.debug('All Accounts ' + acc);
    }

    //Prepare method which will return the List of Accounts(any 3 fields) for a particular Type. Type should be sent as a parameter in the method.

  public static void method2(string accType) {

    list<Account> acc = [select id, Name, CustomerPriority__c, 	AnnualRevenue, type from Account where type like : '%' + accType + '%' ];

    for (Account eachAccount : acc) {
        System.debug(eachAccount);
    }
  }

//Print all opportunities (fetch Amount, Name and Account Name fields) with Stage as 'Closed Won' make it dynamic so it should work for other stages as well.

  public static void method3(String stgName){
    List<Opportunity> opp =[select stagename, name, amount, AccountId from Opportunity where StageName like :'%'+ stgName +'%'];
    for(Opportunity eachOpp:opp){
        System.debug(eachOpp);
    }
  }

//Find all the opportunities which has Lead Source 'Web' and Stage 'Closed Lost'. Make it dynamic so it works for other stages and Lead sources as well.

    public static void method4(string leadSrc, string stgName) {
        list<Opportunity> opp2 = [select name, LeadSource , stageName from Opportunity where StageName like : '%'+ stgName+'%' and LeadSource like : '%' + leadSrc + '%'  ];
        for (Opportunity eachOpp : opp2) {
            System.debug(eachOpp);
        }
    }



    
// Prepare a method which returns the sum of all the opportunities Amount present in the org.

    public static void method5(){
        AggregateResult[] groupedResult = [select  SUM(Amount) from Opportunity];
          System.debug('Sum of Amount==> ' + groupedResult[0]);
    }

//Prepare a method which will return all the Accounts for which at least a closed Won Opportunity is present. Make it dynamic if we want to bring account for other opportunity stageNames.

    public static void method6(string stgName) {
          list<account> accountWithOpp = new list <Account>();

          accountWithOpp = [Select Name, AnnualRevenue, (select name, Amount, stageName from opportunities where StageName like :'%'+ stgName + '%') from Account];

         for (account acc : accountWithOpp) {
             for (opportunity opp : acc.Opportunities) {
                 System.debug('Account Name ==> ' + acc.Name + 'Annual revenue is ==> ' + acc.AnnualRevenue + 'Opportunity name ==> ' + opp.name + 'Stage name is ==> ' + opp.StageName );
             }
         }
    }

//Print the Annual revenue and name of all the accounts of type 'Customer - Direct' and print the Opportunity Name and Amount for the respective 'Closed Won' opportunities.Printing should be done one by one in different lines.*/
    
    public static void method7() {
        list<account> accountWithOpp1 = new list <Account>();

        accountWithOpp1 = [Select Name, AnnualRevenue, type,  (select name, Amount, stageName from opportunities where StageName = 'Closed Won') from Account where type = 'Customer - Direct'];

        for (account acc1 : accountWithOpp1) {
            for (opportunity opp1 : acc1.Opportunities) {

                System.debug('Account Name ==> ' + acc1.Name + 'Annual revenue is ==> ' + acc1.AnnualRevenue + 'Account type==> ' + acc1.type +   'Opportunity name'  + opp1.name  + 'Stage name is' + opp1.StageName );
            }
        } 
    }

//Prepare a method which will return all the Accounts for which at least a contact is present.

    public static void method8() {

        list<account> accountWithCont = new list <Account>();

        accountWithCont = [Select Name, Type, AnnualRevenue, (select name, email from Contacts) from Account ];

        for (account acc : accountWithCont) {
            for (Contact con : acc.Contacts) {
                System.debug('Account Name ==> ' + acc.Name + 'Annual revenue is ==> ' + acc.AnnualRevenue + 'Account type==> ' + acc.type +   'Contact name'  + con.Name  + 'Email' + con.Email );
            }
        } 
    }

//Part 2

    public static void method1_P2(string accName, decimal annRevenue , string accType) {

        Account accNew = new Account();
        accNew.Name = accName;
        accNew.AnnualRevenue = annRevenue;
        accNew.Type = accType;

        if(accName == ''){
            System.debug('Account without name cannot be created');
        } else{
            insert accNew;
        }
    }

   //Take account Id as input parameter and create a new contact for the provided account’s Id. Populate Contact last name as same as Account’s Name.

    
    public static void method2_P2( string accId) {
       
        Account findAcc = [select id, name from Account where id = : accId];

        Contact newCont = new Contact();
        newCont.LastName = findAcc.Name;
        newCont.AccountId= findAcc.id;
        if (!Schema.sObjectType.Contact.fields.LastName.isCreateable()) {
            return null;
        }
       
        insert newCont;
    }

    public static void method3_P2(){

        List<Opportunity> updateOpp = [select id, amount, Description from Opportunity WITH SECURITY_ENFORCED order by amount desc limit 10 ];

        List<Opportunity> updatedd = new  List<Opportunity> ();

        for (opportunity eachOpp : updateOpp) {
            eachOpp.Description = 'This is one of the top 10 opportunity. Please work on this properly';
            updatedd.add(eachOpp);
        }

        if(!updatedd.isEmpty()){
        update updatedd;
        }
    }

    public static void specOpp(id keyId, integer n){
        Account myAcc = [Select id,name, AnnualRevenue from Account where id = : keyId WITH SECURITY_ENFORCED];
        system.debug(myAcc);
        List<Opportunity> crtCont = new List<Opportunity>();
        if(n == 0){
            system.debug('Please tell us how many opportunities needs to be created');
        }else{
            list<Opportunity> newOpps = new list<Opportunity>();
            for(integer i=1; i<=n;i++){
                Date todayDate = Date.today();
                Opportunity opp1 = new Opportunity();
                opp1.Name = myAcc.Name;
                opp1.StageName ='Prospecting';
                opp1.CloseDate = Date.today().addYears(3);
                opp1.Amount = myAcc.AnnualRevenue/n;
                opp1.AccountId = myAcc.id;
                crtCont.add(opp1);    
            }
            if(!crtCont.isEmpty()){
                insert crtCont;
            }       
        }
    }

    public static void method5_P2(){
        List<Opportunity> lowOpp =[select id, amount, StageName from Opportunity where amount < 20000 and StageName = 'Closed Lost' ];

        delete lowOpp;
    }

    public static void nonAssAcc(){
        List<Account> nonAssList=[Select Id, Name From Account Where Id NOT IN (Select AccountId FROM Contact Where AccountId != NULL)];
        system.debug(nonAssList.size()); // Only wondered number of non assoc. accounts
        
        List<Contact> newContacts = new List<Contact>();
        for(Account eachAcch : nonAssList ){
            Contact chContact = new Contact();
            chContact.LastName = eachAcch.Name;
            chContact.AccountId = eachAcch.id;
            newContacts.add(chContact);
        }
        if(!newContacts.isEmpty()){
            insert newContacts;
        }
    }

    public static void method7_P2(){
        List<Contact> orphanCont =[select id, lastName, accountId from Contact where AccountId = NULL ];

        delete orphanCont;
    }
















}
