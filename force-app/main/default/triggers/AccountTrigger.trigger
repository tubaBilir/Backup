trigger AccountTrigger on Account (after insert, after update) {

//Write a trigger that creates opportunity record if the account doesn't contain at least one opportunity.
//after insert after update

List<Opportunity> oppList = new List<Opportunity> ();


List<Account> accList = [select id, name, (select id from Opportunities) from Account where id in: trigger.new ];

for (Account acc : trigger.new) {
  if(acc.Opportunities.size() == 0){
    Opportunity opp = new Opportunity();
    opp.AccountId = acc.id;
    opp.Name = acc.name + 'Opportunity';
    opp.StageName = 'Prospecting';
    opp.CloseDate = system.today().addMonths(1);
    oppList.add(opp);
  }
}

  if(oppList.size() > 0){
  insert oppList;

}




//WHEN PARENT UPDATED CHECK CHILDEREN AND THEN UPDATE PARENT AGAIN
//before update
//Create a checkbox field called Out of Zip (default off) on Account . When a Billing Address is updated, get the new Postal Code. Then check which Contacts on the Account are outside of that Postal Code Area. If 1 or more Contacts are outside of the Postal Code Area, mark Out_of_Zip as TRUE.

// set<id> AccIds = new set<id>();

// for(Account acc: trigger.new){
//         if(acc.BillingStreet != trigger.oldMap.get(acc.Id).BillingStreet 
//              || acc.BillingState !=  trigger.oldMap.get(acc.Id).BillingState
//              || acc.BillingCity != trigger.oldMap.get(acc.Id).BillingCity
//              || acc.BillingPostalCode != trigger.oldMap.get(acc.Id).BillingPostalCode
//              || acc.BillingCountry != trigger.oldMap.get(acc.Id).BillingCountry){
//                 AccIds.add(acc.Id);
//              }
// }
//     List<Contact> cntList = [SELECT id,LastName,MailingPostalCode FROM Contact WHERE AccountId IN : AccIds];
    
//         set<Id> contactOutofPostal = new set<Id>();

//     for(Account acc: trigger.new){
//        for(Contact cnt :cntList){

//         if(acc.BillingPostalCode != cnt.MailingPostalCode){
//             contactOutofPostal.add(cnt.Id);
//         }
//         if(contactOutofPostal.size() >=1){
//               acc.OutofZip__c = True;      
//         }
//        }
//     }
    





//IF PARENT UPDATE SEND EMAIL TO CHILD
//When Account type changes send an email to all related contacts that their account information has been changed.
// Subject: Account Update
// Body:  Account information has been updated.

// List<Contact> conList =[select id,accountid, email  from Contact where accountid in : trigger.new];
// Map<id, string> conEmailMap = new Map<id, string>();
// List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
// for (Account acc : trigger.new) {
//   for (Contact con : conList) {

//     if(acc.Type != trigger.oldMap.get(acc.id).Type && acc.id == con.AccountId && con.Email != null){
//       conEmailMap.put(con.id, con.Email);

//                 Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
//                 mail.setSenderDisplayName('Future SalesForcers'); //mail.setTargetObjectId(con.id) ile de gidebilir
//                 mail.setBccSender(False);
//                 mail.setUseSignature(False);
//                 mail.setSaveAsActivity(False);
//                 mail.toaddresses = new String[]{con.Email};
//                 mail.setSubject('Account Update');
//                 String Body = 'Dear User, Account information has been changed';
//                 mail.setHtmlBody(body);
//                 mails.add(mail);    
//             }    
//             if(mails.size()>0){
//             Messaging.SendEmailResult[] results = Messaging.sendEmail(mails);
//             if (results[0].success) {
//                 System.debug('Email has been sent successfully');    
//             } else {
//                 System.debug('Email failed to send : ' + results[0].errors[0].message);
//             }
//     } 
//   }
// }






//When we create Account with Industry as Construction then create a Contact for Account, Contact Last Name as Account Name and Contact phone as Account phone.
//after insert

// List<Contact> conList = new list <Contact>(); // Tek Contact yazinca 30 lu insertte accountlara contact girmedi

// for (Account acc : trigger.new) {
//   if(acc.Industry == 'Construction'){
//     Contact con = new Contact();
//     con.AccountId = acc.Id;
//     con.LastName= acc.Name;
//     con.Phone = acc.Phone;
//     conList.add(con);
//   }
// }

// insert conList;





//VALIDATE DELETING PARENT IF HAS CHILD
//Write a trigger in which if an account that has related contacts and the user tries to delete that account it throws you an error "Account cannot be deleted".
//before delete

// Set<id> accIdSet = new Set<id>();  
// for(Account acc : Trigger.old)  
// {  
//     accIdSet.add(acc.id);  
// }  

// Map<Id, Account> accts = new Map<Id, Account>([Select Id, (Select Id from contacts) from Account where id in :accIdSet]);
 
// for(Account acc : Trigger.old)
// {
//     if(accts.get(acc.id).contacts.size()>0)
//     {
//         acc.adderror('Account cannot be deleted');
//     }
// }   




//WHEN PARENT UPDATE, UPDATE CHILD
//Write a trigger when the Account is updated check all opportunities related to that account. Update all Opportunities Stage to Close Lost if an Opportunity created date is greater than 20 days from today and Stage not equal to Close Won
//after update

// Set<Id> accountIds = new Set<Id>();
// for(Account a:Trigger.new){
// accountIds.add(a.Id);
// }   
// //day20 is the date which is 20 days before today
// DateTime day20=system.now()-20;
// List<Opportunity> oppListToUpdate=new List<Opportunity>();
// //getting the opportunities whose account has been updated
// List<Opportunity> oppList = [Select Id, AccountId, StageName, CreatedDate, CloseDate from Opportunity where AccountId in :accountIds];
// if(oppList.size()>0){
//     for(Opportunity opp : oppList){
// //checking for condition if created date is greater than 20 days from today and stage is not equal to closed won
//         if(opp.CreatedDate<day20 && opp.StageName!='Closed Won'){ 
//             opp.StageName='Closed Lost';
// //Mandatory field when we update the CloseDate
// opp.CloseDate=system.today(); //STAGE NAME CLOSED LOST OLURSA CLOSED DATE YAZMAK ZORUNLU FIELD!!! yoo bunsuz da calisti?
// oppListToUpdate.add(opp);
// //putting the changed opp to separate list to update later
//     }
// }
// }   
// //checking if the opp list which has changed haves records
// if(oppListToUpdate.size()>0){
// update oppListToUpdate;
// }





//Write Trigger on Account to Update the Associated Contact Account Name Null Whenever Account Record is Updated
//before update, after update

// if(Trigger.isAfter && Trigger.isUpdate){
//   AccountTriggerHandler.updateCont(Trigger.New, Trigger.NewMap, Trigger.OldMap);
// }

//Bu kismi calisan Hilal'in, Handlersiz
// list<Contact> relatedContact = [SELECT id,LastName FROM Contact WHERE AccountId IN : trigger.new];
// list<Contact> updatedContacts = new list<Contact>();
// list<Contact> updatedContacts1 = new List<Contact>();
     
// if(trigger.isBefore && trigger.isUpdate){
//  for(account acc : trigger.new){
//   for (Contact cnt :relatedContact) {
//       cnt.AccountId = acc.Id;
//       updatedContacts1.add(cnt);
//   }
// } 
//  } update updatedContacts1;

  
    
//   for (Contact cnt :relatedContact) {
//       cnt.AccountId = null;
//       updatedContacts.add(cnt);
//   }
// update updatedContacts;





//MAIL GONDER!!!
// Once an Account is inserted,  an email below should go to the System Admin.
// An account has been created and the name is “Account Name”.
// after insert
 
  //To send list of mails when list of Accounts inserted
  // List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
  // //Query for getting email of SystemAdmin
  // User usr=[SELECT Id, Profile.Name, Email FROM User WHERE Profile.Name = 'System Administrator'];
  // for (Account acc : Trigger.new) {
  //     //Check if user email is not null
  //     if (usr.Email!=null) {
  //         //Assign single mail
  //         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
  //         //Assign sender name
  //         mail.setSenderDisplayName('Future SalesForcers');
  //         //Remove unnecessary fields
  //         mail.setBccSender(False);
  //         mail.setUseSignature(False);
  //         mail.setSaveAsActivity(False);
  //         //Assign receiver email
  //         mail.toaddresses = new String[]{usr.Email};
  //         //Assign Subject
  //         mail.setSubject('New Account has been created');
  //         //An instance for email body
  //         String Body = 'Dear System Adminstrator, New account has been created with the name of ' + acc.Name;
  //         //add email body
  //         mail.setHtmlBody(body);
  //         //Add single mail list
  //         mails.add(mail);    
  //     }    
  // }
  // //Check if list of mail is empty
  // if(mails.size()>0){
  //     Messaging.SendEmailResult[] results = Messaging.sendEmail(mails);
  //     if (results[0].success) {
  //         System.debug('Email has been sent successfully');    
  //     } else {
  //         System.debug('Email failed to send : ' + results[0].errors[0].message);
  //     }

  // }







//   Write a trigger on Account, when an account is inserted, automatically account billing address should populate into the account shipping address.
//   Parameterized olmadigi icin handlera gerek yok, 
//   ortada bir id olmadigi icin before insert

//     for (Account acc : trigger.new) {
//       if(acc.BillingAddress != null){ // adres genel olarak bu sekilde kullanilmaz bu kod butun street, postal code vs dolu olursa populate ediyor biri bos olursa populate etmiyor hepsi icin street null degilse, post code null degilse diye yazilmali ya da hic if yapmadan ne girilirse gecirsin dersek ifsiz..
//           acc.ShippingCity =acc.BillingCity;
//           acc.ShippingCountry =acc.BillingCountry ;
//           acc.ShippingPostalCode  =acc.BillingPostalCode;
//           acc.ShippingState= acc.BillingState ;
//           acc.ShippingStreet = acc.BillingStreet;
//       }
//  }





  // Write trigger that updates the field called “Hello” by the value “World” when you are create or update an account record. Create the field called “Hello” (Text)  on the Account Object

  // for (Account acc : trigger.new) {
  //   acc.Hello__c = 'World';
  // }



  /*

  if(Trigger.isBefore && Trigger.isUpdate){
    AccountTriggerHandler.accountOppsUpdateStage(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
  }
*/



/*

if(Trigger.isAfter && Trigger.isUpdate){
  AccountTriggerHandler.accContPhone(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
}

*/


/*
if(Trigger.isAfter && Trigger.isInsert){
  AccountTriggerHandler.accConRelation(Trigger.new);
}
*/


/* 
if(Trigger.isBefore){
  AccountTriggerHandler.accAnnualValidation(Trigger.new, Trigger.oldMap);
}
*/


//
//Call updateVIPforAllContacts method when account vip its Contact must update as VIP

// if(Trigger.isAfter && Trigger.isUpdate){
//   AccountTriggerHandler.updateVIPforAllContacts(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
// }


//
// Olmasi gereken Trigger handler dan sonra 

// if (trigger.isBefore) {
//   system.debug('before insert/update trigger on account object');
//   AccountTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
// }


/*
//Hem insert hem update bu yuzden sadece isBefore
//Active? field is =  isActive Yes update the description 'Account is active'

     if(Trigger.isBefore){
       System.debug('Before insert/ update trigger on Account');
        for (Account eachAcc : Trigger.New) {
          if(Trigger.isInsert && eachAcc.Active__c == 'Yes'){ // This is for insert
            System.debug('WHEN YOU INSERT ACCOUNT!');
            eachAcc.Description = 'Account is now Active';
          }
          if(Trigger.isUpdate){ // This is for Update
            Account oldAcc= Trigger.oldMap.get(eachAcc.id);
            Account newAcc= eachAcc; //  Same with => Trigger.oldmap.get(eachAcc.id)

            if(oldAcc.active__c != eachAcc.active__c  && eachAcc.active__c == 'Yes' ){ //Active field degismis ve yes olmussa
              System.debug('Before insert/ update trigger on Account');
              eachAcc.Description = 'Account is now Active';
            }
          }
        }
      }*/



  // websitesi update olan recordlari bul
/*
if (trigger.isAfter && trigger.isUpdate) {
    for (Id eachAccId : trigger.newMap.keyset()) {
        Map<id, account> accOldMap = trigger.OldMap;
        Account oldAccount = accOldMap.get(eachAccId);
        string oldWebsite = oldAccount.Website;

        Map<id, account> accNewMap = trigger.NewMap;
        Account newAccount = accNewMap.get(eachAccId);
        string newWebsite = newAccount.Website;


        if(oldWebsite != newWebsite){
            system.debug('For Account ' + newAccount.Name + ', new Website is ' + newWebsite);
        }
    }
}*/



/*
    if(trigger.isAfter && trigger.isUpdate){
        System.debug('Account update trigger of account object');
        map<id,account> accNewMap = trigger.newMap;
        map<id,account> accOldMap = trigger.oldMap;

        Set<id> accuntIds = accNewMap.keySet();
        for (id eachId : accuntIds) { 
            System.debug('Acc id ' + eachId);

            account newAcc = accNewMap.get(eachId); 
            System.debug('New account name = ' + newAcc.Name);

            account oldAcc = accOldMap.get(eachId);
            System.debug('Old account name = ' + oldAcc.Name);
        }

    }
*/




/*
    if(trigger.isAfter){
        if(trigger.isUpdate){
            for (account oldAcc : trigger.old) {
                System.debug('old acc id = ' + oldAcc.id + 'old acc name = ' + oldAcc.name);
            }

            for(Account newAcc : trigger.new){
                System.debug('new acc id = ' + newAcc.id + 'new acc name = ' + newAcc.Name);
            }
        }
    }

*/




//Print new and old Accounts name after update
/*
if(Trigger.isAfter && Trigger.isUpdate){

  map<Id, Account> accNewMap = trigger.newMap;
  map<Id, Account> accOldMap = trigger.oldMap;

  for (id eachId : accNewMap.keySet()) {
    System.debug('Acc Id => ' + eachId);

     Account newAcc = accNewMap.get(eachId);
     System.debug('Account new name ' + newAcc.name);

     Account oldAcc = accOldMap.get(eachId);
     System.debug('Account old name ' + oldAcc.name); 
  }
}
*/




/*
     if(trigger.isBefore && trigger.isInsert){ 
       System.debug('before insert trigger called'); //1 kez yazar
      }
     if(trigger.isAfter && trigger.isInsert){
       System.debug('after insert trigger called'); //1 kez yazar
      }
     if(trigger.isBefore && trigger.isUpdate){
       System.debug('before Update trigger called');
      }
     if(trigger.isAfter && trigger.isUpdate){
       System.debug('After Update trigger called');
      }
*/

/*
// org dan son create edileni cagirmak icin


if(trigger.isAfter){
  System.debug('Trigger.new in isAfter = ' + trigger.new);//newly inserted or updated record
}


*/
/*
List<account> newAccounts = trigger.new;

if(trigger.isAfter){
  System.debug('Trigger.new in isAfter = ' + newAccounts);//newly inserted or updated record
  System.debug('Size of newAccounts = ' + newAccounts.size());
}

*/
/*
if(trigger.isAfter && trigger.isInsert){
  List<account> newAccounts = trigger.new;
  System.debug('Size of newAccounts = ' + newAccounts.size());

  for(Account eachAcc : newAccounts){
    System.debug('Account id = ' + eachAcc.id + 'Account Name = ' + eachAcc.name );
  }

}*/

/*
if(Trigger.isBefore && trigger.isInsert){
  System.debug('Trigger before insert .new -> ' + trigger.new); //id olmaz kayit olmadi cunku
}

if(Trigger.isAfter && trigger.isInsert){
  System.debug('Trigger after insert .new -> ' + trigger.new);//id olur
}

//Update
List<Account> newAccounts = trigger.new;
if(Trigger.isBefore && trigger.isUpdate){
  System.debug('Trigger before update .new -> ' + trigger.new); //id olur cunku zaten record var sadece update oldu, last modified date 
  for (Account eachAcc :  newAccounts) {
    System.debug('Before update last modified date => '  + eachAcc.LastModifiedDate);
    
  }
}

if(Trigger.isAfter && trigger.isUpdate){
  System.debug('Trigger after update .new -> ' + trigger.new);//id olur, last modified date saniye farki olur onu gormek icin asagidaki gibi for loop yazilir
  for (Account eachAcc :  newAccounts) {
    System.debug('Before update last modified date => '  + eachAcc.LastModifiedDate);
  }
}
  */
/*
  //trigger.old insert yaparken null gelir cunku old data zaten yok

  if(trigger.isBefore && trigger.isInsert){
    System.debug('trigger old before insert => ' + trigger.old);
  }

  if(trigger.isAfter && trigger.isInsert){
    System.debug('trigger old after insert => ' + trigger.old);
  }
// update de eski datalari liste olarak getirir

  if(trigger.isBefore && trigger.isUpdate){
    System.debug('trigger old before update => ' + trigger.old);
  }

  if(trigger.isAfter && trigger.isUpdate){
    System.debug('trigger old after update => ' + trigger.old); // degisiklikleri goremeyiz , consolda gormek icin trigger.new kullanmak gerek
  }


*/



}

