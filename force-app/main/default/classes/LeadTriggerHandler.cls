public with sharing class LeadTriggerHandler {

//When duplicates lead are found based on email, re-parent all the child records to the oldest record (remove all the tasks from other records) and delete the duplicate records apart from the oldest record.
//Advanced-after update

public static void ReparentChildsIfParentDuplicate(List<Lead> TriggerNew) {

    List<Lead> leadList = [select id, name, email, CreatedDate, (Select id from Tasks) from Lead ];
    List<Task> taskList = [select whoId from Task where WhoId in: leadList];
 
    for (Lead ld : TriggerNew) {
        for (Lead ld2 :leadList ) {
            if(ld.Email == ld2.email){
                if(ld.Tasks.size() > 0){
                    for(task t : taskList){
                        if(t.WhoId == ld.id  && ld.CreatedDate > ld2.CreatedDate){
                            t.WhoId = ld2.id;
                        }if(t.WhoId == ld2.id  && ld2.CreatedDate > ld.CreatedDate){
                            t.WhoId = ld.id;
                        }
                    } 
                }
            }
        }
    }
}




public static void DeleteParent(List<Lead> TriggerOld, List<Lead> TriggerNew) {

    List<Lead> leadList = [select id, name, email, CreatedDate, (Select id from Tasks) from Lead ];
    List<Task> taskList = [select whoId from Task where WhoId in: leadList];
    
    List<Lead> deleteLead = new List<Lead>();

    for (Lead ld : TriggerNew) {
        for (Lead ld2 :leadList ) {
            if(ld.Email == ld2.email){
                if(ld.Tasks.size() > 0){
                    for(task t : taskList){
                        if(t.WhoId == ld.id && ld.CreatedDate < ld2.CreatedDate){
                            t.WhoId = ld.id;
                        }if(t.WhoId == ld2.id && ld2.CreatedDate < ld2.CreatedDate){
                            t.WhoId = ld2.id;
                        }
                    } 
                }
            }
            if(ld2.CreatedDate < ld.CreatedDate){
                deleteLead.add(ld);
            }else {
                deleteLead.add(ld2);
            }
        }
    }
    Database.delete (deleteLead);

    
}










    
//VALIDATE DUPLICATE EMAIL
//Write a trigger to prevent duplicate lead records by checking lead email. If a record has already been created with the same email or record is updated then trigger shouldgive an error.
//before insert, before update
    // public static void ValidateDuplicate(List<Lead> triggerNew){

    //     Set<String> setEmail = new Set<String>();
    //     List<Lead> leadList=[Select Id, Email From Lead Where Email != null];

    //     for(Lead d1:leadList){
    //         setEmail.add(d1.Email);// sistemdeki leadlerin emaillerini getir
    //     }

    //     for (Lead lead : triggerNew) { // yeni create edilen leadin 
    //         if(setEmail.contains(lead.Email)){ // emaili, soql deki set emailinde varsa 
    //             lead.Email.addError('Duplicate Email'); //hata ver
    //         } 
    //     }
    //}
          



    



//Whenever a Lead is created with Lead Source as Web then give rating as cold otherwise hot.

    // public static void leadSourceWeb(List<Lead> TriggerNew) {
    //     for (Lead cs : TriggerNew) {
    //         if(cs.LeadSource == 'Web'){
    //             cs.Rating = 'Cold';
    //         } else {
    //             cs.Rating ='Hot';
    //         }
    //     }
    // }



    //LEAD CONVERSION TO ACCOUNT AND CONTACT AND OPP (FROM INTERNET)

//     Map<String, Contact> contMap = new Map<String, Contact>();
//     Set contEmailSet = new Set();
    
//     for(Contact contObj: trigger.new){
//        if(contObj.Email != null){
//          contMap.put(contObj.Email, contObj);
//          contEmailSet.add(contObj.Email);
//        }
//     }


//     Map<String, Lead> leadMap = new Map<String, Lead>();

//     if(contEmailSet.size() > 0){

//         for(Lead leadObj: [Select Id, Name, Email, isConverted from Lead Where Email in: contEmailSet]){

//             Database.LeadConvert lc = new Database.LeadConvert();

//             lc.setLeadId(leadObj.Id);
//             lc.setAccountId(contMap.get(leadObj.Email).AccountId);
//             lc.setContactId(contMap.get(leadObj.Email).Id);
//             lc.setDoNotCreateOpportunity(true);

//             LeadStatus convertStatus = [SELECT Id, MasterLabel, IsConverted FROM LeadStatus WHERE IsConverted=true limit 1];
//             lc.setConvertedStatus(convertStatus.MasterLabel);

//             try{
//                 Database.LeadConvertResult lcResults = Database.convertLead(lc);
//             }Catch(Exception exp){
//                 contMap.get(leadObj.Email).addError(exp.getMessage());
//             }
//         }
//     }
// }
















}
