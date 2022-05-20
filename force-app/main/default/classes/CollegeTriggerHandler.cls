public with sharing class CollegeTriggerHandler {


    // PArent silindiginde ilgili child recordlari da sil
    //Student Child, College Parent

    public static void removeStudents(Set<Id> collegeIds) {
        delete [select id from Student__c Where College__c In : collegeIds]; //silinmekte olan parentin id lerini iceriyorsa sil
    }
}



//Triggeri:

//triggerCollegeTrigger on College__c(before delete){
//     if(Trigger.isBefore){
//         if(Trigger.isDelete){
//             CollegeTriggerHandler.removeStudents(Trigger.oldMap.keySet());
//         }
//     }
// }
