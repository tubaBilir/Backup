@isTest
public with sharing class Sunday2Test { //100% Code Coverage
    @isTest
    public static void createOfAccountTest() {
       Sunday2.createOfAccount('Tarantino');//Tekrar new account yazmaya gerek yok zaten metotta var

       //Contactlarini da olusturdu metot Parametreden gonderilen isimle

       //Burada Run edince %100

       ///ama bunlarin olusup olusmadigni kontrol icin soql ve system.assertEqual

       List<Account> accList = [Select id, name from Account];

       system.assertEquals('Tarantino', accList[0].name);

       
       List<Contact> conList = [Select id, lastName from Contact];

       system.assertEquals(5, conList.size());
       system.assertEquals('Contact1', conList[0].lastName, 'Contactin last namei kontrol'); //Metotta isim boyle belirtilmis bu sekilde kontrol ediyoruz, mesaj ile de net gormek icin 

        

        

    }
}
