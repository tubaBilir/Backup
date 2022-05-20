public class Sunday {
    public static void printEleman(list<integer> myList) {
        system.debug('Listemin elemanlari' + myList);
        for (integer item : myList) {
            system.debug(item);
        }
    }

    public static void printName(list<string> nameList){
        if (!nameList.isEmpty()) {
            for (string nm : nameList) {
                system.debug(nm);

            }
        } else {
            system.debug('Tanimli bir liste gonderin');
            
        }

    }

//listeyi tersten siralamak icin

public static void printReverse(list<string> nmList){
    if (!nmList.isEmpty()) {
        integer sz = nmList.size();
        for (Integer i = sz-1; i >= 0 ; i--) {
            System.debug(nmList.get(i));
        }
    } else {
        system.debug('Tanimli bir liste gonderin');
    }



}

}
