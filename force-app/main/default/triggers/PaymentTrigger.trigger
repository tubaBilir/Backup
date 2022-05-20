trigger PaymentTrigger on Payments__c (before insert, before update, after insert, after update, after delete, after undelete) {

    if((trigger.isAfter && trigger.isInsert) || (trigger.isAfter && trigger.isUndelete)){ // hem isertte, hem Recyledan gelen paymentlari da parentta guncellesin diye 
        PaymentTriggerHandler.onlinePaymentAfterInsert(Trigger.New);
    } // Yeni payment girildiginde parentin ilgili fieldina ekleyecek

    if(trigger.isAfter && trigger.isUpdate){
        PaymentTriggerHandler.onlinePaymentAfterUpdate(Trigger.New);
    } // Payment update oldugunda da parentin fieldini update edecek

    if(trigger.isAfter && trigger.isDelete){
        PaymentTriggerHandler.onlinePaymentAfterDelete(Trigger.Old);
    } // Payment silindiginde de parentin fieldini update edecek

    if(trigger.isAfter && Trigger.isInsert){
        PaymentTriggerHandler.totalCashPaymentAfterInsert(Trigger.New);
    }

    if(trigger.isAfter && Trigger.isUpdate){
        PaymentTriggerHandler.totalCashPaymentAfterUpdate(Trigger.New, Trigger.OldMap);
    }




}