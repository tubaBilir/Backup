public with sharing class OpportunityTriggerHandler {


    // *Write a script to get the total Quantity of Products sold in only Accounts Working in = Emea
    // *Write a Trigger to stop creating or updating Opportunities with Account having “Working in = Emea” and Already 2 Closed Won Opportunity under same Account.
    //child uzerinden parenta git konrol et childi update et


    public static void getTotalProductQty(List<Opportunity> triggerNew) {

        List<Account> accList = [select id, name,(select id, stageName, TotalOpportunityQuantity from Opportunities where stageName = 'Closed Won') from Account where Working_in__c = 'EMEA'];

        for (opportunity opp : triggerNew) {
            for (Account acc : accList) {
                if( acc.id == opp.AccountId && acc.Opportunities.size() > 1){
                    system.debug(acc.Opportunities.size());
                    opp.addError('No');
                }
            } 
        }
    }




    //@Future
   /*1. Create some custom fields 
    a. 'Target Amount' - Field Type: Currency
    b. 'Total Amount Generated'  - Field Type: Currency
    c. 'Highest Amount Opportunity Name'  - Field Type: Text
    d. 'Target Amount Achieved Opportunity Name' - Field Type: Text 
    on Account Object.
    
    görevler:
    A. Amountta "Highest Amount Opportunity Name" alanını güncelleyin
    Opportunity İsimleri arasında en yüksek tutara(Amounta) sahip isim olmalı.
    B. Closed Won olanlardan Tutar alanındaki(Amount) değer 'Target Amount'dan fazla ise Accountta 'Target Amount Achieved Opportunity Name' güncelleyin
    C. Accountta 'Total Amount Generated' Closed Won olan tüm opportunity lerin Tutar(Amount) toplamını yazacağız.*/
    
    @future
    public static void updateHighestAmountOpportunityName(Set<Id> accountIds) {
        List<Account> accList = new List<Account>();
        accList = [select id, name, Highest_Amount_Opportunity_Name__c,(select id, name, Amount from Opportunities order by Amount Desc) from Account where id in :accountIds];
        for (Account acc : accList) {
            if (acc.Opportunities.size()>0) {
                acc.Highest_Amount_Opportunity_Name__c = acc.Opportunities[0].name;
            }
        }
        update accList;
    }

    @future
    public static void updateTargetAmountAchievedOppName(Set<Id> accountIds) {
        List<Account> accList = new List<Account>();
        accList = [select id, name, Highest_Amount_Opportunity_Name__c, Target_Amount__c, Target_Amount_Achieved_Opportunity_Name__c, (select id, name, Amount from Opportunities where stageName = 'Closed Won' order by Amount Desc) from Account where id in :accountIds];
        for (Account acc : accList) {
            if (acc.Opportunities.size()>0) {
                if (acc.Opportunities[0].Amount >= acc.Target_Amount__c ) {
                    acc.Target_Amount_Achieved_Opportunity_Name__c = acc.Opportunities[0].name;
                }
            }
        }
        update accList;
    }

    @future
    public static void updateTotalAmountGenerated(Set<Id> accountIds) {
        List<Account> accList = new List<Account>();
        accList = [select id, name, Total_Amount_Generated__c,  (select id, name, Amount from Opportunities where stageName = 'Closed Won') from Account where id in :accountIds];
        for (Account acc : accList) {
            Decimal totalAmount = 0;
            for (Opportunity op : acc.Opportunities) {
                totalAmount += op.Amount;
            }
            acc.Total_Amount_Generated__c = totalAmount;
        }
        update accList;
    }



//CREATE CHILD WHEN PARENT UPDATED AND UPDATE CHILD FIELDS
//Create a Task whenever opportunity is updated to closed/won and Amount is more than 10000. Populate Task record fields in the following manner:
//Subject = "Opportunity Closed", WhatId = Opportunity recordId, OwnerId = Opportunity OwnerId, Status = 'New' and Type = 'Call'.

    public static void crateTaskOpp(List<Opportunity> TriggerNew, List<Opportunity> TriggerOld, map<id, Opportunity> TriggerNewMap, map<id, Opportunity> TriggerOldMap) {
    
        List<Task> listOfTasks = new List<Task>();

        for (Opportunity opp : TriggerNew) {
            if(opp.stageName =='Closed Won' && opp.Amount > 10000){ 
                task myTask = new Task();
                myTask.Subject ='Opportunity Closed';
                myTask.WhatId = Opp.id;
                myTask.OwnerId =opp.OwnerId;
                myTask.Status = 'New';
                myTask.type= 'Call';
                listOfTasks.add(myTask);
            }
        }
        insert listOfTasks;
    }





    //Create a validation rule with the help of trigger which does not allow to update the stage of an opportunity once it is closed/won or closed/lost. For closed/won user should get error message as “Stage cannot be changed from Closed/won” and for closed/lost user should get error message as “Stage cannot be changed from Closed/Lost” 

public static void stageValidation(List<Opportunity> TriggerNew, map<id, Opportunity> TriggerOldMap) {

    for (Opportunity opp : TriggerNew) {
        if (opp.StageName !=TriggerOldMap.get(opp.id).stageName && opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost') {
            if (opp.StageName == 'Closed Won' ) {
                opp.stageName.addError('Stage cannot be changed from Closed/won');
            }
            if (opp.StageName == 'Closed Lost' ) {
                opp.stageName.addError('Stage cannot be changed from Closed/Lost');
            }
        }
    }
}


//Make use of the logic implemented for question 1 and fulfil the following requirement: When the Stage Name of an opportunity is updated to Closed Lost, then update the description field as “Opportunity is lost. Please log a case with investigation team to start investigation.”


    public static void oppCloseDate3(List<Opportunity> triggerNew, map<id, Opportunity> TriggerOldMap) {

        for (Opportunity opp : triggerNew) {
            if(opp.StageName != TriggerOldMap.get(opp.id).stageName &&
             opp.StageName == 'Closed Lost'){
                opp.Description = 'Opportunity is lost. Please log a case with investigation team to start investigation';
            } 
        }
    }


//Whenever new Opportunity is created with stage Name as closed won or closed lost, then set close Date as today otherwise set closed date as 15 days from today.


    public static void oppCloseDate(List<Opportunity> triggerNew) {

        for (Opportunity opp : triggerNew) {
            if(opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost'){
                opp.CloseDate = Date.today();
            } else{
                opp.CloseDate = Date.today().addDays(15) ;
            }
        }
    }

//Whenever Opportunity’s stage name is updated to closed won or closed lost, then set the close date as today.

public static void oppCloseDate2(List<Opportunity> triggerNew, map<id, Opportunity> triggerOldMap) {

    for (Opportunity opp : triggerNew) {
        if(opp.StageName != triggerOldMap.get(opp.id).stageName && 
        opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost'){
            opp.CloseDate = Date.today();
        } 
    }
}


//when insert new opp opp.Name must have type and lead source

public static void nameTypeLeadSource(List<Opportunity> triggerNew) {

    for (Opportunity eachOpp : triggerNew) {
        eachOpp.Name = eachOpp.Name + '-' + eachOpp.Type + '-' + eachopp.LeadSource;
    }
}

//PARENTIN CHILDININ FIELD (AMOUNT) TOPLAMLARINI PARENTA YAZ
//opportunitynin Amountu update edildiğinde bağlı olduğu accountun tüm opportunitilerinin Amount toplamları Accountun Description kısmına yazılsın.
    
    public static void totalAmountOfDescription(List<Opportunity> triggerNew, map<id, Opportunity> triggerOldMap){
     //Accountun id lierini toplayacak set olustur
        set<id> accIds = new set<id>();
        for(Opportunity opp : triggerNew){
            if(opp.Amount != triggerOldMap.get(opp.id).Amount){ //Amount update edilmis mi? Edilmisse...
                accIds.add(opp.AccountId); //Edilmisse bu opplarin Accountunun id lerini sette topla
            }
        }
        //Amountu update edilen opp larin bagli oldugu acountlar kendisine bagli op larla beraber listelenir
        List<Account> accList = [select id, name, description, (Select id, name, amount from Opportunities) from Account where id in : accIds ]; //lISTE ICINDEKI LISTEYE ULASMAK ICIN FOR ICINDE FOR! => INNER QUERY DE BIR LISTE CUNKU

        for(Account acc : accList){
            decimal total =0;
            //Accounta bagli opp lara ve onlarin amountuna tek tek ulasmak icin
            for(Opportunity opp : acc.Opportunities){ // Accountlarin opportunitylerinin icine girmis olduk bu opplarin amountunu toplami lazim
                total+=opp.Amount; //boyle de yazilabilir => total = total + opp.Amount;
            }
            acc.Description = 'Tum opportunitylerin amount toplamlari ' + total; //butun opplarin amountu toplanir ve accountun description a eklenir
        }
        update accList;
    }
}
