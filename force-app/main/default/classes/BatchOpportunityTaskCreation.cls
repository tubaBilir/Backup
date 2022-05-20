public with sharing class BatchOpportunityTaskCreation implements Database.Batchable<Sobject> {
   
//Write a logic to Create tasks for all the opportunities other than the closed won or closed lost and on which there was no activity since last 7 days.Populate the task field values as follows:
// Subject- Other(Create Custom Label)
// Due Date -Today if Opportunity close date is already passed otherwise Opportunity Close Date – 2 days.
// Comments -Reminder – Please act on the Opportunity(Create Custom Label)
// Related To Opportunity Id
// Assigned To Opportunity Owner Id
// Status In Progress 
    
    public Database.QueryLocator start(Database.BatchableContext bc) {

        Database.QueryLocator q = Database.getQueryLocator([select id, OwnerId, CloseDate from Opportunity where LastModifiedDate < LAST_N_DAYS:7 and (stageName !='Closed Lost' or stageName !='Closed Won')]);

        return q;
    }
    
    public void execute(Database.BatchableContext bc, List<Opportunity> scope){ // Create Task execute de yapiyoruz
        List<Task> taskList = new  List<Task>();
        for (opportunity opp : scope) {
            Task tk = new Task();
            tk.Subject = system.label.taskSubject; // custom labelda create edilen isimle
            tk.Description =  system.label.comments; // custom labelda create edilen isimle
            tk.WhatId = opp.id;
            tk.OwnerId = opp.OwnerId;
            tk.Status = 'In Progress';
            if(opp.CloseDate < date.today()){
                tk.ActivityDate = Date.Today();
            }else{
               tk.ActivityDate = opp.CloseDate/addDays(-2);
            }
            taskList.add(tk);
        }
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }

    public void finish(Database.BatchableContext bc){
        
    }

//Anonymousta cagirmak gerekir herhangi bir anonymous olabilir
//clas ismi ile new instance olusturup database.executeBatch(instance ismi, batch sayisi (bu optional))
//Anonymousta cagirmadim
// Assigmentin devami => Write a Schedulable class to schedule the above created batch from Apex scheduler in salesforce. Schedule the batch so that it runs once in a week on every Monday 1pm.
// Create new clas = OpportunityTaskCreationSchedule gereken skeletonu yaz
//Bu BatchClasi cagir 
// Sonra UI'dan apex clasa git, schedule apex>apex clas ismini gir, schedule et, save et
//Check etmek icin Home dan jobs a git, scheduled Jobstan kontrol et manage dan zamani gunu degistirebilirsin



//BATCH GENERAL SYNTAX

// global class classname implements Database.Batchable<sObject> {

//     global (Database.QueryLocator | Iterable<sObject>) start(Database.BatchableContext bc) {
//        // collect the batches of records or objects to be passed to execute
//     }
 
//     global void execute(Database.BatchableContext bc, List<sObject> records){
//        // process each batch of records
//     }
 
//     global void finish(Database.BatchableContext bc){
//        // execute any post-processing operations
//     }
//  }


















}
