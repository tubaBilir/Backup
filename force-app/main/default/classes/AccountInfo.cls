public class AccountInfo {

    public static void accMethod() {

        List<Account> accList = [Select id, Name, phone, AccountNumber from Account where name like '%A%' and AccountNumber != null ];

        for (Account eachAccount : accList) {
                     System.debug('Account Name is => ' + eachAccount.name + ' //Account Number is => ' + eachAccount.AccountNumber + ' // Account Phone number is =>' + eachAccount.Phone);
        }
    }

    public static void SfProject () {
        list<Salesforce_Project__c> sfPro = [select id, Project_Name__c , Status__c from Salesforce_Project__c where  Status__c = 'In-Progress' ];

        for (Salesforce_Project__c customSF : sfPro) {

        System.debug('Salesforce project id ' + customSF.id + ' Project Name is ' + customSF.Project_Name__c + ' Status is ' + customSF.Status__c);

        }
    }

    public static void sfTickets() {
        list<Salesforce_Ticket__c> custSfTickets = [select id, name, Subject__c, status__c from Salesforce_Ticket__c where status__c = 'In Development' ORDER BY name desc ];
        for (Salesforce_Ticket__c sft : custSfTickets) {

            System.debug('Salesforce ticket id ==> ' + sft.id + ' Salesforce name is ==> ' + sft.name + ' Subject ==> ' + sft.Subject__c + 'Status is ==> ' + sft.status__c );
        }
   
        
    }












}
