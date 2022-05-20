@isTest
public with sharing class DmlDemo2Test {
    @isTest
        public static void dmlDemoTest3() {
//preapare data
        salesforce_project__c sp = new  salesforce_project__c();
        sp.Project_Name__c = 'Learn Apex';
        sp.description__c ='High';
        sp.status__c ='Learn apex';
       
        insert sp;

        //if we consume 10 dml 10 soql for preparing data
        //All governor limits reset cpu Time heapSize..
        //RESET Governor limits before calling this method
        //Test.startTest(); //Only in TestClass
        //Test.stopTest();

        //Call method
        DmlDemo2.dmlUpdateDemo_2_co();

   // Assertion
        List<salesforce_ticket__c> st = [select id, subject__c, salesforce_project__c, priority__c from salesforce_ticket__c where subject__c = 'Learn apex'];

        system.assertEquals(1, st.size());
        
    }

    @isTest
    public static void multipleMethod() {
        DmlDemo2.dmlMultipleRecordInsert();

    }


     public static void dmlDemoTest3Test() {
//preapare data
        salesforce_project__c sp = new  salesforce_project__c();
        sp.Project_Name__c = 'Learn Apex';
        sp.description__c ='High';
        sp.status__c ='Learn apex';
       
        insert sp;

        //Call method
        DmlDemo2.dmlUpdateDemo_2_co();

   // Assertion
        List<salesforce_ticket__c> st = [select id, subject__c, salesforce_project__c, priority__c from salesforce_ticket__c where subject__c = 'Learn apex'];

        system.assertEquals(1, st.size());
        
    }


        










}
