@isTest
public with sharing class LeadTriggerTest { //100% code coverage
    @isTest
    public static void leadSourceWebTest() {

        List<Lead> myLead = new List<Lead>();

        Lead ld = new Lead ();
        ld.LastName = 'sdd';
        ld.Company = 'fdgdg';
        ld.LeadSource = 'Web';
        ld.Rating = 'Cold';
        myLead.add(ld);

        Lead ld2 = new Lead ();
        ld2.LastName = 'ggfg';
        ld2.Company = 'asdsa';
        ld2.LeadSource = 'Other';
        ld2.Rating = 'Hot';
        myLead.add(ld2);

        insert myLead;

    }
}
