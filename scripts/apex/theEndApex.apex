try{
List<Integer> numList = new List<Integer>{1,5,7,11};
System.debug(numList[10]);  //try in icine yazilmazsa hata verir islem durur
}catch (Exception e){ //try icine yazilirsa hatayi log da gosterir helloyu da yazar islem durmaz code calisir
 System.debug(e);
}
System.debug('Hello');


//Custom Settings - COUNTRY CODE

Map<string, country_code__c> countryCode = country_code__c.getAll();
System.debug(countryCode);

for (string cntry  : countryCode.keySet()) {
    System.debug('Key  =>' + cntry);// ulke isimlerini tek tek getirir
    System.debug('Values => ' + countryCode.get(cntry));// uzun bir liste getirir butun fieldlari yan yana dizerek last mod date,created date vs
    System.debug('Only Codes = > ' + countryCode.get(cntry).country_code__c); // sadece country codelari getirir tek tek
}

//Custom Settings - Sehir Plakalari

Map<string, City_Code__c> cityPlaka = City_Code__c.getAll();

for (string ct  : cityPlaka.keySet()) {
    System.debug('Key sehir =>' + ct);
    System.debug('Plakalar value = > ' + cityPlaka.get(ct).Plaka__c); 
}


// Hierarchy Custom Settings


