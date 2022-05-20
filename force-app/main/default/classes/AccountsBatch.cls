public with sharing class AccountsBatch implements Database.batchable<SObject>, database.Stateful { // Database.stateful ile baska bir interface i implement etmemiz gerek, kac tanesinin descriptionu degismis saymak icin bunu kullanacagiz 

    public Integer count=0; // class variable outside of class  statefullu saymak icin bunu koyduk

 //Mandatory start, execute, and finish methods
//start method is Collecting records; islem yapacagimiz recordlari getirir
    public Database.QueryLocator start(Database.BatchableContext bc) { //starttan onceki data type , start parametre aliyor
        Database.QueryLocator q1 = database.getQueryLocator([select id,description from account]); //Pageination
        return q1; //void olmadigi icin return var
    }
    //Execute method will take list of sObject which we are querying in start method
    public void execute(Database.BatchableContext bc, List<account> scope){ //scope ta yukaridaki soql den gelen accountlar var ikinci parametre olarak
    List<account> updateAccounts = new list<account>();
    for(account acc : scope){ //soql den gelenler accountlari tek tek aliyoruz
        acc.description += '...updated via abatch apex'; //update ediyoruz
        updateAccounts.add(acc);
        count++;      // descriptionu degisen accountlari sayacak ilk transaction da 10 olacak, sonra 20...
    }
    if(!updateAccounts.isEmpty()) //Execution kismi 1000 record varsa tekrar tekrar bitene kadar calisir
        update updateAccounts; // Bu kisimda default oalrak 200 er 200er update edecek, anonymousta cagirirken belirttigin rakam adetince de degisebilir
    }
    //finish method will run after the entire batch is over
    public void finish(Database.BatchableContext bc){// Burada email gondermek vs gibi islemler gerceklesir eger execute de send email logici yazilmissa
        system.debug('done with updating all the accounts');
        system.debug('Total Number of records Updated:   ' + count); 
    }
}

// Batchable apex baska clastan da cagirilabilir, anonymoustan da cagrilabilir
// Buraya kadar olan kismi cagirmak icin yeni anonymous olusturup su sekilde cagirmak gerek


// AccountBatch accBatch = new AccountBatch();
// Database.executeBatch(accBatch, 10); // 10 veya 200 kacli cagirmak isteniyorsa



