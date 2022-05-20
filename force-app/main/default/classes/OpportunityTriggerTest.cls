@isTest
public with sharing class OpportunityTriggerTest { //%36 Code Coverage
    @isTest
    public static void oppCloseDateTest() {

        List<Opportunity> oppList = new List<Opportunity>();

        Opportunity opp = new Opportunity();
        opp.name ='Test Opp';
        opp.StageName ='Closed Won';
        opp.Amount = 15000;
        opp.CloseDate = date.today();
     
    
        oppList.add(opp);

        Opportunity opp2 = new Opportunity();
        opp2.name ='Test Opp2';
        opp2.StageName ='Prospecting'; // metotta else var bunu da blue yapmak icin else i de satisfy edecek bir data giriyorsun
        date dt = date.today().addDays(15);
        opp2.CloseDate = dt ;
        oppList.add(opp2);

        Opportunity opp3 = new Opportunity();
        opp3.name ='Test Opp3';
        opp3.StageName ='Closed Lost'; 
        date dt2 = date.today().addDays(15);
        opp3.CloseDate =dt2;
        oppList.add(opp3);
     
        insert oppList; // test run edildiginde insert ile ilgili triggerlar tetiklenir ,triggerin handleri ile metota gider onu calistirir


        // Opportunity myOpp = [Select id, name, OwnerId from Opportunity where name like 'Test Opp'];
        // List<Task> TaskList = new List<Task>();
        // Task opTask = new Task();
        // opTask.Subject = 'Opportunity Closed';
        // opTask.WhatId = myOpp.id;
        // opTask.status = 'New';
        // opTask.OwnerId= myOpp.OwnerId;
        // opTask.type = 'Call';
        // TaskList.add(opTask);

        // insert TaskList;



        for (Opportunity opp1 : oppList) {
            opp1.Description = 'Demo test';
            //update oldugunda metotta istenen stage namein degismis olmasi bu yuzden if yaziyoruz
            if(opp1.StageName =='Closed Won'){
                opp1.StageName = 'Closed Lost';
                opp.Description ='Opportunity is lost. Please log a case with investigation team to start investigation';

            }

            if(opp1.StageName =='Closed Lost'){
                opp1.StageName = 'Prospecting';

            }
         
        }
       
        update oppList;
    
    }
}
