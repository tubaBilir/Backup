public with sharing class RentalUnit {
    
    public static void afterInsert(List<Rental_Agreement> TriggerNew){
        Set<Id> RentalUnit = new Set<Id>();

        for(Rental_Agreement rntAgg : TriggerNew){
            RentalUnit.add(rntAgg.RentalUnitId);
        }

        List<RentalUnit> lstRntUnit = [select Id, Name, active_c, (select id from Rental_Agreement_r)  FROM RentalUnit WHERE Id IN : RentalUnit];

        for(RentalUnit rU : lstRntUnit){
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }

        if(lstAccount.size() > 0){
            update lstAccount;
        }
    }

    

    public static void afterDelete(List<Contact> lstContacts){
        system.debug(lstContacts);
        Set<Id> setOfAccount = new Set<Id>();
        for(Contact con : lstContacts){
            setOfAccount.add(con.AccountId);
        }

        List<Account> lstAccount = [select Id, Name, Number_of_Contacts__c, (select id from contacts)  FROM Account WHERE Id IN : setOfAccount];
        system.debug('###lstAccount=='+lstAccount); 
        for(Account acc : lstAccount){
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }

        if(lstAccount.size() > 0){
            update lstAccount;
        }
    }
}
