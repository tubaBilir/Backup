public class SoqlDeneme {

    public static void onChildStandard(){
    list<Contact> contactList = [select name, Languages__c , Title, account.SLA__c, account.Type, account.ownership 
    from Contact ];

    for(Contact myCon : contactList ){
    system.debug('My contact name=> ' + myCon.name + ' Languages => ' + myCon.Languages__c + ' Title => ' + myCon.Title + ' Account SLa => '+ myCon.account.SLA__c + ' Account type => ' + myCon.account.Type);
    }
    }

    public static void onChildCustom(){
    list<Salesforce_Ticket__c> sfTicketList = [select subject__c, status__c , priority__c, Salesforce_Project__r.status__c, Salesforce_Project__r.name 
    from Salesforce_Ticket__c ];

       for(Salesforce_Ticket__c eachSfTicket : sfTicketList ){
           system.debug('Salesforce Ticket subject ' + eachSfTicket.subject__c + ' SF Ticket status ' + eachSfTicket.status__c + ' SF Ticket priority ' + eachSfTicket.priority__c + ' Parent SF Projects status ' + eachSfTicket.Salesforce_Project__r.status__c);
       }
     }

     // parent to child on standard, have to use inner query with(child)

    public static void onParentStandard(){
    list<Account> accList = [select name, SLA__c, type,
    (select lastName from Contacts where lastName like 'G%' )
    from Account];    // child parantez icinde 
    }

    // parent to child on custom objects

    public static void onParentCustom() {
    list<Salesforce_project__c> SfProjectList =[select id, name, project_name__c ,(select name, priority__c from Salesforce_tickets__r) // __r koyuluyor child icin
    from Salesforce_project__c];
        
    }

//Soql Advance => Group by stage/ Having Count(id)>1 / Select Sum(Amount)

 



    
}
