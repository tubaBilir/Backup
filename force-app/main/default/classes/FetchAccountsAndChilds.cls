//GET ACCOUNT AND CHILDS FROM WORKBENCH


@RestResource(urlMapping = '/fetchAccountsAndChilds') //for Inbound Call, create rest service
global with sharing class AccountsAndChildData {
    
    @HttpGet
    global static List<Account> fetchAllAccounts() {

        RestRequest reqInstance = RestContext.request; // for params
        Map<String, String> paramMap = reqInstance.params;

        String accountType = paramMap.get('type'); //type i null olanlari da getirir contact ve opp u olmayan, workbench de type belirtmezsen asagida dynami soql ile orunu nasil cozecegi kismi var

        List<Account> accountList = new List<Account>();

        /* Typical SOQL writing as a inner query */
        /* 
        if(String.isNotBlank(accountType) == true) {

            accountList = [SELECT id, Name ,Phone, Type,
                (SELECT id, name, email FROM contacts), 
                (SELECT id,name ,StageName ,CloseDate FROM Opportunities) 
                FROM Account WHERE Type =:accountType
            ];
        } else {
            accountList = [SELECT id, Name ,Phone, Type,
                (SELECT id, name, email FROM contacts), 
                (SELECT id,name ,StageName ,CloseDate FROM Opportunities) 
                FROM Account 
            ];
        } */


        String accountQueryString = 'SELECT id, Name ,Phone, Type, ' 
            + ' (SELECT id, name, email FROM contacts), '
            + ' (SELECT id,name ,StageName ,CloseDate FROM Opportunities) '
            + ' FROM Account';

        if(String.isNotBlank(accountType) == true) { // workbenchte eger type kismi yazilmamissa accounttype i bos olmayanlari getirecek artik dynamic query ile, type yazilirsa da o type ait olanlar opp ve contactlari olsun olmasin..
            accountQueryString = accountQueryString + ' WHERE Type = :accountType';
        }

        return Database.query(accountQueryString);
    }

//POST ACCOUNT AND CHILDS FROM Postman

    @HttpPost
    global static void createAccountAndChilds() {

        /*public static JSON2Apex parse(String json) {
            return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
        } */

        RestRequest reqInstance = RestContext.request; //Context of request

        String requestBody = reqInstance.requestBody.toString(); //Request Body In String format

        /* Deserialising the request body to the wrapper instance */
        AccountAndChildWrapper wrapperInstance = (AccountAndChildWrapper) 
            (JSON.deserialize(requestBody, AccountAndChildWrapper.class)); //jason.deserialize convert string to wrapperformat and takes 2 param
        
        if(wrapperInstance != null && wrapperInstance.account != null) { // converting to wrapper to myinstance and inserting

            Account accountInstance = new Account(
                Name = wrapperInstance.account.name,
                Type = wrapperInstance.account.type,
                Phone = wrapperInstance.account.phone
            );

            insert accountInstance;

        }


        //How we will be getting parent account value from contact
        /* 
        contactInstance.Account.Name
        */
        /* Sample Request Body */
        /*
        {
            "account" : {
                "name" : "abc",
                "type" : "asa",
                "phone" : "8765"
            },
            "contact" : {
                "firstname" : "first",
                "lastname" : "last",
                "email" : "test@test"
            }, 
            "opportunity" : {
                "name" : "tey",
                "stageName" : "Closed",
                "closeDate" : "6754678" //bu listeyi thirpartye developer veriyor hazirlayip
            }
        } // bunu apexe convert etmek icin -> Json2apex.herekuapp.com/ provide values /asagidki listeyi verecek otomatik olarak
        */
        

    }

    public class AccountAndChildWrapper {
        public AccountWrapper account;
        public ContactWrapper contact;
        public OpportunityWrapper opportunity;
    }

    public class AccountWrapper {
        public String name;
        public String type;
        public String phone;
    }

    public class OpportunityWrapper {
        public String name;
        public String stageName;
        public String closeDate;
    }

    public class ContactWrapper {
        public String firstname;
        public String lastname;
        public String email;
    }
}