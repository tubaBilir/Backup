public with sharing class SetDemo {

    public static void citySet() {
        set<string> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Nairobo');
        cities.add('Tokyo');
        cities.add('Berlin');
        cities.add('nairobi'); // duplicate olanlari yazdirmaz
        System.debug('Set of Cities are ' + cities);
    }

    public static void randomIntegerSet(){
        set<integer> setinteger = new set<integer> ();
        setinteger.add(20);
        setinteger.add(10);
        setinteger.add(10);
        setinteger.add(58);
        setinteger.add(58); // duplicate olanlari yazdirmaz
        System.debug('Set of integers = ' + setinteger );
    }

    public static set<integer> setFromList(list <integer> iL){
        set<integer> s = new  set<integer>();
        s.addAll(iL);
        return s;
    }




}
