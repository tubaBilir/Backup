ListSetMap.Market();

List<integer> myInt = new List<integer>();
myInt.add(9);
myInt.add(3);
myInt.add(2);

integer sum = ListSetMap.toplam(myInt);
system.debug(sum);

    set<string> movies = new set<string>();
    movies.add('Kill Bill');
    movies.add('Django');
    movies.add('West Cost');

   system.debug(ListSetMap.cinema(movies)); // buyuk harf yapmadi {} extra geldi

// Maps

map< integer, string > driverLicence = new map< integer, string > ();
driverLicence.put(741, 'Ed Stark');
driverLicence.put(852, 'John Snow');
driverLicence.put(963, 'Arya Stark');

system.debug(driverLicence.get(852)); // key'in valuesu gelir, variable yazacaksak integer belirtmek gerek
system.debug(driverLicence.values()); // butun valuelar list olarak gelir
system.debug(driverLicence.keySet()); // butun keyler set olarak gelir

list<string> forValue = driverLicence.values();
system.debug(forValue); //Variable atanmis valuelar list olarak donecek

set<integer> forKey = driverLicence.keySet();
system.debug(forKey); // variable atanmis; keyler set olarak donecek

// for each loop for map

for (integer eachDL : forKey ) {
    string printMessage = 'Driver Licence no = ' + eachDL;
    string eachPerson = driverLicence.get(eachDL);

    printMessage += ' its name is ' + eachPerson;

    system.debug(printMessage);
}

system.debug(ListSetMap.retrieveMonth(9));







