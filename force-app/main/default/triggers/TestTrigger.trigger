trigger TestTrigger on Account (before insert, after insert, before update, after update) {

//Print For Account 'Vitap', webSite is; vitap.com where website field update in account

/*
   if(Trigger.IsAfter && Trigger.isUpdate){

       for (id eachAccId : Trigger.newMap.keySet()) {

        //Check website field updated or not
           Account newAcc= Trigger.newMap.get(eachAccId);
           string oldWeb = Trigger.oldMap.get(eachAccId).Website;

           if(oldWeb != newAcc.Website ){
            System.debug('For account ' + newAcc.Name + ' New Web site is ' + newAcc.Website);
           }
        }
   }

*/














//Print old and new Account name for all updated Accounts in after Update
/*
if(Trigger.IsAfter && Trigger.isUpdate){

    Map<Id, Account> newAccMap= Trigger.newMap;
    Map<Id, Account> oldAccMap= Trigger.oldMap;
   

    for (id eachId : Trigger.newMap.keySet()) {
        System.debug('Account id =' + eachId);

        Account newAcc = Trigger.newMap.get(eachId);
        System.debug('New Account Name = ' + newAcc.Name);

        Account oldAcc = Trigger.oldMap.get(eachId);
        System.debug('Old Account Name = ' + oldAcc.Name);
    }
}*/



//Print new account with id and name after insert
    // if(Trigger.isAfter && Trigger.isInsert){
    //     List<Account> accList = Trigger.new;
    //     System.debug('Number of Account printed ' +accList.size());
    //     for (Account eachAcc : accList) {
    //         System.debug('Account id => ' + eachAcc.id + 'Account Name => ' + eachAcc.Name);
    //     }
    // }

//Print trigger.new in before insert and after insert
/*
    if(Trigger.isBefore && Trigger.isInsert){
        System.debug('Trigger.old before insert ' + Trigger.old);
    }

    if(Trigger.isAfter && Trigger.isInsert){
        System.debug('Trigger.old after insert ' + Trigger.old);
    }

    if(Trigger.isBefore && Trigger.isUpdate){
        System.debug('Trigger.old before update ' + Trigger.old);
    }

    if(Trigger.isAfter && Trigger.isUpdate){
        System.debug('Trigger.old after update ' + Trigger.old);
    }*/


    //Print old and new names of all updated accounts
/*
    if(Trigger.isAfter){
        if( Trigger.isUpdate){
            for (Account eachOldAcc : Trigger.old) {
                System.debug('Old Account Name => ' + eachOldAcc.Name + 'Account ID ' + eachOldAcc.id );
            }
            for (Account eachNewAcc : Trigger.new) {
                System.debug('New Account Name => ' + eachNewAcc.Name + 'Account ID ' + eachNewAcc.id );
            }
        } 
    }*/












}