set<string> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Tokyo');
        cities.add('Berlin');
        cities.add('nairobi');

   set<string> city2 = SetDemo2.upperCaseSet(cities);
   system.debug(city2);
