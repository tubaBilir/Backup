@isTest
public class DMLVitapTest {

    //Record insert etmez bunu kontrol icin soql ile gecici bir database den getirir
    @isTest
    private static void dmlDemoTest1(){
        DMLVitap.dmlInsertDemo_stndObj(); // bir insert yapan bir metot bu yuzden expected insert 1 record

        List<Account> listAcc = [select id, name from Account]; // Bu soql test database inden recordu getirecek sanki create edilmis gibi, ancak bu sekilde kontrol edebiliriz cunku gercekte bir record yok. bu islem tamamlandiginda TEST DATABASE SILINIR

        system.assertEquals(1, listAcc.size()); // metot 1 record insert ediyor
        system.assertEquals('SoftInnovas' ,listAcc[0].Name ); // metotta belirtilen isim 'softinnovas'

    }
    @isTest
    public static void dmlDemoTest2() {
        Account acc = new Account();
        acc.name= 'SoftInnovas Inc';
        insert acc; //Database de herhangi bir account vs yok, bos bu yuzden bir account girmek gerekir ki asagidaki metotta gecen account ile ilgili verileri alabilsin
    
        DmlDemo2.dmlUpdateDemo_2();
    
        List<Contact> listContact =[select id, lastname from Contact];
        system.assertEquals(1, listContact.size());
        system.assertEquals('Biden', listContact[0].LastName);
    
    }

  



    




}
