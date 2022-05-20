trigger ContactTrigger on Contact (before insert, after insert, before update, after update, before delete) { 


// if(Trigger.isBefore && trigger.isDelete){
//   ContactTriggerHandler.validateDelete(trigger.old);
// }


//if(Trigger.isAfter && trigger.isInsert){
//  ContactTriggerHandler.passiveContacts(trigger.New);
//}
     

// if(Trigger.isBefore && trigger.isInsert){
//  ContactTriggerHandler.ExistContactUpdate(trigger.New);
// }


// if(Trigger.isAfter && trigger.isInsert){
// ContactTriggerHandler.createContactRelation(Trigger.New);
// }



    // before update, after insert, after update, after delete, after undelete

    //JIMMY QA SESSION
    //Create the trigger to have the custom rollup which will show the number of contacts associated 
    //with each account (Insert, Update, Delete, Undelete)
    
    // if((trigger.isAfter && trigger.isInsert) || (trigger.isAfter && trigger.isUndelete)){
    //     ContactTriggerHandler.afterInsert(Trigger.New);
    // }

    // if(trigger.isAfter && trigger.isUpdate){
    //     ContactTriggerHandler.afterUpdate(Trigger.New);
    // }

    // if(trigger.isAfter && trigger.isDelete){
    //     ContactTriggerHandler.afterDelete(Trigger.Old);
    // }


     // if (trigger.isUpdate && trigger.isBefore) {
            //     ContactTriggerHandler.descriptionsUpdate(trigger.new, trigger.oldMap);
            // }



    //future ile yapilan BURAK HOCA
    // if (trigger.isUpdate && trigger.isAfter) {
    //     Set<Id> conIds = new Set<Id>();
    //     if (ContactTriggerHandler.sayac) {
    //         for (Contact c : trigger.new) {
    //             if (c.LeadSource == 'Web' && c.LeadSource != trigger.oldMap.get(c.id).LeadSource) {
    //                 conIds.add(c.id);
    //             }
    //         }
    //         ContactTriggerHandler.updateOfContactsWithFuture(conIds);
    //     }    
    // }      


    

// if(Trigger.isAfter){
// ContactTriggerHandler.countContactsOnAcc(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
// }
   


// if(Trigger.isBefore && Trigger.isInsert){
//    AccountTriggerHandler.accConRelation(Trigger.New);
// }


// if(Trigger.isBefore){
//     ContactTriggerHandler.accountwithoutContact(Trigger.New, Trigger.OldMap);
// }



//Dont allow user to update Lead Source field

// if(Trigger.isBefore && Trigger.isUpdate){
//     ContactTriggerHandler.contactUpdateValidation2(Trigger.New, Trigger.old, Trigger.newMap, Trigger.OldMap);
// }



//Validation Rules on Trigger with ContactTriggerHandler
//Validate user when Contact LeadSource is 'Partner Referral'

// if(Trigger.isBefore && Trigger.isUpdate){
//     ContactTriggerHandler.contactUpdateValidation1(Trigger.New, Trigger.old, Trigger.newMap, Trigger.OldMap);
// }




    // if(trigger.isInsert){
    //     System.debug('Contact => Before Update Trigger Called');
    //     System.debug('Contact => Before Insert Trigger ');

    // }if(trigger.isUpdate){
    //     System.debug('Contact => Before Update Trigger Called');
    // }



// Jimmys Asssigment 
// Create  trigger on Contact should be executed on update. 
//print the contact records which were updated along with the old value and new value both. 
//Along with the same, I want to make sure and show that to users with the help of debug that the lastname of the contact is same or not among the old and new records for the updated records

//1.Yol

/*
    if(Trigger.isAfter && Trigger.isUpdate){
        for (Contact oldCon : Trigger.old) {
            for (Contact newCon : Trigger.new) {
                System.debug(' Old Contact Name  => '  + oldCon.LastName +' / => New Contact Name => ' + newCon.LastName);
                if (oldCon.LastName == newCon.LastName) {
                    System.debug('Old And New Contact Name is SAME!');
                } else {
                    System.debug('Contact Name Changed!');
                }
            }
        }
    } 

*/
    
/*
    //2.Yol = Map ile id den Value cekme yontemi ile

    if(Trigger.isafter && Trigger.isUpdate){
        Map<Key, Contact> newMap = Trigger.newMap;
        Map<Key, Contact> oldMap = Trigger.oldMap;

        for (id ConId :Trigger.newMap.keySet()) {
            Contact objNew = Trigger.newMap.get(ConId);
            Contact objOld = Trigger.oldMap.get(ConId);

            if(objNew.LastName != objOld.LastName ){
                System.debug('Contact Last name changed from ' + objOld.LastName + 'To ' + objNew.LastName );
            }
        }
    }
*/

//PREVENT DUPLICATE CONTACT BASED ON EMAIL
//BEFORE INSERT -BEFORE UPDATE

// Map<String, Contact> emailMap = new Map<String, Contact>();

//     for(Contact contact : trigger.new) {
//         if(trigger.isInsert) {            
//             emailMap.put(contact.Email, contact);
//         }
        
//         if(trigger.isUpdate && trigger.oldMap.get(contact.Id).Email != contact.Email) {
//             emailMap.put(contact.Email, contact);            
//         }
//     }
    
//     if(emailMap.isEmpty()) return;
//     List<Contact> existingContactList = [Select Id, Email FROM Contact Where Email IN :emailMap.keySet()];
//     if(existingContactList == null) return;
//     for(Contact contactRec : existingContactList) {
//         emailMap.get(contactRec.Email).addError('Email already Exist');
//     }






}