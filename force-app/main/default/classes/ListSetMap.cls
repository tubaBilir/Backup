public  class ListSetMap {
//non parameterized, iterate with for each loop
    public static void Market() {
        list<string> fruits = new  list<string> ();
        fruits.add('elma');
        fruits.add('armut');
        fruits.add('uzum');
        fruits.add('muz');
        for (string allFruits : fruits) {
            system.debug(allFruits);
        }
    }
// parameterized method, static, listedeki butun rakamlari toplayan for loop 

public static integer toplam( list<integer> numList) {
    integer sonuc = 0;
    for (integer calculator : numList) {
        sonuc += calculator;
    }  return sonuc;
}

public static set<string> cinema (set<string> mychoice ){

    set<string> movies = new set<string>();

    for (string favorite : mychoice) {

        system.debug(favorite);

        //string buyukHarf = favorite.capitalize();
        //movies.add(buyukHarf);

    } return movies; // buyuk harf yapmadi

}

public static string retrieveMonth(integer m){
    string month;

    map< integer, string> monthMap = new map< integer, string>();
    monthMap.put(1, 'Ocak');
    monthMap.put(2, 'Subat');
    monthMap.put(3, 'Mart');
    monthMap.put(4, 'Nisan');
    monthMap.put(5, 'Mayis');
    monthMap.put(6, 'Haziran');

    monthMap.put(7, 'Temmuz');
    monthMap.put(8, 'Agustos');
    monthMap.put(9, 'Eylul');
    monthMap.put(10, 'Ekim');
    monthMap.put(11, 'Kasim');
    monthMap.put(12, 'Aralik');

    boolean keyExist = monthMap.containsKey(m);
    if(keyExist){
        month = monthMap.get(m);
    }else 
        month = 'Boyle bir ay yok';

    return month;
}


}
