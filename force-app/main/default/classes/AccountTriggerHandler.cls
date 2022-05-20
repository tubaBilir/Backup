public with sharing class AccountTriggerHandler {






    

//Write Trigger on Account to Update the Associated Contact Account Name Null Whenever Account Record is Updated
//before update, after update

    //bu  update edilecek, calisiyor ama accountun related sayfasinda contact olsutugunda accountunu silerek sadece contacte ekliyor
    //Hilalinkiyle guncellenecek
    //before update icin account id gir conditionu eklenecek

    public static void updateCont (List<Account> TriggerNew, Map<Id,Account> TriggerOldMap, Map<Id,Account> TriggerNewMap) {

        Set<Id> accIDs = new Set<Id>();
        List<Contact> listCon = [Select id, name, AccountId FROM Contact WHERE AccountID in : accIDs]; 
        for (Account acc : TriggerNew) {
            if (TriggerOldMap != TriggerNewMap) {
                accIDs.add(acc.Id); 
            }
        } 
        
        for (Contact con : listCon) {
            con.AccountId = null;
        }
        update listCon;
        
    }


// PARENTIN CHILDI VARSA SILINMESINI ENGELLE
 // Prevent the deletion of accounts if they have related opportunities.
 //Trigger event : (before delete)
 
 public static void validateDelete() {

     for (Account a : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :Trigger.old]) {
        Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
    }
 }
    


//PATTERN
// List<Opportunity> oppList = new List<Opportunity>();
    
//     // Add an opportunity for each account if it doesn't already have one.
//     // Iterate over accounts that are in this trigger but that don't have opportunities.
//     for (Account a : [SELECT Id,Name FROM Account
//                      WHERE Id IN :Trigger.New AND
//                      Id NOT IN (SELECT AccountId FROM Opportunity)]) {
//         // Add a default opportunity for this account
//         oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
//                                    StageName='Prospecting',
//                                    CloseDate=System.today().addMonths(1),
//                                    AccountId=a.Id)); 
//     }
//     if (oppList.size() > 0) {
//         insert oppList;
//     }



//WHEN UPDATE (ANY UPDATES) PARENT -> UPDATE CHILDS
//Write a trigger on the Account when the Account is updated check all opportunities related to the account. Update all Opportunities Stage to close lost if an opportunity created date is LESS than 30 days from today and stage not equal to close won.

public static void accountOppsUpdateStage (List<Account> TriggerNew, Map<Id,Account> TriggerOldMap, Map<Id,Account> TriggerNewMap) {
    Set<Id> accIDs = new Set<Id>();

    for (Account acc : TriggerNew) {
        if (TriggerOldMap != TriggerNewMap) { //if an account is updated
            accIDs.add(acc.Id); //add Id of account to the set
        }
    } //we have a populated set of accIds
    //triggerNew is a list of accounts; and we are comparing accountID
    List<Opportunity> listOfOpps = [Select id, name, AccountId, StageName, CreatedDate FROM Opportunity WHERE accountID in : TriggerNew]; //brings us all opps with a account that started trigger and is updated
    System.debug('Print list of opps' + listOfOpps);
    for (Opportunity opp : listOfOpps) {
        if (opp.CreatedDate < date.today().addDays(-30) && opp.StageName != 'Closed Won') { // created date must be in current month (within 30 days of)
            opp.StageName = 'Closed Lost';
        }
    }
    System.debug('After: Print list of opps' + listOfOpps);
    update listOfOpps;
    
}


//Whenever an Account phone number is modified, update all the contacts of the Account as follows:
//a. Contacts otherPhone as Old phone no of account
//b. Contacts mobilePhone as New phone no of Account.

