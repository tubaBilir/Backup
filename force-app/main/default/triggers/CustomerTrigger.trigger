trigger CustomerTrigger on Customer__c (before insert, after insert, before update, after update, before delete) {

    // if(Trigger.isBefore && Trigger.isDelete){
    //     CustomerTriggerHandler.deletePayment(Trigger.Old);
    // }

}