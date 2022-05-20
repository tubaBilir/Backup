public with sharing class DeleteClosedLostOppsBatch implements Database.Batchable<SObject> {

// Son 14 gunde update edilmemis closed Lost opp lari sil

    public Database.QueryLocator start (Database.BatchableContext bc){ // void degil cunku return verecek burada opplari getirmesi icin query yapilacak 
        Database.QueryLocator a = Database.getQueryLocator([Select id, name from Opportunity where StageName = 'Closed Lost' AND LastModifiedDate < LAST_N_DAYS:14]); // metotta kullanilan fieldlar burada soql ile cagrilir
        return a; //opplari return etti

    }

    public void execute(Database.BatchableContext bc, List<Opportunity> scope){ // buradaki scope a nin icindekiler olacak, scope ile karsiladim bu listeyi
        if(scope.size()> 0){
            delete scope;
        }
    }

    public void finish (Database.BatchableContext bc){
        System.debug('Islem tamamlandi');        //apexte bunu cagirmak gerekiyor simdi clas ismi ile obje olusturup
    }


}



