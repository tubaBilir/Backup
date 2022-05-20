map<string, string> mapCountryCurrency = new map<string, string>();

mapCountryCurrency.put('USA', 'Dollar');
mapCountryCurrency.put('Japan', 'Yen');
mapCountryCurrency.put('France', 'Euro');
mapCountryCurrency.put('India', 'Rupee');
mapCountryCurrency.put('Turkey', 'Lira');
mapCountryCurrency.put('El Salvador', 'Bitcoin');

System.debug('Map of country vs currency' + mapCountryCurrency);

string indianCur = mapCountryCurrency.get('Turkey');
string turkCur = mapCountryCurrency.get('USA');

system.debug( 'Indian Currency is ' + indianCur);
system.debug('Turkey Currency is ' + turkCur);

// getting list of keys only in map .keySet();          
// set cunku keys duplicate olamaz
set<string> countries= mapCountryCurrency.keySet();
system.debug('Countries' + countries);

// getting just list of values .values();
// list olarak cagiririz cunku list duplicate olabilir
list<string> currencyList = mapCountryCurrency.values();
system.debug('Countries' + currencyList);


for(string country : countries){
    System.debug( 'Each country = '+ country);
    string eachCurrency = mapCountryCurrency.get(country);
    system.debug('Currency is ' + eachCurrency);

}
