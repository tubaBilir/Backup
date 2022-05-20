//5 ulke key olarak, sehirler liste olarak map olustur

map<string, List<string>> citiesOfCountrys = new map<string, List<string>> ();

List<string> usaCities = new List<string> {'New York' , 'Washington DC' , 'La' , 'Austin'};
citiesOfCountrys.put('USA', usaCities);

list<string> turkeyCities = new List<string> {'Istanbul' , 'Ankara' , 'Bursa' , 'Izmir'};
citiesOfCountrys.put('TR', turkeyCities);

list<string> germanyCities = new List<string> {'Berlin' , 'Bonn' , 'Munih'};
citiesOfCountrys.put('GR', germanyCities);

list<string> ukCities = new List<string> {'London' , 'Edingburgh'};
citiesOfCountrys.put('UK', ukCities);

list<string> frCities = new List<string> {'Paris'};
citiesOfCountrys.put('FR', frCities);

system.debug(citiesOfCountrys);

//her ulkenin ismi ve yanina da kac sehri oldugunu yazsin


for(string country :citiesOfCountrys.keySet()){   //keyleri cagir
    system.debug(country);                        // keyleri tek satirda yazdir
    system.debug(citiesOfCountrys.get(country));  // keylerin sehirlerini yazdir
    system.debug(country + ' Ulkesinin sehir listesindeki sayi => ' +  citiesOfCountrys.get(country).size());
}

//sehir sayisi 3 ve daha fazla olan ulke isimlerini bir listede , 3 ten az olanlari baska listede goster

Set<string> moreThanThree = new set<string>();
Set<string> lessThanThree = new set<string>();

for(string country : citiesOfCountrys.keySet()){

    if(citiesOfCountrys.get(country).size() >=3 ){
    moreThanThree.add(country);
    }else{
    lessThanThree.add(country);
    }
}

system.debug('3 ten fazla sehri olan ulkeler ' + moreThanThree );
system.debug('3 ten az sehri olan ulkeler ' + lessThanThree );

//Sunday2 clasindan dml ile record olusturma

Sunday2.createOfAccount('Burak Hoca');

Sunday2.createOfAccount('Microsoft'); // contactlar microsft 1, microsoft 2 diye olusur for dan dolayi
Sunday2.createOfAccount('Amazon');//gercek isim olsun dersek liste olusturup for ile cekmek gerek
Sunday2.createOfAccount('Tesla');

//Pazar aksam dersi classiz apex

map<string, list<double>> cityofHot = new map<string, list<double>>();
list<double> istOfHot= new list<double>{11.4, 15.4, 21.4, 8.7, 22.6};
list<double> NYOfHot= new list<double>{2.2, 5.4, 1.4, 0.7, -2.6};
list<double> AlaskaOfHot= new list<double>{0.4, -0.7, -1.4, -1.7, -2.6};
list<double> ArabOfHot= new list<double>{33.4, 45.4, 21.4, 48.7, 37.6};

cityofHot.put('IST', istOfHot);
cityofHot.put('NY', NYOfHot);
cityofHot.put('ALS', AlaskaOfHot);
cityofHot.put('ARB', ArabOfHot);

system.debug(cityofHot);
system.debug(cityofHot.get('IST')); // mapteki keyin valuesunu yani burada listesini getirir

map<string, double> ortMap = new map<string, double>();

for(string city : cityofHot.keySet()){ //keyleri topladik city nin icine
    system.debug(city + ' sehri icin sicaklik degerleri ' + cityofHot.get(city)); //her sehir icin tekrar doner, map for dongusune bu sekilde girer
    double sum=0;
    for(double c : cityofHot.get(city) ){
        sum+= c;
    }
    double ort = sum/ (cityofHot.get(city).size());
    ortMap.put(city, ort);
}

system.debug( 'Sehirlerin ortalamalari' + ortMap);

//son 1 haftanın sıcaklık ortalamalarına göre 10 derecenin üstünde olan şehirleri bir liste 10 derece ve altındaki şehirleri ayrı liste olarak yazdırın.


set<string> less10 = new set<string> ();
set<string> more10 = new set<string> ();

for(string cty : ortMap.keySet() ){
    if(ortMap.get(cty) > 10){
        more10.add(cty);
    }else{
        less10.add(cty);
    }
}

system.debug('Sicaklik ortalamasi 10 dan buyuk sehirler ' + more10 );
system.debug('Sicaklik ortalamasi 10 dan kucuk sehirler ' + less10 );

}
