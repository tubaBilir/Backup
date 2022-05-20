@isTest
public with sharing class SalesforceProjectTriggerHandlerTest {
@isTest
    private static void crateDefaultSalesforceticketTest() {
        List<Salesforce_Project__c> spList = new List<Salesforce_Project__c>();
        Salesforce_Project__c sp1 = new Salesforce_Project__c();
        sp1.Project_Name__c = 'Proje 1';
        sp1.status__c = 'New';
        spList.add(sp1);

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'Proje 2';
        sp2.status__c = 'Testing';
        spList.add(sp2);
        insert spList;

        SalesforceProjectTriggerHandler.crateDefaultSalesforceticket(spList); //100% code coverage
    }


    @isTest
    private static void validateProjectCompletionTest() {

        List<Salesforce_Project__c> spList = new List<Salesforce_Project__c>();

        Salesforce_Project__c sp1 = new Salesforce_Project__c();
        sp1.Project_Name__c = 'Proje 1';
        sp1.status__c = 'New';
        spList.add(sp1);

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'Proje 2';
        sp2.status__c = 'Testing';
        spList.add(sp2);
    
        insert spList;
 
        list<Salesforce_ticket__c> stlist = new   list<Salesforce_ticket__c>();

        for ( Salesforce_Project__c eachSp : spList) {
            Salesforce_ticket__c st = new Salesforce_ticket__c();
            st.Salesforce_Project__c = eachSp.id ;
            st.subject__c= ' gdg';
            stlist.add(st);
        }
        insert stlist;

        spList[0].status__c = 'Completed';
        update spList;

        if(stlist[0].status__c != 'Completed'){
            spList[0].addError('Can not complete project because all tickets are not completed');
        }

    }

//future metotlar gibi asynchronic metotlari test ederken 
// test.startTest()
// classismi.metotismi(list) 
// test.stopTest() yazilmazsa hata verir
// 
}
