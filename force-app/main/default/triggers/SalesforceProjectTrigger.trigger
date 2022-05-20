trigger SalesforceProjectTrigger on Salesforce_project__c (before insert, after insert, before update, after update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        SalesforceProjectTriggerHandler.validateProjectCompletion(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
    }

    if(Trigger.isAfter && Trigger.isInsert){
//Create default salesforce_ticket- child for Salesforce project (Parent)

    SalesforceProjectTriggerHandler.crateDefaultSalesforceticket(Trigger.new);
// Calling future method 
    set<id> setids = trigger.newMap.keySet();
    System.debug('Sp ids ' + setids);
    SalesforceProjectTriggerHandler.updateProjectDescription(setids);

    }

    if(Trigger.isAfter && Trigger.isUpdate){
        SalesforceProjectTriggerHandler.spCompleteStatus(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);

    }




}