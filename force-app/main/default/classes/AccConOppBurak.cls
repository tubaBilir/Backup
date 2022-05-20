public with sharing class AccConOppBurak {
    //1. Write the logic to fetch and return all the accounts. 
    //Include account name, annual revenue, type and source of account.
        public static List<Account> fetchAllAccounts(){
            List<Account> accList = new List<Account>([Select Name, AnnualRevenue, Type, AccountSource from Account]);
            System.debug('Accounts List '+accList);
            return accList;
        }
    //2. Prepare a method which will return the List of Accounts (At least 3 fields) 
    //for a particular Type. Type should be sent as a parameter in the method.
        public static List<Account> fetchAccountsForAType(String accType){
            List<Account> accountsRetrivedList = new List<Account>();
            accountsRetrivedList = [Select Name, AnnualRevenue, Type from Account Where Type = :accType];
            return accountsRetrivedList;
        }
    //3. Print all the opportunities (Amount, Name and Account Name) with Stage as 'Closed Won' 
    //and make it dynamic so that it should work for other stages as well.
        public static void fetchOpportunities(String oppStageName){
            List<Opportunity> oppRetrivedList = new List<Opportunity>();
            oppRetrivedList = [Select Name, Amount, Account.Name from Opportunity Where StageName = :oppStageName];
            System.debug('oppRetrivedList   -->'+oppRetrivedList);
        }
    //4. Find all the opportunities which has Lead Source as 'Web' and Stage
    //as 'Closed Lost'. Make it dynamic so that it works for other stages and Lead sources as well.
        public static void fetchOpportunities(String oppStageName, String leadsrc){
            List<Opportunity> oppRetrivedList = new List<Opportunity>();
            oppRetrivedList = [Select Name, Amount from Opportunity Where StageName = :oppStageName and LeadSource = :leadsrc];
            System.debug('oppRetrivedList   -->'+oppRetrivedList);
        }
    //5. Prepare a method which returns the sum of all the opportunities present in the org
        public static Double fetchSumOfAllOppsAmount(){
            List<Opportunity> oppsList = new List<Opportunity>();
            oppsList = [Select Name, Amount from Opportunity];
            Double oppsAmountSum = 0;
            for(Opportunity opp : oppsList){
                if(opp.Amount != null){//To avoid null-pointer exception
                    oppsAmountSum = oppsAmountSum + opp.Amount;
                }
            }
            return oppsAmountSum;
        }
    //6. Write a method which should return the account instance after adding a new Account 
    //in salesforce org. Take Name, AnnualRevenue, Type as parameters and populate the values 
    //in account record. If Name is not provided, then do not create the account and show a message 
    //like "Account without name can not be created".
    //oppsList = [Select Name, Amount from Opportunity Where Amount !=null];
        public static Account createAccount(String name, Double revenue, String type){
            Account acc;
            if(name != null){
                acc = new Account();
                acc.Name = name;
                acc.AnnualRevenue = revenue;
                acc.Type = type;
                insert acc;

    
            } else {
                System.debug('Account without name can not be created');
            }
            return acc;
        }
    //7.Take account Id as input parameter and create a new contact for the provided account's Id. 
    //Populate Contact last name as same as Account's Name.
        public static contact createContact(Id accounId){
            Contact con;
            if(accounId != null){
                Account acc = [Select Name from Account where Id = :accounId];
                con = new Contact();
                con.LastName = acc.Name;
                con.AccountId = accounId;
                Insert con;
            }
            return con;
        }
    //8.Update the description field of top 10 opportunities as "This is one of the top 10 opportunity. 
    //Please work on this properly".
        public static void updateTop10Opps(){
            List<Opportunity> top10OppsList = new List<Opportunity>([Select Id, Description from Opportunity Order By Amount Desc Limit 10]);
            for(Opportunity opp : top10OppsList){
                opp.Description = 'This is one of the top 10 opportunity. Please work on this properly';
            } 
            Update top10OppsList;
        }
    //9.Write a logic to create and return n number of opportunities for a particular accountId.
    //AccountId and n will be passed as parameters in the method. 
    //Populate opportunity close date as 3 years from today,
    //Stage name as Prospecting 
    //Opportunity amount as Account's annual revenue divided by n and 
    //Opportunity name same as Account name.
        public static List<Opportunity> createNOpps(Integer n, Id accountId){
            List<Opportunity> oppsList = new List<Opportunity>();
            if(n > 0){
                if(accountId != null){
                    Account acc = [Select Name, AnnualRevenue, LastModifiedDate from Account where Id = :accountId];
                    for(Integer i=0; i<n; i++){
                        Opportunity opp = new Opportunity();
                        opp.Name = acc.Name + i;
                        opp.AccountId = accountId;
                        opp.CloseDate = Date.today().addYears(3);
                        opp.StageName = 'Prospecting';
                        if(acc.AnnualRevenue != null){//To avoid null pointer exception
                            opp.Amount = acc.AnnualRevenue/n;
                        }
                        oppsList.add(opp);
                    }
                }
            } else {
                System.debug('Please tell us how many opportunities needs to be created');
            }
            if(!oppsList.isEmpty()){
                Insert oppsList;
                return oppsList;
            }
            return null;
        }
    //10.Delete all the opportunities which have amount less than 20000 and status as closed
    //lost
        public static void deleteClosedLostOpps(){
            List<Opportunity> oppsList = new List<Opportunity>();
            oppsList = [Select Name from Opportunity where Amount < 20000 AND StageName = 'Closed Lost'];
            if(!oppsList.isEmpty()){
                Delete oppsList;
            }
        }
    //11.Print the Annual revenue and name of all the accounts of type 'Customer - Direct' and
    //print the Opportunity Name and Amount for the respective 'Closed Won' opportunities.
    //Printing should be done one by one in different lines.
        public static void printOppAndAccDetails() {
            List<Account> accountWithOppList = new List<Account>();
            accountWithOppList = [Select Name, AnnualRevenue, (Select Name, Amount from Opportunities Where StageName = 'Closed Won') 
                                    from Account Where Type ='Customer - Direct'];
            for(Account acc : accountWithOppList){
                System.debug('Account name '+acc.Name + ' and its annual revenue is --> '+acc.AnnualRevenue);
                for(Opportunity opp : acc.Opportunities){
                    System.debug('Opportunity Name  -->'+opp.Name);
                    System.debug('Opportunity Amount  -->'+opp.Amount);
                }
            }
        }
    //12.Find out all the Account which have no contacts attached to them. Add a contact for each
    //one of them and update the last Name of contact with the Name field of account.
        public static void createContactsForAccounts(){
            List<Account> accList = new List<Account>([Select Id, Name from Account Where Id Not In (Select AccountId from Contact)]);
            List<Contact> contactListTobeCreated = new List<Contact>();
            for(Account acc : accList){
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.LastName = acc.Name;
                contactListTobeCreated.add(con);
            }
            if(contactListTobeCreated.size()>0){
                Insert contactListTobeCreated;
            }
        }
    //13.Prepare a method which will return all the Accounts for which at
    //least a contact is present
        //Sol1
        public static List<Account> accountsWithAtLeastOneContact(){
            //Get the account Ids from all the contacts in the org
            List<Contact> contactsList = new List<Contact>();
            contactsList = [Select AccountId from Contact];
            Set<Id> accntIdsSet = new Set<Id>();
            for(Contact con : contactsList){
                accntIdsSet.add(con.AccountId);
            }
            List<Account> accountsList = new List<Account>();
            accountsList = [Select Id, Name from Account WHere Id In : accntIdsSet];
            return accountsList;
        }
        //Sol2
        public static List<Account> accountsWithAtLeastOneContact1(){
            //Get the account Ids from all the contacts in the org
            List<Account> accountsList = new List<Account>();
            accountsList = [Select Id, Name from Account Where Id In (Select AccountId from Contact)];
            return accountsList;
        }
    //14.Prepare a method which will return all the Accounts for which at
    //least a closed Won Opportunity is present. Make it dynamic if we
    //want to bring account for other opportunity stageNames
        public static List<Account> accountsWithAtLeastOneOpp(String oppstageName){
            List<Account> accountsList = new List<Account>();
            accountsList = [Select Id, Name from Account Where Id In (Select AccountId from opportunity Where StageName = : oppstageName)];
            return accountsList;
        }
    //15.Delete all the contacts which have no accounts attached to them
        public static void deleteOrphanContacts(){
            List<Contact> consList = new List<Contact>();
            consList = [Select Id from contact where AccountId = null];
            if(!consList.isEmpty()){
                Delete consList;
            }
        }
    }