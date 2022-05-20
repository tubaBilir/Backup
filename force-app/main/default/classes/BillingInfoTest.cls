@isTest
public class BillingInfoTest {

    @isTest
    public static void test1() {

        BillingInfo calculateBillingDate = new BillingInfo();  // New Instance
 //    Class ismi / metot (integer, date) alan non static metot      
        
        date myDate = Date.newInstance(2021, 8, 7); //parametre olarak gonderecegim tarih
        date expDate = Date.newInstance(2021, 10, 7); //metot isleyince gelmesi gereken hesapladigim sonuc
        date dt =  calculateBillingDate.calcNextBillingDate(2, myDate); //parametreleri girilmis metodun donecegi date'i system assertte kontrol etmem icin date -> data typina metodumu assign ediyorum
      
        system.assertEquals(expDate, dt); 

    }

    //100% Code Coverage

    //method static degilse class ismiyle yeni bir instance olustur
    //Sonra bu instance isimle.methodu cagir 

    //eger VOID degil RETURN var ise ise assertEqual ile sonucu check etmemiz gerekiyor

    // Eger return Bollean ise veya if Conditionda donecek bir cok secenek varsa ayni metot icinde farkli isimle her bir secenek icin ayri ayri condition yani new instance -> object olusturulur donecek returnun data typina gore



}