public static void accContPhone(List<Account> TriggerNew,List<Account> TriggerOld,map<id, Account> TriggerNewMap, map<id, Account> TriggerOldMap) {

    List<Account> accList = new  List<Account> ();

    for (Account acc : TriggerNew) {
        if(acc.Phone != TriggerOldMap.get(acc.id).Phone){
            accList.add(acc);
        }

        list<Contact> contactList =[select id, name, accountId from Contact where account.id in : accList];

        for (Contact eachCon : contactList) {
            eachCon.OtherPhone = TriggerOldMap.get(acc.id).Phone;
            eachCon.MobilePhone = TriggerNewMap.get(acc.id).Phone;
        }
        update contactList;
    }
}



//Whenever New Account Record is created then we need to create associated Contact Record automatically and set the following details./Contact last name → Account name/Contact phone → Account phone


public static void accConRelation(List<Account> TriggerNew) {
    
 List<Contact> conList = new List<Contact>();

    for (Account acc : TriggerNew) {
       Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = acc.Name;
        con.Phone =acc.Phone;
        conList.add(con);
    }
    insert conList;
}


//VALIDATION RULE
//Don’t allow the Account record to save in case if the new Annual revenue value is less than the older one and show the error message as ‘Annual revenue cannot be reduced’ at the Annual Revenue field.

public static void accAnnualValidation(List<Account> triggerNew, map<id, Account> TriggerOldMap) {

    for (Account acc : triggerNew) {
        if(acc.AnnualRevenue < TriggerOldMap.get(acc.id).AnnualRevenue){
            acc.AnnualRevenue.addError('Annual revenue cannot be reduced');
        }
    }
}


//UPDATE CHILD WHEN PARENT UPDATED
// Update contact vip field when Account vip field is checked (UPDATED)

    public static void updateVIPforAllContacts(List<account> accTriggerNew,
    List<account> accTriggerOld,
    map<id, account> accTriggerNewMap,
    map<id, account> accTriggerOldMap) {

//get set of account id s where only vip fields is updated
    set<id> setAccIds = new set<id> ();

    for (Account eachAcc : accTriggerNew) {
        // new acc vip != old acc vip to check if Vip is updated
        if(eachAcc.vip__c != accTriggerOldMap.get(eachAcc.id).VIP__c ){
            setAccIds.add(eachAcc.id); //VIP filedi degisen accountlarin id lerini set e koy asagida query de bu idlerin contactlarini aratip cekecek
        }
    }

    List<Contact> listContacts = [select id, name, account.id, vip__c from contact where account.id in : setAccIds]; // setaccids icinde vip fieldi degisen accountlar var, bu accountlarin contactlarini listeye koy

    for (Contact eachContact : listContacts) { // bu listedeki contactlarin Vip fieldini 
        //update accounts vip to contact
        eachContact.vip__c = accTriggerNewMap.get(eachContact.Account.id).vip__c;// id si eslesen accountun vip fieldine Contactinin vip ini assign et
    }
        if(!ListContacts.isEmpty()){
           update listContacts; 
        }
    }                                       


//Boolean flag

    public static void updateAccountDescription(List<account> accTriggerNew,
                                        List<account> accTriggerOld,
                                        map<id, account> accTriggerNewMap,
                                        map<id, account> accTriggerOldMap) {
                                 
        for (account eachAcc : accTriggerNew) {
            //boolean flag to check if we want to update description
            //so false
            Boolean updateDesc = false;
            if (accTriggerOldMap == null && eachAcc.Active__c == 'Yes') { //triggerold or oldMap = null > is insert
                system.debug('before and active is yes');
                //true, we want to update it when Active is yes.
                updateDesc = true;
            }
            //if oldMap not null, then old value exists, so it is update
            if(accTriggerOldMap != null){
                Account oldAcc = accTriggerOldMap.get(eachAcc.id);

                if (eachAcc.active__c == 'Yes'
                && oldAcc.active__c != eachAcc.active__c) {
                    system.debug('before update and active is changed to yes');
                    updateDesc = true;
                }
            }
            if(updateDesc){
                eachAcc.description = 'Account is now active. Enjoy!';
            }
        }
    }

  


    

}