Map<string, string> zipCodeToCityMap = new Map<string, string> ();
zipCodeToCityMap.put('0102' , 'Mumbai');
zipCodeToCityMap.put('9802' , 'New Delhi');
zipCodeToCityMap.put('7103' , 'Istanbul');
zipCodeToCityMap.put('5104' , 'Sidney');

system.debug('My map of cities and zipcodes' + zipCodeToCityMap);

boolean checkMap = zipCodeToCityMap.containsKey('4589');
system.debug('Contains this key? for 4589 ' + checkMap);

set<string> myKeys = zipCodeToCityMap.keySet();
system.debug('My keys only Zip Codes in set' + myKeys);

list<string> myValues= zipCodeToCityMap.values();
system.debug('My values only cities in list' + myKeys);

integer myMapSize= zipCodeToCityMap.size();
system.debug('My value size in Map' + myMapSize); //6

set<string> uniqueZipCodeSet = new set<string>();
uniqueZipCodeSet.addAll(zipCodeToCityMap.keySet()); //7
system.debug(uniqueZipCodeSet);

list<string> cityNameList = new list<string>(); //8
cityNameList.addAll(zipCodeToCityMap.values());
system.debug(cityNameList);

Boolean checkIsEmpty = zipCodeToCityMap.isEmpty();
system.debug( 'My map is empty? ' + checkIsEmpty);

/* List => ordered values, uses index, can duplicate use get(index) to get value, use .add to add an element

 Map => key and value pairs, key must be unique, .keySet returns set , .values returns list, .get('key') returns key of value
 
 set => no duplicate if have override, not ordered, 
 
  */



map <string, decimal> currISOCodeAndExchangeRateMap = new map <string, decimal> ();

currISOCodeAndExchangeRateMap.put('AUD' , 0.73 );
currISOCodeAndExchangeRateMap.put('CAD' , 0.78 );
currISOCodeAndExchangeRateMap.put('EUR' , 1.13 );
currISOCodeAndExchangeRateMap.put('NZD' , 0.68 );

system.debug('My Map is => ' + currISOCodeAndExchangeRateMap);

decimal euroToUsd = currISOCodeAndExchangeRateMap.get('EUR');

system.debug(euroToUsd);

boolean containIsoCode = currISOCodeAndExchangeRateMap.containsKey('SAD');
system.debug('Is Sad Iso code present ' + containIsoCode);

set<string> moreThanOrEqualUsd = new set<string>();
set<string> lessThanUsd = new set<string>();
// mapin keyini alip forun icinde mapin bu setini dondurmek gerekiyor
set<string> allCurrencies = currISOCodeAndExchangeRateMap.keySet();
system.debug(allCurrencies);

for(string eachCurrency:  allCurrencies){  //all EUR, keyleri tarayacak
    system.debug(eachCurrency); // key in karsisina valuesunu yazmak icin diger seti de burada donduruyoruz
    decimal eachValue = currISOCodeAndExchangeRateMap.get(eachCurrency);//keyin valuesunu getiriyor
    system.debug(eachValue);

    if(eachValue >= 1){
        moreThanOrEqualUsd.add(eachCurrency);
         system.debug(moreThanOrEqualUsd);
    }
    else{
        lessThanUsd.add(eachCurrency);
        system.debug(lessThanUsd);
    }
}



