public with sharing class UnProgressedOpportunity implements Database.Batchable<SObject>, Database.Stateful{

    //BATCHABLE APEX!!!

    /*2. Closed Won ve Closed Lost dışındaki tüm Opportunity ler için 7 gündür herhangi bir işlem görmemişse bir task yazın.Task için;
    Subject :  Other
    Due Date : Opportunity close date bugünden önce ise Due Date bugünün tarihi olsun değilse due date kapanış tarihinden 2 gün öncesi olsun.
    Comments : Reminder – Please take action on the Opportunity
    Related To (WhatId): Opportunity OwnerId
    Assigned To : Opportunity Owner
    Status : In-Progress*/

    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator a = Database.getQueryLocator([select id, name, ownerId, closeDate from Opportunity Where StageName != 'Closed Won' and StageName != 'Closed Lost' and LastModifiedDate < LAST_N_DAYS:7]);
        return a;
    }

    public void execute(Database.BatchableContext bc, list<Opportunity> scope){
        List<Task> tasksList = new  List<Task>();
        for (Opportunity opp : scope) {
            Task tk = new Task();
            tk.Subject = 'Other';
            tk.Description = 'Reminder - Please take action on the Opportunity';
            tk.WhatId = opp.id;
            tk.OwnerId = opp.OwnerId;
            tk.Status = 'In-Progress';
            if (opp.CloseDate < Date.today()) {
                tk.ActivityDate = Date.today();
            } else {
                tk.ActivityDate = opp.CloseDate.addDays(-2);
            }
            tasksList.add(tk);
        }
        if (!tasksList.isEmpty()) {
            insert tasksList;
        }

    }

    //EMAIL GONDERMEK ICIN SABLON!! HER CLASA BU SEKILDE COPY PASTE YAPILABILIR

    public void finish(Database.BatchableContext bc){
        AsyncApexJob a = [SELECT Id,Status,JobType,NumberOfErrors,JobItemsProcessed,TotalJobItems,CompletedDate,ExtendedStatus FROM AsyncApexJob WHERE Id =:BC.getJobId()];
            
          
           List<User> userList = new List<User>();
           userList = [SELECT Id,Email,IsActive FROM User WHERE Profile.Name = 'System Administrator' AND IsActive = True] ;
            
         // Send an email to all active Admins notifying of job completion.
             
             for(User u : userList)
             {           
                 Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

                 mail.setTargetObjectId(u.Id);
                 mail.setSubject('Updating Monthly Plan Opportunity Batch - ' + a.Status);
                 mail.setSaveAsActivity(false);
                 mail.setPlainTextBody
                 ('The batch Apex job completed on  ' + a.CompletedDate + ',\n\n' +
                 'Job Status : ' + a.Status + '\n'+
                 'Total Job Items processed : ' + a.TotalJobItems + '\n'+
                 'Number of Job Items processed : ' + a.JobItemsProcessed + '\n' +
                 'Number of Failures : '+ a.NumberOfErrors);
                 Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
              }        
    }
}