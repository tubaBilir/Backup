trigger CaseTrigger on Case (before insert, before update, after insert, after update) {


  

/*

if(Trigger.isBefore && Trigger.isInsert ){
    CaseTriggerHandler.Caseorigin(Trigger.New);
}

*/

/*   
    if(Trigger.isInsert){
            System.debug('Before insert Case triggger');
    }

if(Trigger.isUpdate){
    integer count =0;
    count++;
    System.debug('count =' + count);
    CaseTriggerHandler.countTriggerExecution++;
    System.debug('Actual count = ' + CaseTriggerHandler.countTriggerExecution);
}
*/


/*
    System.debug('We are in the triggers');
   
    if(trigger.isAfter){
        System.debug('We are in the after triggers');
    }

    if(trigger.isBefore){
        System.debug('We are in the before triggers');
    }

    if(trigger.isBefore && trigger.isUpdate){
        System.debug('We are in the before Update triggers');
        for(Case Cs : trigger.new){
            System.debug( 'Case # ' + cs.CaseNumber +  'was created with id ' + cs.Id + 'On ' + cs.CreatedDate );
        }
    }

    if(trigger.isBefore && trigger.isInsert){
        System.debug('We are in the before Insert triggers');
    }

    if(trigger.isAfter && trigger.isUpdate){
        System.debug('We are in the after update triggers');

        for(Case Cs : trigger.new){
            System.debug( 'Case # ' + cs.CaseNumber +  'was created with id ' + cs.Id + 'On ' + cs.CreatedDate );
        }
    }

    if(trigger.isAfter && trigger.isInsert){
        System.debug('We are in the after insert triggers');
        for(Case Cs : trigger.new){
            System.debug( 'Case # ' + cs.CaseNumber +  'was created with id ' + cs.Id + 'On ' + cs.CreatedDate );
        }
    }

*/




}