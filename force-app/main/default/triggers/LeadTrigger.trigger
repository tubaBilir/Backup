trigger LeadTrigger on Lead (before insert, after insert, before update, after update, before delete) {


  if(trigger.isAfter && trigger.isUpdate){
    LeadTriggerHandler.ReparentChildsIfParentDuplicate(Trigger.New );
  } 

  // if(trigger.isBefore && trigger.isDelete){
  //   LeadTriggerHandler.DeleteParent(Trigger.Old, Trigger.new);
  // }




      

//VALIDATE DUPLICATE EMAIL
//Write a trigger to prevent duplicate lead records by checking lead email. If a record has already been created with the same email or record is updated then trigger should give an error.
//before insert, before update

//   if(trigger.isBefore){
//     if(trigger.isInsert){  
//       LeadTriggerHandler.ValidateDuplicate(trigger.new);
//     }
//     if(trigger.isUpdate){ 
//       LeadTriggerHandler.ValidateDuplicate(trigger.new);
//     }    
//   }
// else if(trigger.isAfter){
//     system.debug('after method');
// }     



//whenever lead created convert account, contact and opportunity

//  List<SObject> records = new List<SObject>();

//     for (Lead ld : trigger.new) {
//         Contact cnt = new Contact(LastName = 'SSSSSS');
//         Account acc = new Account(Name ='OOOOOO');
//         Opportunity opp= new Opportunity(Name = 'KKKKKK', stageName = 'Prospecting', CloseDate = system.today());
//         records.add(cnt);
//         records.add(acc);
//         records.add(opp);
//     }

//     insert records;












//When the leads are inserted to the database, it should add Dr. for all lead names. 
//Should be applicable for both inserting and updating the lead records

// List<Lead> leadList = Trigger.new;
// if(Trigger.isInsert || Trigger.isUpdate){
//     for(Lead l : leadList){
//         if(!l.FirstName.contains('Dr.')){
//             l.FirstName = 'Dr.' + l.FirstName;
//             System.debug(l.FirstName);
//         }
//     }
// }
   

  // if(Trigger.isBefore && Trigger.isInsert){
  //     LeadTriggerHandler.leadSourceWeb(Trigger.New);
  // }


}