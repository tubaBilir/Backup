trigger OpportunityTrigger on Opportunity (after update) {


//Add Multi-select Picklist field on Account and Opportunity as well. Add values A,B,C,D. Now when we update  Opportunity with this multi-select values Account should also be updated with the same picklist values.
//	ABCD__c
//Asagida Ismail Beyinki var, bu benim yaptigim, multiselect olarak da boyle calisiyor, accountun ikiden fazla oppu varsa son update olanin degerini aliyor 

// List<Opportunity> updatedOpp = new List<Opportunity>();
// List<Account> oppsAccList = [select id, ABCD__c from Account];

// for (Opportunity opp : trigger.new) {
//     if(opp.ABCD__c != trigger.oldmap.get(opp.id).ABCD__c && opp.ABCD__c != null){
//         updatedOpp.add(opp);
//     }
// }

// List<Account> uptAcc = new List<Account>();

// for (Account acc : oppsAccList) {
//     for (Opportunity op : updatedOpp) {
//         if(acc.id == op.AccountId ){
//         acc.ABCD__c = op.ABCD__c ;
//         uptAcc.add(acc);
//         }
//     }
// }

if(uptAcc.size() > 0){
    update uptAcc;
}




    
// if(trigger.isInsert || trigger.isUpdate){
//     OpportunityTriggerHandler.getTotalProductQty(trigger.new);

// }


//   When an Opportunity is greater than $20k, mark is_gold to TRUE on account
//   Create a field on Account called “is_gold”, checkbox, default off
//   after update, after insert


// if(trigger.isInsert || trigger.isUpdate){

//   Set<Id> setOfacc = new Set<Id>();

//     for(Opportunity opp : trigger.new){
//       if(opp.Amount > 20000){
//         setOfacc.add(opp.AccountId);
//       }
//     }

//  List<Account> lstAccount = [select Id, Name, is_gold__c FROM Account WHERE Id IN : setOfacc];

//  for(Account acc : lstAccount){
//     acc.is_gold__c = true;
//  }

//  update lstAccount;

// }




//Whenever Opportunity "Stage" is modified to "Closed Won" then set "Close Date" as "Today Date" and "Type" as "New Customer"
//before Update

// List<Opportunity> listOpp = new List<Opportunity>();


// for (Opportunity opp : trigger.new) {
//     if(opp.StageName != trigger.oldMap.get(opp.id).StageName && opp.StageName == 'Closed Won'){
//         opp.CloseDate = date.today();
//         opp.Type = 'New Customer';
//         listOpp.add(opp);
//     }
// }

//dml yapmiyoruz niye? cunku ayni object uzerinde sadece update islemi 


//UPDATE MULTISELECT PICKLIST WITH MAP
//Add Multi-select Picklist field on Account and Opportunity as well. Add values A,B,C,D. Now when we update  Opportunity with this multi-select values Account should also be updated with the same picklist values.

    // set<id> accId = new set<id>();
    // map<id, string> countryMap = new map<id, string>(); //multiselect picklist oldugu icin boyle yaptik

    // for (Opportunity opp : trigger.new) {      
    //     if(opp.ABCD__c != trigger.oldMap.get(opp.id).ABCD__c && opp.AccountId != null ){
    //         countryMap.put(opp.AccountId, opp.ABCD__c);
    //         accId.add(opp.AccountId);
    //     }
    // }

    // List<Account> accUpdateList = new List<Account> ();
    // List<Account> accList =[select id, ABCD__c from Account where id in :accId];
    // if(accList.size() > 0){
    //     for (Account acc : accList) {
    //         if(countryMap.containsKey(acc.id)){
    //             string str = countryMap.get(acc.id);
    //             acc.ABCD__c = str;
    //             accUpdateList.add(acc);
    //         }
    //     }
    // }

    // if(accUpdateList.size()>0){
    //     update accUpdateList ;
    // }
    






//
//When we create the Opportunity with the Probability=30, opportunity owner will be automatically added to Account Team of the associated account for that Opportunity.
//AccountShare ve AccountTeamMember olusturmak gerekiyor isimleri backendde farkli

//  List<AccountShare> list_share = new List<AccountShare>();
//     List<AccountTeamMember> list_atm = new List<AccountTeamMember>();
//     for (Opportunity opp : Trigger.new) {
//         if (opp.Probability == 30) {
//             AccountTeamMember atm = new AccountTeamMember();
//             atm.accountid = opp.accountid;
//             atm.UserId = opp.OwnerId;
//             atm.TeamMemberRole = 'Account Manager';
//             AccountShare accshare = new AccountShare();
//             accshare.AccountId = opp.AccountId;
//             accshare.UserOrGroupId = opp.OwnerId;
//             accshare.AccountAccessLevel = 'Read/Write';
//             accshare.OpportunityAccessLevel = 'Read Only';
//             accshare.CaseAccessLevel = 'Read Only';
//             list_atm.add(atm);
//             list_share.add(accshare);        
//         }    
//     }
//     if(list_atm!=null)
//     insert list_atm;
//     if(list_share!=null && list_share.size()>0)
//     List<Database.saveresult> sr=Database.insert(list_share,false);



//CUSTOM SETTINGS ASSIGMENT 8-3.SORU
//stageName -Points match- update field on opp
//Create a new field "Points" in Opportunity Object. Update the Points fields whenever a new opportunity is created, or stage name field is updated. Please refer the below table for the points value for different stage Names.Store the above points value and Stage name mapping in custom setting so that in future if the points value changes for a particular stage name or a new stage name is introduced, we need not to change the apex code.
  
// if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
//     Map<String, StageNamePoints__c> points = StageNamePoints__c.getAll();
//     for (Opportunity  opp : Trigger.new) {
//         opp.points__c = points.get(opp).points__c;
//     }
// }
//Orga deploy edip denemedim




//Burak Hoca ile Sumitin @futureMethod Assigmenti - 19.Mart Cumartesi yapilan

    // if (trigger.isAfter) {
    //     Set<Id> accIds = new Set<Id>();
    //     if (trigger.isInsert) {
    //         for (Opportunity op : trigger.new) {
    //                 accIds.add(op.AccountId);
    //         }
    //     }
    //     if (trigger.isUpdate) {
    //         for (Opportunity op : trigger.new) {
    //             if (op.Amount != trigger.oldMap.get(op.id).Amount || op.AccountId != trigger.oldMap.get(op.id).AccountId || op.stageName != trigger.oldMap.get(op.id).stageName) {
    //                 accIds.add(op.AccountId);
    //                 accIds.add(trigger.oldMap.get(op.id).AccountId);
    //             }
    //         }
    //     }
    //     if (trigger.isDelete) {
    //         for (Opportunity op : trigger.old) {
    //             accIds.add(op.AccountId);
    //         }
    //     }
    //     if (trigger.isUndelete) {
    //         for (Opportunity op : trigger.new) {
    //                 accIds.add(op.AccountId);
    //         }
    //     }
    //     if (!accIds.isEmpty()) {
    //         // 1-A
    //         OpportunityTriggerHandler.updateHighestAmountOpportunityName(accIds);
    //         // 1-B
    //         OpportunityTriggerHandler.updateTargetAmountAchievedOppName(accIds);
    //         // 1-C
    //         OpportunityTriggerHandler.updateTotalAmountGenerated(accIds);
    //     }
        
    // }


    // if(Trigger.isBefore && Trigger.isUpdate){
    //     OpportunityTriggerHandler.crateTaskOpp(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    // }
    
    

    // if(Trigger.isBefore && Trigger.isUpdate){
    //     OpportunityTriggerHandler.stageValidation(Trigger.New, Trigger.OldMap);
    // }



// if(Trigger.isBefore && Trigger.isUpdate){
//     OpportunityTriggerHandler.oppCloseDate3(trigger.New, Trigger.OldMap);
// }


    // if(Trigger.isBefore && Trigger.isUpdate){
    //     OpportunityTriggerHandler.oppCloseDate2(trigger.New, Trigger.oldMap);
    // }





// if(Trigger.isBefore && Trigger.isInsert){
//     OpportunityTriggerHandler.oppCloseDate(trigger.New);

// }


    
//Opp name should have type and lead source

// if(Trigger.isBefore && Trigger.isInsert){
//     OpportunityTriggerHandler.nameTypeLeadSource(trigger.New);
// }



/*
//opportunitynin Amount update edildiğinde bağlı olduğu accountun 
//tüm opportunities nin Amount toplamları Accountun Description kısmına yazılsın.

if(Trigger.isUpdate && Trigger.isAfter){
    OpportunityTriggerHandler.totalAmountOfDescription(Trigger.new, Trigger.oldMap);
}
*/


/*Create a validation rule which does not allow to update the stage
of an opp once it is closed/won or closed/lost. For closed/won user should get error
message as "Stage can not be changed from Closed/won" and For closed/lost user
should get error message as "Stage can not be changed from Closed/Lost*/

/*
if (Trigger.isBefore && Trigger.isUpdate) {
    for (opportunity opp : Trigger.new) {
        if(opp.stageName !=Trigger.oldMap.get(opp.id).StageName){ // eger update olmussa
            if(Trigger.oldMap.get(opp.id).StageName == 'Closed/Lost'){ //eski deger bu ise
               opp.addError('Stage can not be changed from Closed/Lost'); // hata mesaji ver
            } // VEE
            if(Trigger.oldMap.get(opp.id).StageName == 'Closed Won'){ // eski deger bu ise
            opp.addError('Stage can not be changed from Closed/Won'); // hata mesaji ver
            }
        }
    }
}

*/



// When stagename of an opp is updated print value of description and opp name
/*
if(Trigger.isAfter && Trigger.isUpdate){
    for (Opportunity opp : Trigger.new) {
        if(opp.StageName != Trigger.oldMap.get(opp.Id).StageName){ // eski recordun fieldine oldmap ten id nin valusu olan opp a ulasip fieldini yazdirdik
            System.debug(opp.Name + opp.Description);
        }
    }
}
*/


// OLD VE NEW FIELDI AYNI SATIRDA GORMEK ICIN Trigger.new icinde oldMape ait Value cagirilir, parantez icine id, hemen disina da fieldi yazilir amount
/*
if(Trigger.isAfter && Trigger.isUpdate){

    for (Opportunity eachOpp : Trigger.new) {
        System.debug('New Amount = ' + eachOpp.Amount + 'Old Amount ' + Trigger.oldMap.get(eachOpp.id).Amount);
        System.debug('New Close Date = ' + eachOpp.CloseDate + 'Old Close Date ' + Trigger.OldMap.get(eachOpp.id).CloseDate);
    }

}*/


/*
//When opp created print debug msg opp name, close date and amount and total transaction number- id li bir islem varsa after id siz ise before da olur

if(Trigger.IsAfter && Trigger.isInsert){

    for (Opportunity eachOpp : Trigger.new) {
        System.debug('Opportunity Name ' + eachOpp.Name + 'Opportunity Close Date ' + eachOpp.CloseDate + 'Opportunity Amount ' + eachOpp.Amount);
    }

    System.debug('Total number of Transaction ' + Trigger.new.size());

}*/



/*
    System.debug('We are in the triggers');

    //Try to print this message (Case# [caseNumber] was created with id [recordId] on [createdDate].) in all the events where Id is not null.

    if(Trigger.isAfter && Trigger.isInsert){
      for (Case creDtId : Trigger.new) {
          System.debug('Case id after Insert = ' + creDtId.id + 'Case # = ' + creDtId.CaseNumber +  ' Created Date =  ' +  creDtId.CreatedDate );
        }
    }

    if(Trigger.isBefore && Trigger.isUpdate){
        for (Case creDtId : Trigger.new) {
            System.debug('Case id before Update = ' + creDtId.id + 'Case # = ' + creDtId.CaseNumber +  ' Created Date =  ' +  creDtId.CreatedDate );
        }
    }

    if(Trigger.isAfter && Trigger.isUpdate){
        for (Case creDtId : Trigger.new) {
            System.debug('Case id after Update = ' + creDtId.id + 'Case # = ' + creDtId.CaseNumber +  ' Created Date =  ' +  creDtId.CreatedDate );
        }
    }

  */


/* // Assignment 1
    if(Trigger.isAfter){
        System.debug('We are in the after triggers');
    }
    if(Trigger.isBefore){
        System.debug('We are in the before triggers');
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        System.debug('We are in the before-Update triggers');
    }
    if(Trigger.isBefore && Trigger.isInsert){
        System.debug('We are in the before-Insert triggers');
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        System.debug('We are in the after-Update triggers');
    }
    if(Trigger.isAfter && Trigger.isInsert){
        System.debug('We are in the after-Insert triggers');
    }
*/



/*
    if(Trigger.isAfter && Trigger.isUpdate){

        Map<id, Opportunity> oppAmClsDate = Trigger.oldMap;

        for (Opportunity eachIdAmnt : Trigger.new) {
            Opportunity oldValue = oppAmClsDate.get(eachIdAmnt.id);
            System.debug('Old Amount = ' + oldValue.Amount + 'New Amount ' + eachIdAmnt.Amount);
            System.debug('Old Close Date = ' + oldValue.CloseDate + 'New Close Date ' + eachIdAmnt.CloseDate);
            
        string newStageName = eachIdAmnt.stageName;
        string oldStageName = oldValue.StageName;

        if(oldStageName != newStageName ){
            System.debug('Opp name = ' + eachIdAmnt.Name );
            System.debug('Opp description ' + eachIdAmnt.Description );
        }
        }
    }
*/


/*
//When an opportunity is created show a debug message ([OpportunityName] – [CloseDate] – [Amount]) for each opportunity and print the total number of opportunities created in the transaction. For example: Demo Opportunity – 20/10/2022 – 40000.

    if(Trigger.isBefore && Trigger.isInsert){
        integer totalOpp = Trigger.new.size();
        System.debug('Total # Opp ' + totalOpp);

        for (Opportunity nameDtAmnt : Trigger.new) {
            System.debug('Opp name = ' + nameDtAmnt.Name + 'Opp Closed Date = ' + nameDtAmnt.CloseDate + 'Opp Amount ' + nameDtAmnt.Amount ); 
        }
    }

*/


    //Jimmys Assigment
    // Create one trigger on Opportunity object and that should be executed on update. I want you to print the opportunity records which were updated along with the old value and new value both. Along with the same, I want to make sure and show that to users with the help of debug that how many records' names have been changed.
/*
    if(Trigger.isAfter && Trigger.isUpdate){

        for (id eachId : Trigger.newMap.keySet()) {

            Opportunity newOpp = Trigger.newMap.get(eachId);
            System.debug('New Opportunity Name = ' + newOpp.Name);
            Opportunity oldOpp = Trigger.oldMap.get(eachId);
            System.debug('Old Opportunity Name = ' + oldOpp.Name);
        }

        System.debug('How many Record Updated? ==> ' + Trigger.newMap.size());
    }
*/

    /*
     //trigger.new to get the fields
    
    if(Trigger.isInsert){ // for before and after insert 2 tane gelir consolda

         integer numOppsThatRanTrigger = trigger.new.size(); // returns number
         System.debug('Total Opps created' + numOppsThatRanTrigger );
         for (Opportunity opp : trigger.new) {
            System.debug(opp.Name + '-' + opp.Amount + '- ' + opp.CloseDate);
         }
    }


    if(trigger.isUpdate){
        Map<Id, Opportunity> oppOldValuesMap = trigger.oldMap;

        for(Opportunity opp : trigger.new){
            //first getting the old record with the help of Id(never changes) in record record

            Opportunity oppOld = oppOldValuesMap.get(opp.Id);
            System.debug('Old Amount = '+oppOld.Amount + ' New Amount = '+opp.Amount);

            System.debug('Old Close date = '+oppOld.CloseDate + ' New Close date = '+opp.CloseDate);
        } 

        string stgName = opp.stageName; 
        if(stgName == 'Closed Lost'){
        }

    } */

}