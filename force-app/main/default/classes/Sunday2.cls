public class Sunday2 {
    
    public static void createOfAccount(string nameOfAccount) {
        account acc = new Account();
            acc.Name = nameOfAccount ;
            insert acc; // bir account olusturduk dml ile paremeterized olarak burak hocayi apexe yazdik

           /* aynı metot o Accounta bağlı 5 tane de contact create etsin first name accountun ismi olsun last name 'Contact' olsun ve 1 2 3 4 5 şeklinde sıralı isimlendirme olsun*/

           list<Contact> listCnt = new list<Contact>(); // bos liste olusturduk dml ile listeyi insert etmek icin for'dan gelen contactlar burada duracak

     for (integer  i=1 ; i < =5 ; i++) { 
         contact cnt = new Contact();
         cnt.FirstName = acc.Name;
         cnt.LastName = 'Contact' + i;
         cnt.AccountId = acc.id; // her contact olustugunda accounta bagliyoruz, ayni accounta
         listCnt.add(cnt);
        }

        //insertten once if ile bos mu diye bakilir kural olarak
        if (!listCnt.isEmpty()) {
            insert listCnt; // listeyi insert edecek asla for un icinde yazilmaz insert
        }
  

//aynı metotun içinde son oluşturduğumuz 5 contactı getirecek bir sorgu yazın. Account name leri ile beraber getirsin.


list<Contact> conList = [select id, name, account.name from Contact order by createdDate desc limit 5]; // childdan parenta gidilecek
System.debug('Son olusturulan contact list => ' + conList);

}


}
