public class SoqlDemo {
 

    //for all the opportunities other than the closed won or closed lost and on which there was no activity since last 7 days
    // [select id, OwnerId, CloseDate from Opportunity where LastModifiedDate < LAST_N_DAYS:7 and (stageName !='Closed Lost' or stageName !='Closed Won')]



//Son 5 yilda olustrurulmus Opp lari getir
// List<Opportunity> opps = [select id, name from opportunity where createdDate >: Date.today().addYears(-5)];




//[SELECT Name, (SELECT Name FROM Contacts) FROM Account WHERE Id IN (SELECT AccountId FROM Contact WHERE LastName = 'Forbes')]




//write query to get an Account record last 30 days activity histories

// List <Account> accList = [Select id, (SELECT id, subject, createdDate FROM ActivityHistories where createdDate = last_n_days: 30) From Account where id = '0018c00002F8sROAAZ']



//write query to see who has viewed recently any account in your org.
//SELECT Id, Name, Type, LastViewedDate, Profile.Name FROM RecentlyViewed WHERE Type= 'Account'ORDER BY LastViewedDate DESC 


//Write query that returns subtotals of accounts for each combination of Type and BillingCountry.

//select type, billingCountry, grouping(type) grpType, grouping(BillingCountry)grpCountry, COUNT(Id) accIds from Accounts Group By CUBE(Type, BillingCountry) order by grouping (Type), Grouping(BillingCountry)

//


//CHILD TO PARENT CUSTOM OBJECT 
//Property is child, brooker is parent

//[SELECT Address__c, Picture__c, Broker__c.Name FROM Property__c]

//PARENT TO CHILD CUSTOM OBJECT
//[SELECT Name, (SELECT Address__c, Price__c FROM Properties__r) FROM Broker__c]





    
//mustafaSahin database.query ile ornek

public static void soqlStyle() {
    string name= 'Test';
    name = '%' + name + '%' ;

    string rating = 'Hot';
    string active = rating == 'Hot' ? 'Yes' : 'No'; //if else gibi calisir

    string query = 'Select id, name, phone' 
    + 'From account'
    + 'Where Name LIKE : name' // where name LIKE %Test% 
    + 'AND Active__c = :active'
    + 'ORDER BY CreatedDate DESC';

    List<Account> accList = Database.query(query);
    System.debug('accList : ' + accList);
    System.debug('accList.size: ' + accList.size());

    Account acc = accList.size()> 0 ? accList[0]: null;
    if (acc!= null){
        System.debug('account name' + acc.name + 'Phone ' + acc.phone);
    }
}


// 2 parametre alan metot lastname ve mailing postal code girilerek invoke edilecek ve bunu donecek 

    public static List<Contact> searchForContacts(string lName, string mPc){
        
        List<Contact> conList= [Select id, lastName, mailingPostalCode from Contact where lastName =: lName and mailingPostalCode =: mPc];
        return conList;
    }


    public static void accountSOQL_1() {
        list<account> lstAcc = [Select ID, Name from Account where name like '%A%'];
        system.debug('account records = ' + lstAcc); //always liste olarak doner
        system.debug('number of records = ' + lstAcc.size()); // tek satirda, integer record sayisi doner

        //only limit 1 -> eger bir tane record donecekse sObjecct olarak doner
        Account acc = [Select Id, Name from Account order by CreatedDate desc limit 1];
        system.debug('Last created by = ' + acc );
    }

    public static void accountSOQL_2(){
        account acc= [Select Id, Name, phone, accountnumber from Account order by CreatedDate desc limit 1];
        system.debug('Last account record  = ' + acc );
        string accName= acc.name;
        string accPhone = acc.phone;
        system.debug('Acc name is ' + accName + ' Acc phone is  = ' + accPhone );
        system.debug('Account Number is ' + acc.AccountNumber);
    }

    public static void accountSOQL_3(){
        list<Account> ListAcc = [select id, name, phone, accountNumber from account order by createdDate desc];

        for (account eachAccount : ListAcc) {
            string accName = eachAccount.name;
            string accPhone = eachAccount.phone;
            
        System.debug('acc name ' + accName + 'acc phone ' + accPhone);
        System.debug('Account number is ' + eachAccount.AccountNumber);
        }
    }

    public static void accountSOQL_Filter(string accNameFilter){
        list<Account> listAcc = [select id, name from account where name = : accNameFilter];
        System.debug(listAcc);

    }

    //account icinde hem opp hem contact
    // select id, name,(Select UserId, TeamMemberRole, AccountAccessLevel from AccountTeamMembers), (Select Id from Opportunities) from Account


//SOSL ORNEK!
// create an Apex class that returns both contacts and leads that have first or last name matching the incoming parameter.
// The method must accept an incoming string as a parameter
// The method should then find any contact or lead that matches the string as part of either the first or last name
// The method should finally use a return type of List<List< sObject>>

public static List<List< SObject>>  searchContactsAndLeads(String searchWord){
        
    List<List<SObject>> searchList = [FIND :searchWord IN ALL FIELDS 
                                  RETURNING Lead(Name,FirstName,LastName), Contact(FirstName,LastName)];
    return searchList;
}


//SOSL global searche karsilik gelir
// 4 farkli object icin 4 soql yazmak yerine 1 sosl yazilir
//return olarak List<List<Sobject>> doner listelerin listesi
//icerdeki liste accountun listesi gibi,ilk liste ise butun objectlerin listesi 




}

