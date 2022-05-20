trigger AccountAssigment on Account (before insert, after insert, before update, after update) {

//CUSTOM LABEL ADD ERROR MESAJI
//ORG DA custom label olustur bir hata mesaji burada system.label. ile cagir

if(Trigger.isBefore && trigger.isUpdate){
    for (Account acc : trigger.new) {
        if(acc.Industry == 'Banking' && acc.Industry != trigger.oldMap.get(acc.id).Industry){
            acc.Industry.addError(system.label.HATAMESAJIiSMi); // string ile variabla assign edilip de burada cagirilabilir
        } 
    }
}


//FLAG BOOLEAN ILE OLAN SEKLIYLE
//Account active Yes ise descriptionu update et -  
/*
    if(Trigger.isBefore){
        System.debug('Before insert/ update trigger on Account');
         for (Account eachAcc : Trigger.New) {
             Boolean updateDesc = false;
               if(Trigger.isInsert && eachAcc.Active__c == 'Yes'){ // This is for insert
               System.debug('before and active yes');
               updateDesc = true;
               }
           if(Trigger.isUpdate){ // This is for Update
             Account oldAcc= Trigger.oldMap.get(eachAcc.id);
             Account newAcc= eachAcc; //  Same with => Trigger.oldmap.get(eachAcc.id)
 
             if(oldAcc.active__c != eachAcc.active__c  && eachAcc.active__c == 'Yes' ){ //Active field degismis ve yes olmussa
               System.debug('Before update and active is changed to yes');
               updateDesc = true ;
             }
           }
           if(updateDesc){
            eachAcc.Description = 'Account is active!';
           }
         }
       }
       */
      



// Print diffirence between old and new values of annual revenue when annual revenue is updated
/*
    if(Trigger.isAfter && Trigger.isUpdate){
        for (Account acc : Trigger.new) {
            if(acc.AnnualRevenue !=Trigger.oldMap.get(acc.id).AnnualRevenue){
                if(acc.AnnualRevenue != null && Trigger.oldMap.get(acc.id).AnnualRevenue!= null ){
                   decimal diff = acc.AnnualRevenue - Trigger.oldMap.get(acc.id).AnnualRevenue;
                   System.debug('Annual Revenue Difference is => ' + diff);
                }
            }
        }
    }
    */

/*

    if(Trigger.isAfter && Trigger.isUpdate){
        for (Account acc : Trigger.new) {
            if(acc.AnnualRevenue != Trigger.oldMap.get(acc.id).AnnualRevenue){
                if(Trigger.oldMap.get(acc.id).AnnualRevenue == null){
                    Trigger.oldMap.get(acc.id).AnnualRevenue =0;

                } 
                if (acc.AnnualRevenue == null){
                    acc.AnnualRevenue =0;
                }
                decimal diff = Trigger.oldMap.get(acc.id).AnnualRevenue - acc.AnnualRevenue;
                System.debug('Diffirence between old and new values of annual revenue is ==> ' + diff );
            }
        }
    }*/
}