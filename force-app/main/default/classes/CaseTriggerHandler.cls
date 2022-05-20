public with sharing class CaseTriggerHandler {






//Ismail beyin flow odevi (TAMAMLANMADI!)
// public static void stableCases(List<Case> TriggerNew, Map<id, Case> TriggerOldMap ) {

//     Set< Case> caseList = new  Set<Case>();
//     for (Case cs : TriggerNew) {
//         if (cs.Status == TriggerOldMap.get(cs.id).status) {
//             caseList.add(cs);
//         }
//     }
//     list<Case> stblCaseList = [Select id, status, OwnerId from Case where id in :caseList and lastModifiedDate < LAST_N_DAYS : 7];

//        List<Unprogressed_Case__c> pmList = new List<Unprogressed_Case__c>();
       
//         for (Case eachCase : stblCaseList) {
//           Unprogressed_Case__c pm = New Unprogressed_Case__c();
//           pm.Text__c = eachCase.id;
//           pmList.add(pm);  
//         }
//     insert pmList;

//     list<Case> CaseOwner = [Select Id, COUNT(OwnerId) from Case where id in :stblCaseList group by OwnerId HAVING COUNT(OwnerId) > 1];
    
// }





//Whenever a case is created with origin as email then set status as Escalated and Priority as High.

public static void Caseorigin(List<Case> TriggerNew) {
    for (Case cs : TriggerNew) {
       if(cs.Origin == 'Email'){
           cs.Status = 'Escalated';
           cs.Priority = 'High';
       }
    }
}




}
