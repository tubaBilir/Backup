public class DmlDemo2 {


    public static void dmlUpdateDemo_2() {
        Account acc= [select id, name from Account where name = 'SoftInnovas Inc' limit 1 ];
        contact cnt = new  contact();
        cnt.lastName= 'Biden';
        cnt.AccountId =acc.id;
        insert cnt;

    }

    public static void dmlUpdateDemo_2_co() {
        //latest project
        salesforce_project__c sp= [select id from salesforce_project__c
        order by createdDate desc limit 1];
        //create tickete instance

        salesforce_ticket__c st=new  salesforce_ticket__c();
        st.Subject__c = 'Learn Apex';
        st.priority__c ='High';
        st.status__c ='New';
        st.salesforce_project__c=sp.id;
        insert st;
        System.debug('Salesforce Ticket ' + st);
    }



    public static void dmlMultipleRecordInsert() {
        list<account> listAccount = new   list<account>();

        account acc= new account();
        acc.name='Soft Innovas 28 Feb v0';
        acc.AccountNumber ='acb-12';
        acc.active__c ='Yes';
        System.debug('Before saving acc ' + acc);
        listAccount.add(acc);

        for (integer i = 1; i<15 ; i++) {
            account acc2= new account();
            acc2.name='Soft Innovas 28 Feb v' + i;
            acc2.AccountNumber ='acb-12' +i ;
            acc2.active__c ='Yes';
            listAccount.add(acc2);
        }
        System.debug('Size of list ' + listAccount.size());
        if(!listAccount.isEmpty()){
            insert listAccount;
        }
    }

    //updateing exist record once liste ile getir ,sonra yeni liste ile update recordlar icin 

    public static void dmlMultipleRecordUpdate() {
        //get list accouunt via query
        list<Account> listAcc = [select id, name from account where createdDate = Today ];
        list<account> updateAccounts = new list<account>();

        for (account acc : listAcc) {
            acc.name= acc.name + 'Via B.0';
            // acc.Description = 'Test update'; queryde yazmadik cagiramayiz
            updateAccounts.add(acc);
        }
        if(!updateAccounts.isEmpty()){
            update updateAccounts;
        }
    }

    public static void deleteAcc() {
        list<account> listACC = [select id, name from account where createdDate =  Today];
        //delete[select id, name from account where createdDate = Today];
        Delete listACC;
    }






}

