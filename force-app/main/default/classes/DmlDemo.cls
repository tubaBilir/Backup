public class DmlDemo {



    public static void deleteSoftinnovas() {

        List<account> accList = [select id, name from account];

        List <Account> deleteList = new List <Account> ();

        for (Account acc : accList) {
            if(acc.name.contains('Soft')){
                deleteList.add(acc);
            
        }
        }

        delete deleteList;
    }






   
//The following example updates a contact and its related account using two update statements.
public static void trailheadDml() {

    Contact queriedContact = [SELECT Account.Name 
    FROM Contact 
    WHERE FirstName = 'Mario' AND LastName='Ruiz'
    LIMIT 1];
// Update the contact's phone number
queriedContact.Phone = '(415)555-1213';
// Update the related account industry
queriedContact.Account.Industry = 'Technology';
// Make two separate calls 
// 1. This call is to update the contact's phone.
update queriedContact;
// 2. This call is to update the related account's Industry field.
update queriedContact.Account; 

}



//insert record of standard obj
    public static void dmlInsertDemo_stndObj() {
//create new instance ui -> click new gibi
         Account acc= new Account();
//set the field values
        acc.name = 'Soft Innovas';
//final important step DML-> Save etmek gibi
        insert acc;  
        System.debug(acc);
    }

//update record after insert

public static void dmlUpdateDemo_1() {
    account acc = new Account();
    acc.name = 'SooooftInnovas';
    insert acc;

    acc.Name = 'Salesforce IInc';
    update acc;
    System.debug('update' + acc);
}

public static void dmlUpdateDemo_3() {
// returns account because limit 1, fetch record
    account acc = [select name from account where name = 'Soft Innovas' limit 1];
// update record
    acc.name = 'Soft Innovas Incc.';
    update acc;
    System.debug('updated acc '+ acc);
}

//Related Record= create new Contact for salesforce account(parent)
//on contact, Account field api name is => AccountId
//retrieve using soql then update record
public static void dmlUpdateDemo_Parent() {
// soql to get one account

account acc = [select id, name from account where name like 'Salesforce Ben' limit 1 ];
    // create contact record for this opportunity record
    contact cnt = new contact ();
    cnt.LastName = 'Biden';
    //account ve contacti id ile bagliyoruz
    cnt.AccountId = acc.id;
    insert cnt;
}

//birden cok record olusturma
public static void dmlMultipleInsert() {

    list<account> listAcc = new list<account>();

    account acc1 = new account();
    acc1.name = 'acc 1 ';
    listAcc.add(acc1);

    account acc2 = new account();
    acc2.name = 'acc 2 ';
    listAcc.add(acc2);

    account acc3 = new account();
    acc3.name = 'acc 3 ';
    listAcc.add(acc3);

    insert listAcc;

}

}
