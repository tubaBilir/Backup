public with sharing class SalesforceProjectTriggerHandler {

    public static void validateProjectCompletion(List<Salesforce_Project__c> spTriggerNew,
    List<Salesforce_Project__c> spTriggerOld,
    Map<id,Salesforce_Project__c > spTriggerNewMap,
    Map<id,Salesforce_Project__c > spTriggerOldMap
    ) {
 
    //Find all projects which are completed
    //set ile idleri aliyorum cunku project obj sinin childlarini query de aratip kullanacagim bu yuzden bu id set lazim

    set<id> setCompletedProjectIds = new set<id>();

    for (Salesforce_Project__c eachSP : spTriggerNew) {
        if(spTriggerOldMap.get(eachSP.id).status__c != spTriggerNewMap.get(eachSP.id).status__c && eachSP.status__c == 'Completed'){
        setCompletedProjectIds.add(eachSP.id);
        }
    }

    //Bu yukaridan gelen salesforce project id leri icinde yer alan child ticketlarin; statusu completed OLMAYANLARA ulasmak icin query gerekiyor
    //Childlara ulasmak icin soql, soql de kullanmak icin set id

    List<Salesforce_ticket__c> stList =[Select id, name, status__c from Salesforce_ticket__c where Salesforce_Project__c in :setCompletedProjectIds and status__c != 'Completed' ]; // completed olmayan ticketlari verecek, bunlar icin bir validation yazacagiz cunku, git bunu complete yap sonra projeyi complete yap gibi

    //
    for (Salesforce_ticket__c eachST : stList) {

        if(setCompletedProjectIds.contains(eachST.Salesforce_Project__c)){

             Salesforce_Project__c  sp = spTriggerNewMap.get(eachST.Salesforce_Project__c); // Genel kural olarak Sadece new ya da newMape validation eklenir addError!! bu yuzden newmap ile ticketin projesine ulasildi

        sp.addError('Can not complete project because all tickets are not completed');

        }
    }
}


    //Create default Salesforce ticket record for when salesforce project is created(parent)
    public static void crateDefaultSalesforceticket(List<Salesforce_Project__c> spTriggerNew) { //<= List of parents
          
        List<Salesforce_ticket__c> newStList = new List<Salesforce_ticket__c>(); // Crate one empty list for salesforce tickets

        for ( Salesforce_Project__c eachSP : spTriggerNew) { // for each project 
            Salesforce_ticket__c st = new   Salesforce_ticket__c (); //create new ticket
            st.subject__c ='Default St';
            st.Salesforce_Project__c = eachSP.id; // Parent to child matching, assigning parent to parent ID!
            //Ticketin parentini . ile belirtiyoruz. Ticketin parenti = parentin id si ile eslestiriyoruz
            newStList.add(st);   // add in list
        }
        insert newStList;
    }

//FUTURE METHOD
    @future
    public static void updateProjectDescription(set<id> setSpId) {
        // we have ids, so fetch project records to update description
        List<Salesforce_Project__c> lstSP = [select id, description__c from Salesforce_Project__c where id in : setSpId ];

        for ( Salesforce_Project__c eachSP : lstSP) { // update olan projeleri getirir
            eachSP.description__c += 'Update from future'; //Descriptionlarini degistirir
            
        }
        update lstSP;

    }

    // pass set of ids, update all its tickets completed in this future method

    public static void spCompleteStatus(List<Salesforce_Project__c> spTriggerNew, List<Salesforce_Project__c> spTriggerOld, map<id,Salesforce_Project__c > spTriggerNewMap,map<id,Salesforce_Project__c > spTriggerOldMap ) {
        set<id> spIds = new set<id> ();
        for (Salesforce_Project__c spRecord : spTriggerNew) {
            if(spRecord.status__c == 'Completed' && spTriggerOldMap.get(spRecord.id).status__c != 'Completed'){
                spIds.add(spRecord.id);
            }
        }
        if(!spIds.isEmpty()){
            updateTicketStatusCompleted(spIds); // Alttaki metodu bu sekilde cagirabiliyoruz
        }
    }

// Future Method
    @future
    public static void updateTicketStatusCompleted(Set<id> spIds) {
        List<Salesforce_ticket__c> listSt =[select id, status__c, Salesforce_Project__c from Salesforce_ticket__c where Salesforce_Project__c in : spIds and status__c != 'Completed' ];
        for (Salesforce_ticket__c stRecord : listSt) {
            stRecord.status__c = 'Completed' ;
        }
        update listSt;
    }












}
