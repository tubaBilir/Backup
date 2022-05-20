public with sharing class ContactTriggerHandler {


//VALIDATE DELETE OPERATION
// If a user try to delete a contact which has no account, it should get error message.

public static void validateDelete( List<Contact> triggerOld) { // Before Delete eventte sadece Trigger.old kullanilir

    for (Contact c : triggerOld) {
        if(c.AccountId == null ){
        c.addError('You cannot delete contact without account');
        }
    }
}


//WHEN CHILD UPDATED / UPDATE PARENT
//Create a checkbox field on account called 'need info' and create checkbox field on contact 'passive'
//if 50 % or more of contact related to the account are passive mark 'need info' checkbox =true

public static void passiveContacts(List<Contact> triggerNew) {

    Set<Id> setOfAccount = new Set<Id>();

    for(Contact con : triggerNew){
        setOfAccount.add(con.AccountId);
    }

    integer active;
    List<Account> lstAccount = [select Id, Name, Need_Info__c, (select id, Passive__c from contacts where Passive__c = false) FROM Account WHERE Id IN : setOfAccount];
    
    integer passive;
    List<Account> lstAccount2 = [select Id, Name, Need_Info__c, (select id, Passive__c from contacts where Passive__c = true) FROM Account WHERE Id IN : setOfAccount];

    List<Account> uptList = new List<Account>();
    for(Account acc : lstAccount){
    active = acc.Contacts.size() ;
        for(Account acc1 : lstAccount2){
            passive = acc1.Contacts.size();
            if(passive > active){
            acc.Need_Info__c = true;
            uptList.add(acc);
            }
        }
    }
    update uptList; 
}



//IF CHILD CREATED FOR ALREADY EXIST PARENT => update child
//when a new contact is created for a existing account then set contact otherphone as account phone.
//BEFORE INSERT

public static void ExistContactUpdate(List<Contact> TriggerNew) {

    Set<Id> accIdSet = new Set<Id>();
    for(Contact con : TriggerNew){
        if(String.isNotBlank(con.AccountId)){
            accIdSet.add(con.AccountId);
        }
    }

    if(accIdSet.size() > 0){
        Map<Id,Account> accMap = new Map<Id,Account>([Select Id, Phone From Account where id In:accIdSet]);
        for(Contact con : TriggerNew){
            if(con.AccountId != null && accMap.containskey(con.AccountId)){
                if(accMap.get(con.AccountId).Phone != null){
                    con.OtherPhone = accMap.get(con.AccountId).Phone;
                }
            }
        }
    }
}


//
//Create  “Contact Relationship” field which is checkbox on the Contact Object and Create the related object called “Contact Relationship” which is a related list to the Contacts.(Look Up Relationship). Write a trigger for, when we create contact by checking the Contact Relationship checkbox, then Contact Relationship will be created automatically for that contact.

public static void createContactRelation(List<Contact> triggerNew) {

    List<Contact_Relationship__c > crList = new List<Contact_Relationship__c >();

    for (Contact con : triggerNew) {
        if(con.Contact_Relationship__c == true){ //(con.Contact_Relationship__c) bu sekilde de yazabiliyoruz true yazmadan
            Contact_Relationship__c cr = new Contact_Relationship__c();
            cr.Contact__c = con.id;
            crList.add(cr);
        }
    }

    if(crList.size()> 0)
    insert crList;
    
}



//@future -BURAK HOCA 23 MART
//Contactin leadSourcu degismis ve WEB olmussa descriptinonu update edildi olarak guncelle ve tarih yaz >> NORMAL METOTLA

 public static void descriptionsUpdate(List<Contact> conNew, Map<Id,Contact> conOldMap) {
    for (Contact cnt : conNew) {
        if (cnt.LeadSource == 'Web' && (cnt.LeadSource != conOldMap.get(cnt.id).LeadSource)) {
            cnt.Description = cnt.Description + ' Update EDILDI '+ Datetime.now();
        }
    }
}

//@FUTURE METOT ILE UPDATE
//Bir Contact Lead Source update edildiğinde ve Web olduğunda Description update edilsin
public static Boolean sayac = true;

@future
public static void updateOfContactsWithFuture(Set<Id> cnIds) {
   List<Contact> conList = [select id, name, Description from Contact where id in :cnIds];
   for (Contact c : conList) {
       c.Description = c.Description + ' update oldu future metodu ile ' + Datetime.now();
   }
   if (conList.size()>0) {
       sayac = false;
       update conList;
   }
}


//JIMMY QA SESSION 
//TRACK AND UPDATE CHILD NUMBER ON PARENT IN EVERY SCENARIO
//Create field 'number of contacts' on account and track accounts contacts in every events; insert, update, delete and undelete.
//i iterate Contact in for loop, and then i query for Account. when i get accounts Contacts List, i can assign this list size as a Accounts number of Contact field

    public static void afterInsert(List<Contact> lstContacts){
        system.debug(lstContacts);
        Set<Id> setOfAccount = new Set<Id>();
        for(Contact con : lstContacts){
            setOfAccount.add(con.AccountId);
        }

        List<Account> lstAccount = [select Id, Name, Number_of_Contacts__c, (select id from contacts)  FROM Account WHERE Id IN : setOfAccount];
        system.debug('###lstAccount=='+lstAccount); 
        for(Account acc : lstAccount){
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }

        if(lstAccount.size() > 0){
            update lstAccount;
        }
    }

    public static void afterUpdate(List<Contact> lstContacts){
        system.debug(lstContacts);
        Set<Id> setOfAccount = new Set<Id>();
        for(Contact con : lstContacts){
            setOfAccount.add(con.AccountId);
        }

        List<Account> lstAccount = [select Id, Name, Number_of_Contacts__c, (select id from contacts)  FROM Account WHERE Id IN : setOfAccount];
        system.debug('###lstAccount=='+lstAccount);
        List<Account> lstAccountUpdate = new List<Account>(); 
        for(Account acc : lstAccount){
            Account accRec = new Account();
            accRec.Id = acc.Id;
            accRec.Number_of_Contacts__c = acc.Contacts.size();
            lstAccountUpdate.add(accRec);
        }

        if(lstAccountUpdate.size() > 0){
            update lstAccountUpdate;
        }
    }

    public static void afterDelete(List<Contact> lstContacts){
        system.debug(lstContacts);
        Set<Id> setOfAccount = new Set<Id>();
        for(Contact con : lstContacts){
            setOfAccount.add(con.AccountId);
        }

        List<Account> lstAccount = [select Id, Name, Number_of_Contacts__c, (select id from contacts)  FROM Account WHERE Id IN : setOfAccount];
        system.debug('###lstAccount=='+lstAccount); 
        for(Account acc : lstAccount){
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }

        if(lstAccount.size() > 0){
            update lstAccount;
        }
    }


    //Burak Hocanin eklentisi ile, eski Accounttan eksilen Contactlari da update etmesi icin baska bir metot yaziyoruz
    //Update edilen contactin eski ve yein account idlerini karsialstir farkli ise hem eski hem yeni accountun Contact sayisini guncelle

/*

    public static void countContactsOnAccUpdate(List<Contact> TriggerNew,List<Contact> TriggerOld,map<id, Contact> TriggerNewMap, map<id, Contact> TriggerOldMap) {

        Set<id> myAcc = new Set<id>(); 
        for (Contact con : TriggerNew) { 
            if(con.AccountId != TriggerOld.get(con.id).AccountId){  //Eski yeni farki varsa yani update olmussa 
                myAcc.add(con.AccountId);
                myAcc.add(TriggerOld.get(con.id).AccountId);

            }
    
            List<Account> relatedAccList = [ Select id, name, Total_Contacts__c,  (select id, name, AccountId from Contacts) from Account where id in : myAcc ]; 
            for (Account accContacts : relatedAccList) { 
                integer size = accContacts.contacts.size();
                accContacts.Total_Contacts__c = size; 
            }
            update relatedAccList; 
        }
    }

//Delete Metotu ayni ornek uzerinden eklenecek
*/ // Tamamlanmadi


public static void countContactsOnAccDelete(List<Contact> TriggerNew,List<Contact> TriggerOld,map<id, Contact> TriggerNewMap, map<id, Contact> TriggerOldMap) {

    Set<id> myAcc = new Set<id>(); 
    for (Contact con : TriggerOld) { //New yerine old yaziyoruz delete edilen contactlarin accoutlarini sete ekle
        if(con.AccountId != null){  
            myAcc.add(con.AccountId); 
        }
        List<Account> relatedAccList = [ Select id, name, Total_Contacts__c,  (select id, name, AccountId from Contacts) from Account where id in : myAcc ]; 
        for (Account accContacts : relatedAccList) { 
            integer size = accContacts.contacts.size(); // insert metotu ile ayni sadece ilk for da Triggerolddan cagirdik delete olani bulmasi icin
            accContacts.Total_Contacts__c = size; 
        }
        delete relatedAccList; //insert degil delete yaptik
    }
}


//VALIDATION RULE
//User should get an error message “Contact without Account cannot exist” when user tries to create an Contact or tries to update an existing contact.

    public static void accountwithoutContact(List<Contact> TriggerNew, Map<id, Contact> TriggerOldMap) {
        for (Contact con : TriggerNew) {
            if(con.AccountId == null){
                con.addError('Contact without Account cannot exist');
            }
        }
    }
    
//HICBIR UPDATE'E IZIN VERME!
// Validate user when Contact LeadSource is 'Partner Referral' 
//Recorrddda hicbir update olmasina izin verme!
    public static void contactUpdateValidation1(List<Contact> cNew,
    List<Contact> cOld, Map<id, Contact> cNewMap, Map<id, Contact> cOldMap ) {

        for (Contact eachContact : cNew) {
            if(eachContact.LeadSource == 'Partner Referral'){
                eachContact.addError('You Can not update public referral source');
            }
        }
    }


//BIR FIELDIN UPDATINE IZIN VERME
// Dont allow user to update Lead Source field
//Sadece lead source filedini update izin verme
    public static void contactUpdateValidation2(List<Contact> cNew, List<Contact> cOld, Map<id, Contact> cNewMap, Map<id, Contact> cOldMap ) {

        for (Contact eachContact : cNew) {
            if(eachContact.LeadSource != cOldMap.get(eachContact.id).LeadSource){
                eachContact.LeadSource.addError('You Can not update Lead source'); // Fieldda hata mesaji gormek icin fieldi yaziyoruz addErrordan once!!!
            }
        }
    }
   
   
 


}
