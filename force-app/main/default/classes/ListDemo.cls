public class ListDemo {

    public static string candidatesList(integer i) {
        //creating empty list of string
        List <string> listCandidates = new List<string>();
        listCandidates.add('Aina');
        listCandidates.add('Marala');
        listCandidates.add('Zeynep');
        listCandidates.add('Birol');
        system.debug('Candidates are ' + listCandidates);
        string returnString = '';
        if ( i < listCandidates.size()){
            return returnString = listCandidates[i];
        } else {
            returnString = 'No Value founded';
        }
        return returnString;
    }

    public static void randomIntegerList(){
        List <integer> listInteger = new List<integer>();
        listInteger.add(10);
        listInteger.add(20);
        listInteger.add(30);
        listInteger.add(40);

        // indexe ulasmak icin
        // ikinci yol listInteger.get(3)
        integer index3Value = listInteger[3];

        system.debug('Index 3 value is ' + index3Value);
        system.debug('Random Integers are ' + listInteger);
    }
    List <string> myList = new List<string>();


    public static void allCats(){
        Cat falconsCat = new Cat('Fluffykins ' , 'White');
        Cat vitapsCat = new Cat('Simba ' , 'Brown');
        Cat sumitsCat = new Cat('Smokey ', 'Gray');
    
        List <Cat> cats = new List <Cat>();
        cats.add(falconsCat);
        cats.add(vitapsCat);
        cats.add(sumitsCat);
        system.debug(cats);
        
    }


    public static void iterateIntegerList(){
        List <integer> listInteger = new List<integer>();
        listInteger.add(10);
        listInteger.add(20);
        listInteger.add(30);
        listInteger.add(40);

        for (integer eachInteger : listInteger) {
            System.debug(eachInteger);
        }

    }
    

    
}
