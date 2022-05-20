public class AccountInfoSoql {

    public AccountInfoSoql() {
        System.debug('Welcome to the world of SOQL. Please enter the key character to search.');
    }

    public static void keyContactMethod(string contactKey) {
       
    list<Contact> myContact = [select id, name, birthdate, Account.description, Account.industry, account.type from contact where name like :  '%' + contactKey + '%' ];

    if(!myContact.isEmpty()){
        for (contact filterCon : myContact) {
            System.debug( filterCon.id + ' | '  +  filterCon.Name + ' | ' + filterCon.Birthdate + ' | ' + filterCon.Account.description + ' | '  + filterCon.Account.Industry + ' | ' + filterCon.account.type );
        }
    }
    else {
        System.debug('Invalid key!');
    }
    }






    
}





